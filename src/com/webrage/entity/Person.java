package com.webrage.entity;

import java.io.Serializable;

public class Person implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String username;
	private Integer age;
	
	/**
	 * 构造方法
	 * @return
	 */
	public Person(String username,Integer age){
		this.username=username;
		this.age=age;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	@Override
	public String toString() {
		return "Person [姓名：" + username + ", 年龄：" + age + "]\r\n";
	}
	
	
	
}
