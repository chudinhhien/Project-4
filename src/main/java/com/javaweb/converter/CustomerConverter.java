package com.javaweb.converter;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.enums.StatusType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.utils.DateUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.text.SimpleDateFormat;
import java.util.Map;

@Component
public class CustomerConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private DateUtils dateUtils;
    public CustomerEntity toCustomerEntity(CustomerDTO customerDTO){
        CustomerEntity customerEntity = modelMapper.map(customerDTO, CustomerEntity.class);
        Map<String,String> statusType = StatusType.type();
        statusType.forEach((key,value) -> {
            if(value.equals(customerDTO.getStatus())){
                customerEntity.setStatus(key);
            }
        });
        customerEntity.setActive(true);
        return customerEntity;
    }

    public CustomerDTO toCustomerDTO(CustomerEntity customerEntity){
        if (customerEntity == null) {
            return null; // Trả về null nếu đối tượng đầu vào là null
        }

        ModelMapper modelMapper = new ModelMapper();
        return modelMapper.map(customerEntity, CustomerDTO.class);
    }

    public CustomerSearchResponse toCustomerSearchResponse(CustomerEntity customerEntity){
        CustomerSearchResponse customer = modelMapper.map(customerEntity, CustomerSearchResponse.class);
        Map<String,String> statusType = StatusType.type();
        statusType.forEach((key,value) -> {
            if(key.equals(customer.getStatus())){
                customer.setStatus(value);
            }
        });
        if (customer.getCreatedDate() != null) {
            customer.setCreatedDate(dateUtils.parseDateFormat(customerEntity.getCreatedDate(),"dd/MM/yyyy"));
        }
        if (customer.getModifiedDate() != null) {
            customer.setModifiedDate(dateUtils.parseDateFormat(customerEntity.getModifiedDate(),"dd/MM/yyyy"));
        }
        if(customer.getCreatedBy()!=null){
            if(customer.getCreatedBy().equals("anonymousUser")){
                customer.setCreatedBy("");
            }
        }

        return customer;
    }
}
