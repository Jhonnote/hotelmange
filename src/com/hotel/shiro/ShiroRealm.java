package com.hotel.shiro;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.hotel.entity.Account;
import com.hotel.service.AccountService;

public class ShiroRealm extends AuthorizingRealm{

	@Autowired
	private AccountService accountService;
	
	@SuppressWarnings("unused")
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		// TODO Auto-generated method stub
		String loginname = (String)principals.fromRealm(this.getName()).iterator().next();
		return null;
	}

	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(
			AuthenticationToken authenticationToken) throws AuthenticationException {
		// TODO Auto-generated method stub
		UsernamePasswordToken token=(UsernamePasswordToken) authenticationToken;  
        //查出是否有此用户  
		Account account=accountService.selectAccountByAccount(token.getUsername());  
        if(account!=null){  
            //若存在，将此用户存放到登录认证info中  
	    	Subject subject = SecurityUtils.getSubject();
	    	subject.getSession().setAttribute("account", account);
	        return new SimpleAuthenticationInfo(account.getAccount(), account.getPassword(), getName());  
        }
        return null;
	}

}
