package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Map;

public interface RentAreaService {
    void deleteAllByBuildingId(List<Long> ids);

    void deleteByBuildingId(Long id);
    void save(BuildingEntity buildingEntity, String rentArea);
}
