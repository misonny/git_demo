package com.webrage.dao.imp;

import org.springframework.stereotype.Repository;

import com.webrage.dao.UserDAO;

@Repository("userDAO")
public class UserDAOImpl implements UserDAO{

	public boolean serch(String username, String password) {
		
		System.out.println("���ڵ�¼�����Ժ�...");
		if(username.equals("admin")&&password.equals("123")){
			return true;
		}
			return false;
	}
	
}
