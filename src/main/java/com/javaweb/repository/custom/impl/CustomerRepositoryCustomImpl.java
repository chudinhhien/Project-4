package com.javaweb.repository.custom.impl;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.sql.SQLOutput;
import java.util.List;

@Repository
public class CustomerRepositoryCustomImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;
    public static void joinTable(CustomerSearchRequest customerSearchRequest,StringBuilder sql){
        if(customerSearchRequest.getStaffId()!=null){
            sql.append(" INNER JOIN assignmentcustomer ac ON ac.customerid = c.id ");
        }
    }

    public static void queryNormal(CustomerSearchRequest customerSearchRequest,StringBuilder where){
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for(Field item: fields){
                item.setAccessible(true);
                String fieldName = item.getName();
                if(!fieldName.equals("staffId")){
                    Object value = item.get(customerSearchRequest);
                    if(value != null && !value.equals("")){
                        if (item.getType().getName().equals("java.lang.Long") || item.getType().getName().equals("java.lang.Integer")) {
                            where.append(" AND c." + fieldName + "=" + value);
                        } else {
                            where.append(" AND c." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception ex){
            ex.printStackTrace();
        }
    }

    public static void querySpecial(CustomerSearchRequest customerSearchRequest,StringBuilder where){
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId != null) {
            where.append(" AND ac.staffid = " + staffId);
        }
    }
    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");
        joinTable(customerSearchRequest,sql);
        StringBuilder where = new StringBuilder(" WHERE 1 = 1 ");
        queryNormal(customerSearchRequest,where);
        querySpecial(customerSearchRequest,where);
        where.append(" AND c.is_active = 1 GROUP BY (c.id)");
        sql.append(where);
        System.out.println(sql);
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }
}
