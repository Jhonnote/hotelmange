package com.hotel.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.entity.Permission;
import com.hotel.entity.Role;
import com.hotel.service.PermissionService;
import com.hotel.service.RoleService;

@Controller
public class RoleController {
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping(value="/role",method=RequestMethod.GET)
	public String index(Model model){
		List<Role> rolelist = roleService.selectRoleAll();
		model.addAttribute("rolelist", rolelist);
		return "/role";
	}
	
	@RequestMapping(value="/roleedit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable(value="id") int id,Model model){
		Role role = roleService.selectRoleById(id);
		model.addAttribute("role", role);
		return "/roleedit";
	}
	
	@RequestMapping(value="/roleedit",method=RequestMethod.POST)
	public String edit(Role role,Model model){
		boolean result = roleService.selectUpdateRole(role);
		if(result){
			model.addAttribute("msg", "修改成功！");
		}else{
			model.addAttribute("msg", "操作成功！");
		}
		return "/roleedit";
	}
	
	@RequestMapping(value="/role/bind/{id}",method=RequestMethod.GET)
	public String bing(@PathVariable(value="id") int id,Model model){
		Role role = roleService.selectRoleById(id);
		List<Permission> permissionforrolelist = permissionService.selectPermissionByRoleId(id);
		List<Permission> permissionList = null;
		if(permissionforrolelist.size()>0&&permissionforrolelist!=null){
			permissionList = permissionService.selectPermissionNone(permissionforrolelist);
		}else{
			permissionList = permissionService.selectPermissionAll();
		}
		model.addAttribute("mypermission", permissionforrolelist);
		model.addAttribute("allpermissionList", permissionList);
		model.addAttribute("role",role);
		return "/rolebing";
	}
	
	@RequestMapping(value="/rolebind",method=RequestMethod.POST)
	public String rolebing(Integer[] permission,int id,Model model){
		List<Integer> list = Arrays.asList(permission);
		List<Integer> arrayList = new ArrayList<Integer>(list);
		boolean result = permissionService.updatePermission(arrayList,id);
		Role role = roleService.selectRoleById(id);
		List<Permission> permissionforrolelist = permissionService.selectPermissionByRoleId(id);
		List<Permission> permissionList = permissionService.selectPermissionNone(permissionforrolelist);
		model.addAttribute("mypermission", permissionforrolelist);
		model.addAttribute("allpermissionList", permissionList);
		model.addAttribute("role",role);
		if(result){
			model.addAttribute("msg", "success");
		}else{
			model.addAttribute("msg","faile");
		}
		return "/rolebing";
	}
}
