package com.entor.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.OutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entor.model.Files;
import com.entor.service.BaseServiceI;

@Controller
@RequestMapping("/fc")
public class FilesController {
	
	@Resource(name="filesService")
	private BaseServiceI<Files> fbsi;
	
	@RequestMapping("/getImg.coc")
	public void getImagePhoto(HttpServletResponse res,HttpServletRequest req){
		String tname = req.getParameter("tname");
		String tid = req.getParameter("tid");
		Files f = new Files();
		f.setTid(Integer.parseInt(tid==null?"0":tid));f.setTname(tname);
		
		f = fbsi.get(f);
		//获取工程绝对路径
		String realPath = req.getSession().getServletContext().getRealPath("/");
		String path = realPath+"img/i07.png";
		
		if(f!=null){
			path = f.getFilePath();
		}
		File imageFile = new File(path);
		if(imageFile.exists()){
			try {
				FileInputStream fis = new FileInputStream(imageFile);
				OutputStream os = res.getOutputStream();
				int i = 0;
				byte[] bs = new byte[1024];
				while((i=fis.read(bs))!=-1){
					os.write(bs, 0, i);
					os.flush();
				}
				os.close();
				fis.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
