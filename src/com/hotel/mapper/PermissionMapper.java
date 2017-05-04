package com.hotel.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.entity.Permission;

public interface PermissionMapper {

	List<Permission> selectManagePermission(int id);

	List<Permission> selectPermissionAll();

	Permission selectPermissionById(int id);

	int selectUpdatePermission(Permission permission);

	List<Permission> selectPermissionByRoleId(int id);

	List<Permission> selectPermissionNone(List<Permission> permissionforrolelist);

	int insertPermissionRole(List<Map<String, Object>> listmapinsert);

	int deletePermissionRole(List<Map<String, Object>> listmapdelete);

	int insertPermission(Permission permission);

}
