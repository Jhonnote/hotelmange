package com.hotel.mapper;

import java.util.List;

import com.hotel.entity.Role;

public interface RoleMapper {

	List<Role> selectRoleAll();

	Role selectRoleById(int id);

	int selectUpdateRole(Role role);

}
