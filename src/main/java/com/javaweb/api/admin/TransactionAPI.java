package com.javaweb.api.admin;

import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.TransactionRequest;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.TransactionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController(value = "transactionAPIOfAdmin")
@RequestMapping(value = "/admin/transaction")
public class TransactionAPI {
    @Autowired
    private TransactionService transactionService;

    @PostMapping
    public TransactionDTO addOrUpdate(@RequestBody TransactionRequest request){
        TransactionDTO transactionDTO = new TransactionDTO();
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            request.setStaffId(staffId);
        }
        transactionService.addOrUpdate(request);
        return transactionDTO;
    }

    @GetMapping("/{id}")
    public ResponseDTO loadNote(@PathVariable Long id){
        TransactionDTO data = transactionService.findById(id);
        ResponseDTO result = new ResponseDTO();
        result.setData(data);
        return result;
    }
}
