package com.webrage.service.imp;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.webrage.dao.UserDAO;
import com.webrage.service.UserService;

@Service("userService")
public class UserServiceImpl implements UserService{
	/*×¢ÊÍ*/
	@Resource
	private UserDAO userdao;
	
	public boolean search(String username, String password) {
		
		return userdao.serch(username, password);
	}

}
