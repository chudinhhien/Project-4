package com.javaweb.service.impl;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.TransactionRequest;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.repository.TransactionRepository;
import com.javaweb.repository.UserRepository;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

@Service
public class TransactionServiceImpl implements TransactionService {
    @Autowired
    private CustomerRepository customerRepository;
    @Autowired
    private TransactionRepository transactionRepository;
    @Autowired
    private TransactionConverter transactionConverter;
    @Autowired
    private UserRepository userRepository;
    @Override
    public void addOrUpdate(TransactionRequest request) {
        TransactionEntity transactionEntity = new TransactionEntity();
        if(request.getId() != null){
            transactionEntity = transactionRepository.findById(request.getId()).get();
            transactionEntity.setModifiedDate(new Date());
            transactionEntity.setModifiedBy(SecurityUtils.getPrincipal().getFullName());
            transactionEntity.setNote(request.getNote());

        }else {
            CustomerEntity customer = customerRepository.findById(request.getCustomerId()).get();
            transactionEntity.setCode(request.getCode());
            transactionEntity.setNote(request.getNote());
            transactionEntity.setModifiedBy("");
            transactionEntity.setStaff(userRepository.findByIdAndStatus(request.getStaffId(),1));
            transactionEntity.setCustomer(customer);
        }
        transactionRepository.save(transactionEntity);
    }

    @Override
    public TransactionDTO findById(Long id) {
        TransactionEntity transactionEntity = transactionRepository.findById(id).get();
        TransactionDTO result = transactionConverter.toTransactionDTO(transactionEntity);
        return result;
    }
}
