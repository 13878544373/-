package com.entor.util;

import java.util.Arrays;


import net.sourceforge.pinyin4j.PinyinHelper;

public class Ch2PinYin {
	
	public static String getFirstChPy(String text){
		String py = "";
		char cs[] = text.toCharArray();
		for (char c : cs) {//黄   h,u,a n g
			String []pys = PinyinHelper.toHanyuPinyinStringArray(c);
			System.out.println(Arrays.toString(pys));
			if(pys!=null){
				py += pys[0].charAt(0);
			}else{
				py += c;
			}
		}
		return py;
	}
	
	
	
	
	
	
	public static void main(String[] args) {
		System.out.println(getFirstChPy("独乐乐"));
	}

}
