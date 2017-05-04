package com.hotel.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.entity.Permission;
import com.hotel.mapper.PermissionMapper;
import com.hotel.service.PermissionService;
@Service
public class PermissionServiceImpl implements PermissionService {

	@Autowired
	private PermissionMapper permissionMapper;
	
	@Override
	public List<Permission> selectManagePermission(int id) {
		// TODO Auto-generated method stub
		return permissionMapper.selectManagePermission(id);
	}

	@Override
	public List<Permission> selectPermissionAll() {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionAll();
	}

	@Override
	public Permission selectPermissionById(int id) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionById(id);
	}

	@Override
	public boolean selectUpdatePermission(Permission permission) {
		// TODO Auto-generated method stub
		return permissionMapper.selectUpdatePermission(permission)>0;
	}

	@Override
	public List<Permission> selectPermissionByRoleId(int id) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionByRoleId(id);
	}

	@Override
	public List<Permission> selectPermissionNone(
			List<Permission> permissionforrolelist) {
		// TODO Auto-generated method stub
		return permissionMapper.selectPermissionNone(permissionforrolelist);
	}

	@Override
	public boolean updatePermission(List<Integer> list,int id) {
		// TODO Auto-generated method stub
		int s = 0;
		List<Permission> permissionold = permissionMapper.selectPermissionByRoleId(id);
		List<Map<String, Object>> listmapdelete = new ArrayList<Map<String,Object>>();
		List<Map<String, Object>> listmapinsert = new ArrayList<Map<String,Object>>();
		for (int i=list.size()-1;i>= 0;i--) {
			if(permissionold.size()>0&&permissionold!=null){
				for(int j=permissionold.size()-1;j>=0;j--){
					System.out.println("当前i"+i);
					System.out.println("当前j"+j);
					System.out.println("当前list.size()"+list.size());
					System.out.println("当前permissionold.size()"+permissionold.size());
					if(list.size()>0&&list!=null){
						if(list.get(i)==permissionold.get(j).getId()){
							list.remove(i);
							i--;
							permissionold.remove(j);
						}
					}
				}
			}
		}
		if(list.size()>0&&list!=null){
			for(Integer idd :list){
				Map<String, Object> map1 =new HashMap<String, Object>();
				map1.put("role", id);
				map1.put("permission",idd);
				listmapinsert.add(map1);
			}
			s= permissionMapper.insertPermissionRole(listmapinsert);
		}
		if(permissionold.size()>0&&permissionold!=null){
			for(Permission idd :permissionold){
				Map<String, Object> map2 =new HashMap<String, Object>();
				map2.put("role", id);
				map2.put("permission",idd.getId());
				listmapdelete.add(map2);
			}
			s= permissionMapper.deletePermissionRole(listmapdelete);
		}
		return s>0;
	}

	@Override
	public boolean insertPermission(Permission permission) {
		// TODO Auto-generated method stub
		return permissionMapper.insertPermission(permission)>0;
	}

}
