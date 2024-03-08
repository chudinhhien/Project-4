package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Override
    public void deleteAllByBuildingId(List<Long> ids) {
        rentAreaRepository.deleteAllByBuilding_IdIn(ids);
    }

    @Override
    public void deleteByBuildingId(Long id) {
        rentAreaRepository.deleteByBuildingId(id);
    }

    @Override
    public void save(BuildingEntity buildingEntity, String rentArea) {
        String[] rentAreaList = rentArea.split(",");
        for(String it : rentAreaList){
            RentAreaEntity rentAreaEntity = new RentAreaEntity();
            rentAreaEntity.setBuilding(buildingEntity);
            rentAreaEntity.setValue(Long.parseLong(it));
            rentAreaRepository.save(rentAreaEntity);
        }
    }
}
