package com.javaweb.service.impl;

import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignmentBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Transactional
@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private AssignmentBuildingRepository assignmentBuildingRepository;

    @Autowired
    private BuildingRepository buildingRepository;

    @Autowired
    private UserRepository userRepository;
    @Override
    public void deleteAllByBuildingId(List<Long> buildingIds) {
        assignmentBuildingRepository.deleteAllByBuilding_IdIn(buildingIds);
    }

    @Override
    public void updateAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        assignmentBuildingRepository.deleteAllByBuildingId(assignmentBuildingDTO.getBuildingId());
        BuildingEntity building = buildingRepository.findById(assignmentBuildingDTO.getBuildingId()).get();
        for(Long staff : assignmentBuildingDTO.getStaffs()){
            AssignmentBuildingEntity assignmentBuilding = new AssignmentBuildingEntity();
            UserEntity staffEntity = userRepository.findById(staff).get();
            assignmentBuilding.setBuilding(building);
            assignmentBuilding.setStaff(staffEntity);
            assignmentBuildingRepository.save(assignmentBuilding);
        }
    }
}
