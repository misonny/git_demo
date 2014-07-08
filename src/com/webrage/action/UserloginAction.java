package com.webrage.action;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.portlet.bind.annotation.ResourceMapping;

import com.webrage.service.UserService;

@Controller
public class UserloginAction {
	
	@Resource(name="userService")
	private UserService userService;
	
	@ResourceMapping("/login")
	public String login(String username,String password,HttpServletRequest request){
		
		boolean bl = userService.search(username, password);
		if(bl==true){
			request.setAttribute("user", username);
			return "/index";
		}else{
			
			return "/login";
		}
		
	}
}
