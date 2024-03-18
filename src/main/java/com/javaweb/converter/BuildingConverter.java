package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.BuildingSearchResponse;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
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

    public BuildingDTO toBuildingDTO(BuildingEntity buildingEntity){
        BuildingDTO building = modelMapper.map(buildingEntity, BuildingDTO.class);
        String[] typeCode = buildingEntity.getType().split(",");
        List<String> type = new ArrayList<>();
        for(String it : typeCode){
            type.add(it);
        }
        building.setTypeCode(type);
        List<RentAreaEntity> rentAreas = buildingEntity.getRentAreaEntities();
        String areaResult = rentAreas.stream().map(it -> it.getValue().toString()).collect(Collectors.joining(","));
        building.setRentArea(areaResult);
        building.setImage(buildingEntity.getAvatar());
        return building;
    }

    public BuildingEntity toBuildingEntity(BuildingDTO buildingDTO){
        BuildingEntity building = modelMapper.map(buildingDTO, BuildingEntity.class);
        String type = buildingDTO.getTypeCode().stream().collect(Collectors.joining(","));
        building.setType(type);
        return building;
    }
}
