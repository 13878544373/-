package com.entor.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.entor.model.Msg;
import com.entor.model.User;
import com.entor.service.BaseServiceI;

@Controller
@RequestMapping("/uc")
public class UserController extends BaseController<User>{
	
	@Resource(name="userService")
	private BaseServiceI<User> ubsi;
	
	@RequestMapping("/index")
	public String index(){
		return "/user/index";
	}
	
	@RequestMapping("/aoe")
	public String aoe(HttpServletRequest req){
		String vals = req.getParameter("vals");
		if(vals!=null){
			try {
				vals = new String(vals.getBytes("iso-8859-1"),"utf-8");
				User u = JSON.parseObject(vals, User.class);
				req.setAttribute("u", u);
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
		}
		return "/user/addOrEdit";
	}
	
	@Override
	public List<User> find(User t) {
		return ubsi.find(t);
	}
	
	@Override
	public Msg insert(User t) {
		return ubsi.insert(t);
	}

}
