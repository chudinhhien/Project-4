package com.javaweb.service;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.TransactionRequest;

public interface TransactionService {
    public void addOrUpdate(TransactionRequest request);

    public TransactionDTO findById(Long id);
}
