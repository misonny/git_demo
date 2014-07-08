package com.webrage.test;

import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class Demo1 {
	
	
	/**
	 * 计算出每个数字出现的次数，并打印出来。
	 */
	public static void Count(){
		int i[] ={100,5,5,11,3,98,100,28,33,44,11,8,44,90,33,65,11} ;  
		Map<Integer,Integer> map = new HashMap<Integer,Integer>();  
		for (int x = 0;x<=i.length-1;x++){  
			int temp = 0 ;  
			map.put(i[x], temp) ;	
			System.out.print(" " +i[x]) ;
		}  
		System.out.println();  
		System.out.print(" " +map) ;
		System.out.println(); 
		for(int x=0;x<=i.length-1;x++ ){  
			int sum =Integer.parseInt(map.get(i[x]).toString())  ;  
			if(map.containsKey(i[x])){  
				sum++ ;  
			}  
			map.put(i[x], sum) ;  
		}	
		for (Integer key: map.keySet()) {
			System.out.println("数字："+key+"  出现次数为："+map.get(key));
		}
		//System.out.println(map) ; 
		System.out.println();
	}

	/**
	 * 遍历日志文件（server.log），将包含有字符（”ERROR”）的行打印出来
	 * @throws UnsupportedEncodingException 
	 */
	public static void ReadLog() throws UnsupportedEncodingException{
		 String path = "F:\\Su-Yang\\Person.log";
		 	File file = new File(path) ;  
		 	List<String> list = new ArrayList<String>();  
		 	try {  
		 		
		 		FileInputStream is = new FileInputStream(path) ;  
		 		InputStreamReader ise = new InputStreamReader(is) ;  
		 		BufferedReader br = new BufferedReader(ise) ;  
		 		String line ="" ;  
		 		
		 		try {  
		 			while((line = br.readLine())!= null){  
		 				if(line.equals(""))  
		 					continue ;  
		 					else   
		 					list.add(line);  
		 				if((line.indexOf("error"))!=-1){  
		 					System.out.println(line.toString());  
		 				}  
		 			}
		 			for (int i = 0; i < list.size(); i++) {
						System.out.println("日志记录："+list.get(i));
					}
		 			//System.out.println(list);  
		 		} catch (IOException e) {  
		 			e.printStackTrace();  
		 		}  
		 		
		 	} catch (FileNotFoundException e) {  
		 		e.printStackTrace();  
		 	}  
	}
	
	 /** 
	  * @param args 
	  */  
	public static void main(String[] args) {  
				Count();
				/*try {
					ReadLog();
				} catch (UnsupportedEncodingException e) {
					e.printStackTrace();
				}*/
	}  
}
