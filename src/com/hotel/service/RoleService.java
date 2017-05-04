package com.hotel.service;

import java.util.List;

import com.hotel.entity.Role;

public interface RoleService {

	List<Role> selectRoleAll();

	Role selectRoleById(int id);

	boolean selectUpdateRole(Role role);

}
