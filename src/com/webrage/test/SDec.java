package com.webrage.test;

import java.io.*;
import java.security.*;
import javax.crypto.*;

public class  SDec
//基于DES的解密算法
{
	public static void main(String args[])throws Exception
	{
		
		FileInputStream f=new FileInputStream("SEnc.dat");
		int num=f.available();		
		byte[] ctext=new byte[num];
		f.read(ctext);
		FileInputStream f2=new FileInputStream("key1.dat");
		ObjectInputStream b=new ObjectInputStream(f2);
		Key k=(Key)b.readObject();		
		Cipher cp=Cipher.getInstance("DESede");
		cp.init(Cipher.DECRYPT_MODE,k);
		byte[] ptext=cp.doFinal(ctext);
		String p=new String(ptext,"UTF8");
		System.out.println(p);		
	}
}


