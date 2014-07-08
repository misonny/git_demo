package com.webrage.test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.PrintStream;

import com.webrage.entity.Person;

public class Demo2 {
	public static void Test() throws IOException{
		try {
			String file="F:\\Su-Yang\\Person.log";
			
			//序列化操作;  
			FileOutputStream fos=new FileOutputStream(file);
			
			
			/*ObjectOutputStream oos = new ObjectOutputStream(fos);
			Person per = new Person("米森(Mison)2014",25);
			Person per1 = new Person("米森(Mison)2015",25);
			Person per2 = new Person("米森(Mison)2016",25);
			Person per3 = new Person("米森(Mison)2017",25);
			oos.writeObject(per.getUsername().toString()+"\r\n");
			oos.writeObject(per1.getUsername().toString()+"\r\n");
			oos.writeObject(per2.getUsername().toString()+"\r\n");
			oos.writeObject(per3.getUsername().toString()+"\r\n");
			oos.close(); 
			*/
			
			Person per = new Person("米森(Mison)2014",25);
			Person per1 = new Person("米森(Mison)2015",25);
			Person per2= new Person("米森(Mison)2016",25);
			Person per3 = new Person("米森(Mison)2017",25);
			Person per4 = new Person("米森(Mison)2018",25);
			Person per5 = new Person("米森(Mison)2019",25);
			Person per6 = new Person("米森(Mison)2020",25);
			
			
			Person per7 = new Person("后来居下(Mison)2020",28);
			Person per8 = new Person("后开居下(Mison)2020",28);
			
			//创建具有指定文件且不带自动行刷新的新打印流。
			PrintStream ps = new PrintStream(fos,true);  
			
			/*ps.write(per.toString().getBytes());
			ps.write(per1.toString().getBytes());
			ps.write(per2.toString().getBytes());
			ps.write(per3.toString().getBytes());
			ps.write(per4.toString().getBytes());
			ps.write(per5.toString().getBytes());
			ps.write(per6.toString().getBytes());*/
			ps.write(per7.toString().getBytes());
			fos.close();
			ps.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		try {
			Test();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
