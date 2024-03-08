package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping(value = "/admin/building")
public class BuildingAPI {
    @Autowired
    BuildingService buildingService;

    @Autowired
    AssignmentBuildingService assignmentBuildingService;
    @PostMapping
    public ResponseEntity<String> addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        //Xuống DB để update hoặc thêm mới
        buildingService.addOrUpdate(buildingDTO);
        return ResponseEntity.ok().header(HttpHeaders.LOCATION, "/admin/building-list").body(null);
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids){
        buildingService.deleteAllById(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        List<StaffResponseDTO> data = buildingService.listStaffs(id);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(data);
        responseDTO.setMessage("Success");
        return responseDTO;
    }

    @PostMapping(value = "/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO){
        assignmentBuildingService.updateAssignmentBuilding(assignmentBuildingDTO);
    }
}
