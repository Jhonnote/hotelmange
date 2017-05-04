package com.hotel.service;

import java.util.List;

import com.hotel.entity.Permission;

public interface PermissionService {

	List<Permission> selectManagePermission(int id);

	List<Permission> selectPermissionAll();

	Permission selectPermissionById(int id);

	boolean selectUpdatePermission(Permission permission);

	List<Permission> selectPermissionByRoleId(int id);

	List<Permission> selectPermissionNone(List<Permission> permissionforrolelist);

	boolean updatePermission(List<Integer> list, int id);

	boolean insertPermission(Permission permission);

}
