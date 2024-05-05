package com.javaweb.api.web;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@RestController(value = "customerAPIOfWeb")
@RequestMapping(value = "/web")
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @PostMapping(value = "/customer")
    public CustomerDTO addCustomer(@RequestBody CustomerDTO customerDTO){
        CustomerDTO customer = new CustomerDTO();
        customerDTO.setStatus("Chưa xử lý");
        customerService.addCustomer(customerDTO);
        return customer;
    }
}
