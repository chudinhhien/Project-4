package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;
import java.util.stream.Collectors;

@Repository
public class BuildingRepositoryCustomImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    public static void joinTable(BuildingSearchRequest buildingSearchRequest, StringBuilder sql) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            sql.append(" INNER JOIN assignmentbuilding ab ON b.id = ab.id ");
        }
//        List<String> typeCode = buildingSearchRequest.getTypeCode();
//        if (typeCode != null && typeCode.size() != 0) {
//            sql.append(" INNER JOIN buildingrenttype br ON b.id = br.buildingid ");
//            sql.append(" INNER JOIN renttype rt ON rt.id = br.renttypeid ");
//        }
        // Thay thế bằng EXIST
//		String rentAreaTo = (String) params.get("areaTo");
//		String rentAreaFrom = (String) params.get("areaFrom");
//		if (StringUtil.checkString(rentAreaFrom) || StringUtil.checkString(rentAreaTo)) {
//			sql.append(" INNER JOIN rentarea ra ON ra.buildingid = b.id ");
//		}
    }

    public static void queryNormal(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
//		for (Map.Entry<String, Object> it : params.entrySet()) {
//			if (!it.getKey().equals("staffId") && !it.getKey().equals("typeCode") && !it.getKey().startsWith("area")
//					&& !it.getKey().startsWith("rentPrice")) {
//				String value = (String) it.getValue();

//			}
//		}
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId") && !fieldName.startsWith("area") && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchRequest);
                    if (value != null && !value.equals("")) {
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND b." + fieldName + "=" + value);
                        } else {
                            where.append(" AND b." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchRequest buildingSearchRequest, StringBuilder where) {
        Long staffId = buildingSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND ab.staffid = " + staffId);
        }
        Long rentAreaTo = buildingSearchRequest.getAreaTo();
        Long rentAreaFrom = buildingSearchRequest.getAreaFrom();
        if (rentAreaFrom != null || rentAreaTo != null) {
            where.append(" AND EXISTS (SELECT * FROM rentarea ra WHERE b.id = ra.buildingid ");
            if (rentAreaFrom != null) {
                where.append(" AND ra.value >= " + rentAreaFrom + " ");
            }
            if (rentAreaTo != null) {
                where.append(" AND ra.value <= " + rentAreaTo + " ");
            }
            where.append(") ");
        }

        Long rentPriceTo = buildingSearchRequest.getRentPriceTo();
        Long rentPriceFrom = buildingSearchRequest.getRentPriceFrom();
        if (rentPriceFrom != null || rentPriceTo != null) {
            if (rentPriceFrom != null) {
                where.append(" AND b.rentprice >= " + rentPriceFrom);
            }
            if (rentPriceTo != null) {
                where.append(" AND b.rentprice <= " + rentPriceTo);
            }
        }

        List<String> typeCode = buildingSearchRequest.getTypeCode();
        if (typeCode != null && typeCode.size() != 0) {
            // List<String> code = new ArrayList<>();
            // java7
//			for(String item : typeCode) {
//				code.add("'" + item + "'");
//			}
//			where.append(" AND rt.code IN(" + String.join(",", code) + ") ");

            // java8
//            String code = typeCode.stream().map(item -> "'" + item + "'").collect(Collectors.joining(","));
//            where.append(" AND rt.code IN(" + code + ") ");
            String type = typeCode.stream().collect(Collectors.joining(","));
            where.append(" b.type LIKE " + "'" + type + "' ");
        }

    }

    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchRequest) {
        // TODO Auto-generated method stub
        StringBuilder sql = new StringBuilder(
                "SELECT b.* FROM building b ");
        joinTable(buildingSearchRequest, sql);
        System.out.println(sql);
        StringBuilder where = new StringBuilder(" WHERE 1=1 ");
        queryNormal(buildingSearchRequest, where);
        querySpecial(buildingSearchRequest, where);
        where.append(" GROUP BY (b.id)");
        sql.append(where);
        Query query = entityManager.createNativeQuery(sql.toString(),BuildingEntity.class);
        return query.getResultList();
    }
}
