package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    private RentAreaRepository rentAreaRepository;

    @Override
    public BuildingEntity save(BuildingEntity buildingEntity, String rentArea) {
        String[] rentAreaList = rentArea.split(",");
        List<RentAreaEntity> rentAreaEntities = new ArrayList<>();
        for(String it : rentAreaList){
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setValue(Long.parseLong(it));
            rentAreaEntity.setBuilding(buildingEntity);
            rentAreaEntities.add(rentAreaEntity);
        }
        buildingEntity.setRentAreaEntities(rentAreaEntities);
        rentAreaRepository.saveAll(rentAreaEntities);
        return buildingEntity;
    }
}
