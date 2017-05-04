package com.hotel.mapper;

import java.util.List;

import com.hotel.entity.Customer;

public interface CustomerMapper {

	void insertCustomer(Customer customer);

	List<Customer> selectCustomer();

}
