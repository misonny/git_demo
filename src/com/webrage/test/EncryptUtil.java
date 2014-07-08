package com.webrage.test;

import java.security.MessageDigest;
import java.io.*;
import javax.crypto.*; 
import javax.crypto.spec.*; 

public class EncryptUtil 
{

// ��MD5������ļ����㷨�������ڶ��ַ������ܡ�
public static String encrypt(String inStr) 
{
	MessageDigest md = null;
	String out = null;

	try 
	{
		md = MessageDigest.getInstance("MD5");
		byte[] digest = md.digest(inStr.getBytes());
		out = byte2hex(digest);
	} 
	catch (Exception e) 
	{
		e.printStackTrace();
	}
	return out;
}

private static String byte2hex(byte[] b) 
{
	String hs = "";
	String stmp = "";
	for (int n = 0; n < b.length; n++) 
	{
		stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
		if (stmp.length() == 1) 
		{
			hs = hs + "0" + stmp;
		} 
		else 
		{
			hs = hs + stmp;
		}
	}
	return hs.toUpperCase();
}

// ��������������Ҫ�����κβ�����ֱ��ִ�м��ɡ�
public static void main(String[] args)
{
	String str1 = "123";
	String str2 = "this is my first encrypt programe";
	String str3 = "��ӭʹ�� ����Ƽ� !";
	String str4 = "#%$?  ��Կ�ַ���";
    String str=encrypt(str2);
    System.out.println("**************************************************************");
	System.out.println("outStr1 is : " + str);
	System.out.println("--------------------------------------------------------------");
	System.out.println("outStr3 is : " + encrypt(str3));
	System.out.println("--------------------------------------------------------------");
	System.out.println("outStr4 is : " + encrypt(str4));
	System.out.println("--------------------------------------------------------------");
	System.out.println("�����ļ�  is : " + decryptFile("E://123//123.txt.jsmt",str1));
	System.out.println("--------------------------------------------------------------");
	System.out.println("�����ļ�  is : "+encryptFile("E:\\123\\123.txt",str1));
	System.out.println("**************************************************************");
}


/** 
���ܷ��� 
���룺Ҫ���ܵ��ļ�����Կ�ַ���
����� 
��������ļ����ܺ󣬱��浽ͬһ�ļ�����������".jsmt"��չ�����ļ��С� 
*/ 
public static int encryptFile(String FileName,String sKey)
{ 
	int Rtn=0;
	try
	{ 
		// ��Ϊ��Կ��Ϊ32λ���ַ������ʽ��û����ݵĲ�����encrypt�������д���
		//����0-F��ɣ���32���ַ������ǽ�����Ϊ2��16λ���������ж��μ������㣩�磺 
		// AD67EA2F3BE6E5AD D368DFE03120B5DF

		sKey=encrypt(sKey);
		if(sKey.length() != 32)
		{ 
			Rtn=-1;	// sKey is Wrong. //���볤�ȱ������32��
			return Rtn;
		}
		byte[] bytK1 = getKeyByStr(sKey.substring(0,16)); 
		byte[] bytK2 = getKeyByStr(sKey.substring(16,32)); 

		File fileIn=new File(FileName);
		if (!fileIn.exists())
		{
			Rtn=-2;	// ��Ҫ���ܵ��ļ�û���ҵ���
			return Rtn;
		}

		FileInputStream fis = new FileInputStream(fileIn); 
		byte[] bytIn = new byte[(int)fileIn.length()]; 
		for(int i = 0;i<fileIn.length();i++)
		{ 
			bytIn[i] = (byte)fis.read(); 
		} 

		//���� 
		byte[] bytOut = encryptByDES(encryptByDES(bytIn,bytK1),bytK2); 
		String fileOut = fileIn.getPath() + ".jsmt"; 
		FileOutputStream fos = new FileOutputStream(fileOut); 
		for(int i = 0;i<bytOut.length;i++)
		{ 
			fos.write((int)bytOut[i]); 
		} 
		fos.close(); 
		return Rtn;
	}
	catch(Exception e)
	{ 
		Rtn=-3;	// ����ԭ���µļ���ʧ�ܣ�
		return Rtn;
	} 
} 


/** 
���ܺ��� 
���룺 
Ҫ���ܵ��ļ�����Կ�ַ��� 
����� 
���ƶ����ļ����н��ܴ������浽�û�ָ�����ļ��С���ע�������ܵ��ļ���չ������Ϊ��.jsmt�� 
*/ 
private static int decryptFile(String CryptFileName,String sKey)
{ 
	int Rtn=0;	// Ĭ�ϵķ���ֵΪ0,�ɹ���
	try
	{ 
		// ��Ϊ��Կ��Ϊ32λ���ַ������ʽ��û����ݵĲ�����encrypt�������д���
		//����0-F��ɣ���32���ַ������ǽ�����Ϊ2��16λ���������ж��ν������㣩�磺 
		// AD67EA2F3BE6E5AD D368DFE03120B5DF

		sKey=encrypt(sKey);
		if(sKey.length()!=32)
		{
			Rtn=-1;	// sKey is Wrong. //���볤�ȱ������32��
			return Rtn;
		}

		String strPath = CryptFileName; 
		if(!strPath.substring(strPath.length()-5).toLowerCase().equals(".jsmt"))
		{
			Rtn=-2;	// CryptFileName ��չ������Ϊ��.jsmt
			return Rtn;
		}

		//�û�ָ��Ҫ������ļ� 
		strPath = strPath.substring(0,strPath.length()-5); 
		byte[] bytK1 = getKeyByStr(sKey.substring(0,16)); 
		byte[] bytK2 = getKeyByStr(sKey.substring(16,32)); 

		File fileIn=new File(CryptFileName);
		if (!fileIn.exists())
		{
			Rtn=-3;	// ��Ҫ���ܵ��ļ�û���ҵ���
			return Rtn;
		}

		FileInputStream fis = new FileInputStream(fileIn); 
		byte[] bytIn = new byte[(int)fileIn.length()]; 
		for(int i = 0;i<fileIn.length();i++)
		{ 
			bytIn[i] = (byte)fis.read(); 
		} 

		//���� 
		byte[] bytOut = decryptByDES(decryptByDES(bytIn,bytK2),bytK1); 
		File fileOut =new File(strPath); 
		fileOut.createNewFile(); 
		FileOutputStream fos = new FileOutputStream(fileOut); 
		for(int i = 0;i<bytOut.length;i++)
		{ 
			fos.write((int)bytOut[i]); 
		} 
		fos.close(); 
		return Rtn;	// ���ܳɹ�
	}
	catch(Exception e)
	{ 
		Rtn=-4;	// ����ԭ���µĽ���ʧ�ܣ�
		return Rtn;
	} 
} 


/*
��DES��������������ֽ� 
bytKey��Ϊ8�ֽڳ����Ǽ��ܵ����� 
*/ 
private static byte[] encryptByDES(byte[] bytP,byte[] bytKey) throws Exception
{ 
	DESKeySpec desKS = new DESKeySpec(bytKey); 
	SecretKeyFactory skf = SecretKeyFactory.getInstance("DES"); 
	SecretKey sk = skf.generateSecret(desKS); 
	Cipher cip = Cipher.getInstance("DES"); 
	cip.init(Cipher.ENCRYPT_MODE,sk); 
	return cip.doFinal(bytP); 
} 

/** 
��DES��������������ֽ� 
bytKey��Ϊ8�ֽڳ����ǽ��ܵ����� 
*/ 
private static byte[] decryptByDES(byte[] bytE,byte[] bytKey) throws Exception
{ 
	DESKeySpec desKS = new DESKeySpec(bytKey); 
	SecretKeyFactory skf = SecretKeyFactory.getInstance("DES"); 
	SecretKey sk = skf.generateSecret(desKS); 
	Cipher cip = Cipher.getInstance("DES"); 
	cip.init(Cipher.DECRYPT_MODE,sk); 
	return cip.doFinal(bytE); 
} 

/** 
����������ַ���ʽ�������ֽ�������ʽ�� 
�������ַ�����AD67EA2F3BE6E5AD 
�����ֽ����飺{173,103,234,47,59,230,229,173} 
*/ 
private static byte[] getKeyByStr(String str)
{ 
	byte[] bRet = new byte[str.length()/2]; 
	for(int i=0;i<str.length()/2;i++)
	{ 
		Integer itg = 	new Integer(16*getChrInt(str.charAt(2*i)) + getChrInt(str.charAt(2*i+1))); 
		bRet[i] = itg.byteValue(); 
	} 
	return bRet; 
} 

/** 
����һ��16�����ַ���10����ֵ 
���룺0-F 
*/ 
private static int getChrInt(char chr)
{ 
	int iRet=0; 
	if(chr=="0".charAt(0)) iRet = 0; 
	if(chr=="1".charAt(0)) iRet = 1; 
	if(chr=="2".charAt(0)) iRet = 2; 
	if(chr=="3".charAt(0)) iRet = 3; 
	if(chr=="4".charAt(0)) iRet = 4; 
	if(chr=="5".charAt(0)) iRet = 5; 
	if(chr=="6".charAt(0)) iRet = 6; 
	if(chr=="7".charAt(0)) iRet = 7; 
	if(chr=="8".charAt(0)) iRet = 8; 
	if(chr=="9".charAt(0)) iRet = 9; 
	if(chr=="A".charAt(0)) iRet = 10; 
	if(chr=="B".charAt(0)) iRet = 11; 
	if(chr=="C".charAt(0)) iRet = 12; 
	if(chr=="D".charAt(0)) iRet = 13; 
	if(chr=="E".charAt(0)) iRet = 14; 
	if(chr=="F".charAt(0)) iRet = 15; 
	return iRet; 
} 

}// class is over.
