package com.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/customer")
public class TestPage {
	
	@RequestMapping(value="/index")
	public String index(){
		return "/jsp/index";
	}
	
	@RequestMapping(value="/addcustomer")
	public String addcoustomer(){
		return "/jsp/addcustomer";
	}
}
