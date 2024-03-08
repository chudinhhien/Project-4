package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.entity.AssignmentBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional
public class BuildingServiceImpl implements BuildingService {
    @Autowired
    BuildingRepository buildingRepository;

    @Autowired
    BuildingConverter buildingConverter;

    @Autowired
    RentAreaService rentAreaService;

    @Autowired
    AssignmentBuildingServiceImpl assignmentBuildingService;

    @Autowired
    UserRepository userRepository;
    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest);
        List<BuildingSearchResponse> result = new ArrayList<>();
        for(BuildingEntity item : buildingEntities){
            result.add(buildingConverter.toBuildingSearchResponse(item));
        }
        return result;
    }

    @Override
    public BuildingDTO findById(Long id) {
        BuildingEntity buildingEntity = buildingRepository.findById(id).get();
        return buildingConverter.toBuildingDTO(buildingEntity);
    }

    @Override
    public void addOrUpdate(BuildingDTO buildingDTO) {
        BuildingEntity buildingEntity = buildingConverter.toBuildingEntity(buildingDTO);
        buildingRepository.save(buildingEntity);
        if(!buildingDTO.getRentArea().equals("")){
            if(buildingDTO.getId()!=null){

                rentAreaService.deleteByBuildingId(buildingDTO.getId());
                rentAreaService.save(buildingEntity,buildingDTO.getRentArea());
            }else{
                rentAreaService.save(buildingEntity,buildingDTO.getRentArea());
            }
        }

    }

    @Override
    public void deleteAllById(List<Long> ids) {
        assignmentBuildingService.deleteAllByBuildingId(ids);
        rentAreaService.deleteAllByBuildingId(ids);
        buildingRepository.deleteAllById_In(ids);
    }

    @Override
    public List<StaffResponseDTO> listStaffs(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<AssignmentBuildingEntity> assignmentBuilding = building.getAssignmentBuildingEntities();
        List<UserEntity> staffAssignment = new ArrayList<>();

        for(AssignmentBuildingEntity it : assignmentBuilding){
            UserEntity staff = it.getStaff();
            staffAssignment.add(staff);
        }
        List<StaffResponseDTO> staffResponseDTOS = new ArrayList<>();
        for(UserEntity it: staffs){
            StaffResponseDTO staffResponseDTO = new StaffResponseDTO();
            staffResponseDTO.setStaffId(it.getId());
            staffResponseDTO.setFullName(it.getFullName());
            if(staffAssignment.contains(it)){
                staffResponseDTO.setChecked("checked");
            }else{
                staffResponseDTO.setChecked("");
            }
            staffResponseDTOS.add(staffResponseDTO);
        }
        return staffResponseDTOS;
    }
}
