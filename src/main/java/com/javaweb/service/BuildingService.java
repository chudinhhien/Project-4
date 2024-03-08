package com.javaweb.service;

import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.impl.BuildingServiceImpl;

import java.util.List;

public interface BuildingService {
    List<BuildingSearchResponse> findAll(BuildingSearchRequest buildingSearchRequest);
    BuildingDTO findById(Long id);
    void addOrUpdate(BuildingDTO buildingDTO);

    void deleteAllById(List<Long> ids);

    List<StaffResponseDTO> listStaffs(Long id);
}
