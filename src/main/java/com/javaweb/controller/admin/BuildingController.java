package com.javaweb.controller.admin;
import com.javaweb.enums.BuildingType;
import com.javaweb.enums.DistrictCode;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.service.BuildingService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value="buildingControllerOfAdmin")
@RequestMapping(value = "/admin")
public class BuildingController {
    @Autowired
    private BuildingService buildingService;

    @Autowired
    private UserService userService;

    @GetMapping(value = "/building-list")
    public ModelAndView buildingList(@ModelAttribute BuildingSearchRequest buildingSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/list");
        mav.addObject("modelSearch",buildingSearchRequest);
        DisplayTagUtils.of(request, buildingSearchRequest);
        //Xuống DB lấy data
        List<BuildingSearchResponse> responseList = buildingService.findAll(buildingSearchRequest,PageRequest.of(buildingSearchRequest.getPage() - 1, buildingSearchRequest.getMaxPageItems()));
        buildingSearchRequest.setListResult(responseList);
        buildingSearchRequest.setTotalItem(responseList.size());
        mav.addObject("buildingList", buildingSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("buildingType", BuildingType.type());
        return mav;
    }

    @GetMapping(value = "/building-edit")
    public ModelAndView buildingEdit(@ModelAttribute("buildingEdit")BuildingDTO buildingDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("buildingType", BuildingType.type());
        return mav;
    }

    @GetMapping(value = "/building-edit-{id}")
    public ModelAndView buildingEdit(@PathVariable("id") Long id, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/building/edit");
        //Xuống DB tìm building theo id
        BuildingDTO buildingDTO = buildingService.findById(id);
        mav.addObject("buildingEdit", buildingDTO);
        mav.addObject("districts", DistrictCode.type());
        mav.addObject("buildingType", BuildingType.type());
        return mav;
    }
}
