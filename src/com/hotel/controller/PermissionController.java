package com.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.entity.Permission;
import com.hotel.service.PermissionService;

@Controller
public class PermissionController {
	
	@Autowired
	private PermissionService permissionService;
	
	@RequestMapping(value="/permission",method=RequestMethod.GET)
	public String index(Model model){
		List<Permission> permissionli = permissionService.selectPermissionAll();
		model.addAttribute("permissionli", permissionli);
		return "/permission";
	}
	
	@RequestMapping(value="/permissionedit/{id}",method=RequestMethod.GET)
	public String edit(@PathVariable(value="id") int id,Model model){
		Permission permission = permissionService.selectPermissionById(id);
		model.addAttribute("permissions", permission);
		return "/permissionedit";
	}
	
	@RequestMapping(value="/permissionedit",method=RequestMethod.POST)
	public String edit(Permission permission,Model model){
		boolean result = permissionService.selectUpdatePermission(permission);
		if(result){
			model.addAttribute("msg", "修改成功！");
		}else{
			model.addAttribute("msg", "操作成功！");
		}
		return "/permissionedit";
	}
	
	@RequestMapping(value="/permission/add",method=RequestMethod.GET)
	public String add(){
		return "/permissionadd";
	}
	
	@RequestMapping(value="/permission/add",method=RequestMethod.POST)
	public String add(Permission permission,Model model){
		boolean result = permissionService.insertPermission(permission);
		if(result){
			model.addAttribute("msg", "添加成功！");
		}else{
			model.addAttribute("msg", "操作成功！");
		}
		return "/permissionadd";
	}
}
