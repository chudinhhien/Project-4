package com.javaweb.service;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.impl.BuildingServiceImpl;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest, Pageable pageable);
    BuildingDTO findById(Long id);

    void addOrUpdate(BuildingDTO buildingDTO);

    void deleteAllById(List<Long> ids);

    List<StaffResponseDTO> listStaffs(Long id);

    void deleteByBuildingId(Long buildingId);

    void save(BuildingEntity building);

    int countTotalItems();
}
