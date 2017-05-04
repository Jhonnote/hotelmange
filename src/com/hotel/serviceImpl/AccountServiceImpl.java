package com.hotel.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Account;
import com.hotel.mapper.AccountMapper;
import com.hotel.service.AccountService;
@Service
public class AccountServiceImpl implements AccountService{
	//注入dao层
	@Autowired
	private AccountMapper accountMapper;

	@Override
	public Account selectAccountByAccount(String account) {
		// TODO Auto-generated method stub
		return accountMapper.selectAccountByAccount(account);
	}

}
