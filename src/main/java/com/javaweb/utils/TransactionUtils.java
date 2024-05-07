package com.javaweb.utils;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class TransactionUtils {
    @Autowired
    private TransactionConverter transactionConverter;
    public List<TransactionDTO> filterTrans(List<TransactionEntity> transactionEntities, String value) {
        return transactionEntities.stream()
                .filter(item -> filterByCode(item, value))
                .map(transactionConverter::toTransactionDTO)
                .collect(Collectors.toList());
    }
    private boolean filterByCode(TransactionEntity item, String value) {
        return item.getCode().equals(value);
    }
}
