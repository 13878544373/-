package com.entor.util;

import java.security.MessageDigest;

public class MD5Util {
	
	public static String getMd5(String text){
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(text.getBytes());
			byte[] bs = md.digest();
			int i = 0;
			StringBuffer sb = new StringBuffer("");
			for (int j = 0; j < bs.length; j++) {
				byte ele = bs[j];
				i = ele;
				if(i<0){
					i+=256;
				}
				if(i<16){
					sb.append("0");
				}
				sb.append(Integer.toHexString(i));
			}
			return sb.toString();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return text;
	}

	public static void main(String[] args) {
		System.out.println(getMd5("123"));
	}
}
