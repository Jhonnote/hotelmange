package com.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.entity.Customer;
import com.hotel.service.CustomerService;
@Controller
public class CustomerController {
	
	@Autowired
	private CustomerService customerService;
	
	@RequestMapping(value="/customer")
	public String index(Model model){
		List<Customer> customerlist = customerService.selectCustomer();
		model.addAttribute("customerlist", customerlist);
		return "/staff/customer";
	}
}
