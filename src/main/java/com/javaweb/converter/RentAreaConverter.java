package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.utils.StringUtils;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class RentAreaConverter {
    public List<RentAreaEntity> toRentAreaEntities(String rentAreaString, BuildingEntity buildingEntity){
        if(StringUtils.check(rentAreaString)){
            List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
            String[] rentAreaList = rentAreaString.split(",");
            for(String it : rentAreaList){
                RentAreaEntity rentAreaEntity = new RentAreaEntity();
                rentAreaEntity.setValue(Long.parseLong(it));
                rentAreaEntity.setBuilding(buildingEntity);
                rentAreaEntities.add(rentAreaEntity);
            }
            return rentAreaEntities;
        }
        return null;
    }
}
