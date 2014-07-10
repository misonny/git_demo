package com.webrage.test;

public class Recursion {
	
	static void count(int n)               //递归方法  
    {  
        if (n<5)   
            count(n+1);   
        System.out.print("     "+n);  
    }  
	
	public static int Foo(int i) { 
		if (i <= 0) 
			return 0; 
		else  if(i > 0 && i <= 2) 
				return 1; 
		else 
			System.out.println(i);
				return Foo(i -1) + Foo(i - 2); 
	} 
	
	public static void main(String[] args) {
		//count(1);
		System.out.println(Foo(30));
		
	}

}
