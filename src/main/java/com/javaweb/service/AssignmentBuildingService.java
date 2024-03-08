package com.javaweb.service;

import com.javaweb.model.dto.AssignmentBuildingDTO;

import java.util.List;

public interface AssignmentBuildingService {
    void deleteAllByBuildingId(List<Long> buildingIds);

    void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
