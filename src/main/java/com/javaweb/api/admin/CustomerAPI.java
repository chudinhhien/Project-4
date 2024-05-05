package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.model.response.StaffResponseDTO;
import com.javaweb.service.AssignmentCustomerService;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping(value = "/admin/customer")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private AssignmentCustomerService assignmentCustomerService;
    @PostMapping
    public CustomerDTO addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        CustomerDTO customer = new CustomerDTO();
        customerService.addCustomer(customerDTO);
        return customer;
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        List<StaffResponseDTO> data = customerService.listStaffs(id);
        ResponseDTO responseDTO = new ResponseDTO();
        responseDTO.setData(data);
        responseDTO.setMessage("Success");
        return responseDTO;
    }

    @PostMapping(value = "/assignment")
    public CustomerDTO updateAssignmentCustomer(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO){
        CustomerDTO customerDTO = new CustomerDTO();
        assignmentCustomerService.updateAssignmentCustomer(assignmentCustomerDTO);
        return customerDTO;
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable List<Long> ids){
        customerService.deleteAllById(ids);
    }
}
