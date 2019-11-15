package com.entor.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entor.dao.MenberDaoI;
import com.entor.model.Menber;
import com.entor.model.Msg;
import com.entor.util.MD5Util;

@Service
public class SystemService {
	
	@Autowired
	private MenberDaoI mdi;
	
	public Msg toLogin(Menber m,HttpSession session){
		
		Msg msg = new Msg();
		//从session中获取验证码
		String code = (String)session.getAttribute("loginCode");
		//销毁验证码
		session.removeAttribute("loginCode");
		if(!m.getCode().equals(code)){
			msg.setMsg("验证码错误!");
			msg.setIs(false);
			return msg;
		}
		
		
		String pwd = m.getPassword();//页面输入的密码
		List<Menber> list = mdi.find(m);
		m = list.size()>0?list.get(0):null;
		if(m==null){
			msg.setMsg("用户不存在!");
			msg.setIs(false);
		}else{
			if(MD5Util.getMd5(pwd).equals(m.getPassword())){
				//清除密码
				m.setPassword("");
				//把登录成功的用户信息存放到session
				session.setAttribute("loginMem", m);
				
				msg.setMsg("登录成功!");
				msg.setIs(true);
			}else{
				msg.setMsg("密码错误!");
				msg.setIs(false);
			}
		}
		
		return msg;
	}
}









