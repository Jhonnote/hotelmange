package com.hotel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Customer;
import com.hotel.mapper.CustomerMapper;
import com.hotel.service.CustomerService;
@Service
public class CustomerServiceImpl implements CustomerService {
	
	@Autowired
	private CustomerMapper customerMapper;

	@Override
	public List<Customer> selectCustomer() {
		// TODO Auto-generated method stub
		return customerMapper.selectCustomer();
	}
	
}
