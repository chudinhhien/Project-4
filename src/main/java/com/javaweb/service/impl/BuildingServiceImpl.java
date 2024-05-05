package com.javaweb.service.impl;

import com.javaweb.converter.BuildingConverter;
import com.javaweb.converter.RentAreaConverter;
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
import org.apache.tomcat.util.codec.binary.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.javaweb.utils.UploadFileUtils;

import java.io.File;
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
    RentAreaConverter rentAreaConverter;

    @Autowired
    UserRepository userRepository;

    @Autowired
    UploadFileUtils uploadFileUtils;
    @Override
    public List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable) {
        List<BuildingEntity> buildingEntities = buildingRepository.findAll(buildingSearchRequest,pageable);
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
        if(buildingDTO.getId()!=null){
            BuildingEntity building = buildingRepository.findById(buildingDTO.getId()).get();
            buildingEntity.setStaffs(building.getStaffs());
        }
        saveThumbnail(buildingDTO,buildingEntity);
        buildingEntity.setRentAreaEntities(rentAreaConverter.toRentAreaEntities(buildingDTO.getRentArea(),buildingEntity));
        buildingRepository.save(buildingEntity);
    }

    @Override
    public void deleteAllById(List<Long> ids) {
        buildingRepository.deleteAllById_In(ids);
    }

    @Override
    public List<StaffResponseDTO> listStaffs(Long id) {
        BuildingEntity building = buildingRepository.findById(id).get();
        List<UserEntity> staffs = userRepository.findByStatusAndRoles_Code(1,"STAFF");
        List<UserEntity> staffAssignment = building.getStaffs();

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

    @Override
    public void deleteByBuildingId(Long buildingId) {
        buildingRepository.deleteByBuildingId(buildingId);
    }

    @Override
    public void save(BuildingEntity building) {
        buildingRepository.save(building);
    }

    @Override
    public int countTotalItems() {
        return buildingRepository.countTotalItem();
    }

    private void saveThumbnail(BuildingDTO buildingDTO, BuildingEntity buildingEntity) {
        String path = "/building/" + buildingDTO.getImageName();
        if (null != buildingDTO.getImageBase64()) {
            if (null != buildingEntity.getAvatar()) {
                if (!path.equals(buildingEntity.getAvatar())) {
                    File file = new File("C://home/office" + buildingEntity.getAvatar());
                    file.delete();
                }
            }
            byte[] bytes = Base64.decodeBase64(buildingDTO.getImageBase64().getBytes());
            uploadFileUtils.writeOrUpdate(path, bytes);
            buildingEntity.setAvatar(path);
        }
    }
}
