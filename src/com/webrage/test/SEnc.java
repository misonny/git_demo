package com.webrage.test;

import java.io.*;
import java.security.*;
import javax.crypto.*;

public class  SEnc
//����DES�ĶԳƼ����㷨
{
	public static void main(String args[])throws Exception
	{
		String s="Hello World!";
		FileInputStream f=new FileInputStream("key1.dat");
		ObjectInputStream b=new ObjectInputStream(f);
		Key k=(Key)b.readObject();

		Cipher cp=Cipher.getInstance("DESede");
		cp.init(Cipher.ENCRYPT_MODE,k);
		byte ptext[]=s.getBytes("UTF8");

		for(int i=0;i<ptext.length;i++)
		{
			System.out.print(ptext[i]+",");
		}

		System.out.println("");
		byte ctext[]=cp.doFinal(ptext);

		for(int i=0;i<ctext.length;i++)
		{
			System.out.print(ctext[i]+",");
		}

		FileOutputStream f2=new FileOutputStream("SEnc.dat");
		f2.write(ctext);
	}
}

