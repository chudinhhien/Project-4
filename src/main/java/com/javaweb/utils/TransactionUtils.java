package com.javaweb.utils;

import com.javaweb.converter.TransactionConverter;
import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.security.utils.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class TransactionUtils {
    @Autowired
    private TransactionConverter transactionConverter;
    public List<TransactionDTO> filterTrans(List<TransactionEntity> transactionEntities, String value) {
        List<TransactionDTO> result = new ArrayList<>();
        if (SecurityUtils.getAuthorities().contains("ROLE_STAFF")) {
            Long staffId = SecurityUtils.getPrincipal().getId();
            for (TransactionEntity item : transactionEntities) {
                if (item.getCode().equals(value) && item.getStaff().getId().equals(staffId)) {
                    result.add(transactionConverter.toTransactionDTO(item));
                }
            }
        } else {
            for (TransactionEntity item : transactionEntities) {
                if (item.getCode().equals(value)) {
                    result.add(transactionConverter.toTransactionDTO(item));
                }
            }
        }
        return result;
    }
}
