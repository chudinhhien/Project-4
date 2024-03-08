package com.javaweb.repository;

import com.javaweb.entity.AssignmentBuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AssignmentBuildingRepository extends JpaRepository<AssignmentBuildingEntity, Long> {
    void deleteAllByBuilding_IdIn(List<Long> buildingIds);
    void deleteByBuildingId(Long buildingId);

    void deleteAllByBuildingId(Long buildingId);
}
