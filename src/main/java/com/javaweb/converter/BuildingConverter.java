package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private DistrictConverter districtConverter;
    public BuildingSearchResponse toBuildingSearchResponse(BuildingEntity buildingEntity){
        BuildingSearchResponse building = modelMapper.map(buildingEntity, BuildingSearchResponse.class);
        building.setAddress(buildingEntity.getStreet()+","+buildingEntity.getWard()+","+districtConverter.toDistrict(buildingEntity.getDistrict()));
        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        building.setRentArea(areaResult);
        return building;
    }
}
