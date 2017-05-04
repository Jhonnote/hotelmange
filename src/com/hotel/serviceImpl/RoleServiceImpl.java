package com.hotel.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Role;
import com.hotel.mapper.RoleMapper;
import com.hotel.service.RoleService;

@Service
public class RoleServiceImpl implements RoleService{

	@Autowired
	private RoleMapper roleMapper;
	
	@Override
	public List<Role> selectRoleAll() {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleAll();
	}

	@Override
	public Role selectRoleById(int id) {
		// TODO Auto-generated method stub
		return roleMapper.selectRoleById(id);
	}

	@Override
	public boolean selectUpdateRole(Role role) {
		// TODO Auto-generated method stub
		return roleMapper.selectUpdateRole(role)>0;
	}

}
