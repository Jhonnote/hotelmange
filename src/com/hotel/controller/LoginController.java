package com.hotel.controller;


import java.util.List;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.session.InvalidSessionException;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.hotel.entity.Account;
import com.hotel.entity.Permission;
import com.hotel.service.PermissionService;

@Controller
public class LoginController {
	
	@Autowired
	private PermissionService permissionService;
	
	//刚才请求时在这里处理的
	@RequestMapping(value="/login",method=RequestMethod.GET)
	public String login(){
		return "/login";
	}
	//现在要处理post提交的数据
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login(Account account,Model model){
		//数据用Account对象接收，前提是form提交的表单
			try {
				if(account==null){
					model.addAttribute("msg","不能为空！");
				}else{
					UsernamePasswordToken token = new UsernamePasswordToken(account.getAccount(), account.getPassword());
					Subject subject = SecurityUtils.getSubject();
					subject.login(token);
					if (subject.isAuthenticated()) { 
						List<Permission> permissionlist = permissionService.selectManagePermission(((Account)subject.getSession().getAttribute("account")).getId());
				        subject.getSession().setAttribute("permissionlist", permissionlist);
						return "/index";  
				    } else {  
				        return "login";  
				    }
				}
			} catch (Exception e) {
				model.addAttribute("msg","用户名或密码错误，请输入正确的用户名和密码！");
				e.printStackTrace();
				return "login";
			}
		return "/login";
	}
	
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logout(){
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "/login";
	}
	
	@RequestMapping(value="/home/index",method=RequestMethod.GET)
	public String homeindex(Model model){
		Subject subject = SecurityUtils.getSubject();
		List<Permission> permission = permissionService.selectManagePermission(((Account)subject.getSession().getAttribute("account")).getId());
        subject.getSession().setAttribute("permission", permission);
		return "/index";
	}
}







