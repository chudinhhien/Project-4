package com.javaweb.service;

import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.StaffResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {
    public void addCustomer(CustomerDTO customerDTO);

    public List<CustomerSearchResponse> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);

    public CustomerDTO findById(Long id);

    List<StaffResponseDTO> listStaffs(Long id);

    void deleteAllById(List<Long> ids);
}
