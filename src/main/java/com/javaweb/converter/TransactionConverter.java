package com.javaweb.converter;

import com.javaweb.entity.TransactionEntity;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.utils.DateUtils;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class TransactionConverter {
    @Autowired
    private ModelMapper modelMapper;

    @Autowired
    private DateUtils dateUtils;

    public TransactionDTO toTransactionDTO(TransactionEntity transactionEntity){
        TransactionDTO result = modelMapper.map(transactionEntity,TransactionDTO.class);
        result.setCreatedDate(dateUtils.parseDateFormat(transactionEntity.getCreatedDate(),"dd/MM/yyyy"));
        if(transactionEntity.getModifiedDate()!=null){
            result.setModifiedDate(dateUtils.parseDateFormat(transactionEntity.getModifiedDate(),"dd/MM/yyyy"));
        }
        return result;
    }
}
