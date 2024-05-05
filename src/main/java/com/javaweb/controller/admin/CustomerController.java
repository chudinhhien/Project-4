package com.javaweb.controller.admin;

import com.javaweb.enums.StatusType;
import com.javaweb.enums.TransactionType;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.dto.TransactionDTO;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.security.utils.SecurityUtils;
import com.javaweb.service.CustomerService;
import com.javaweb.service.impl.UserService;
import com.javaweb.utils.DisplayTagUtils;
import com.javaweb.utils.TransactionUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller(value = "customerControllerOfAdmin")
@RequestMapping(value = "/admin")
public class CustomerController {
    @Autowired
    private UserService userService;
    @Autowired
    private CustomerService customerService;
    @Autowired
    private TransactionUtils transactionUtils;
    @GetMapping(value = "/customer-list")
    public ModelAndView customerList(@ModelAttribute CustomerSearchRequest customerSearchRequest, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/list");
        mav.addObject("modelSearch",customerSearchRequest);
        if(SecurityUtils.getAuthorities().contains("ROLE_STAFF")){
            Long staffId = SecurityUtils.getPrincipal().getId();
            customerSearchRequest.setStaffId(staffId);
        }
        DisplayTagUtils.of(request,customerSearchRequest);
        List<CustomerSearchResponse> result =  customerService.findAll(customerSearchRequest, PageRequest.of(customerSearchRequest.getPage() - 1,customerSearchRequest.getMaxPageItems()));
        customerSearchRequest.setListResult(result);
        customerSearchRequest.setTotalItem(result.size());
        mav.addObject("customerList",customerSearchRequest);
        mav.addObject("listStaffs", userService.getStaffs());
        return mav;
    }

    @GetMapping(value = "/customer-edit")
    public ModelAndView customerEdit(@ModelAttribute("customerEdit")CustomerDTO customerDTO, HttpServletRequest request){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        mav.addObject("statusType", StatusType.type());
        return mav;
    }

    @GetMapping(value = "/customer-edit-{id}")
    public ModelAndView customerEdit(@PathVariable Long id){
        ModelAndView mav = new ModelAndView("admin/customer/edit");
        //Find Customer by id
        CustomerDTO customer = customerService.findById(id);
        List<TransactionDTO> transactionCSKH = transactionUtils.filterTrans(customer.getListResult(),"CSKH");
        List<TransactionDTO> transactionDDX = transactionUtils.filterTrans(customer.getListResult(),"DDX");
        mav.addObject("CSKH",transactionCSKH);
        mav.addObject("DDX",transactionDDX);
        mav.addObject("customerEdit",customer);
        mav.addObject("transactionType", TransactionType.transactionType());
        mav.addObject("statusType", StatusType.type());
        return mav;
    }
}
