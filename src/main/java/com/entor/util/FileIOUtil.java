package com.entor.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.entor.model.Files;

public class FileIOUtil {
	
	public static List<Files> saveFile(
			MultipartFile[] files,String tname,Integer tid) throws Exception{
		List<Files> list = null;
		if(files==null){
			return null;
		}
		list = new ArrayList<Files>();
		for (MultipartFile file : files) {
			String path = "E:/HQJ201907/file";
			File f1 = new File(path);
			boolean b = createDir(f1);
			
			//获取文件名
			String fileName = file.getOriginalFilename();
			//生成新名称，防止名字冲突
			String newFileName = System.currentTimeMillis()+
					fileName.substring(fileName.lastIndexOf("."));
			File f2 = new File(f1, newFileName);
			b = createEmptyFile(f2);
			if(b)
				//文件的保存
				file.transferTo(f2);
			Files f = new Files(tname, tid, file.getSize()+"", 
					fileName, newFileName, f2.getPath());
			list.add(f);
		}
		return list;
	}
	
	public static boolean createDir(File f) throws Exception{
		boolean b = false;
		if(!f.exists()){
			f.mkdirs();
			b = true;
		}
		return b;
	}
	
	public static boolean createEmptyFile(File f) throws Exception{
		boolean b = false;
		if(!f.exists()){
			f.createNewFile();
			b = true;
		}
		return b;
	}

	public static void fileInOut(File o,File n) throws Exception{
		
		FileInputStream fis = new FileInputStream(o);
		FileOutputStream fos = new FileOutputStream(n);
		
		byte []bs = new byte[1024];
		int i = 0;
		while((i=fis.read(bs))!=-1){
			fos.write(bs, 0, i);
		}
		
		fos.close();
		fis.close();
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
