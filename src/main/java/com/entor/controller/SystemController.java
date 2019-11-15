package com.entor.controller;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.entor.model.Menber;
import com.entor.model.Msg;
import com.entor.service.MenberService;
import com.entor.service.SystemService;
import com.entor.util.SendUtil;


@RequestMapping("/sc")
@Controller
public class SystemController {
	
	@Autowired
	private MenberService ms;
	@Autowired
	private SystemService ss;
	
	@RequestMapping("/index")
	public String index(){
		return "/index";
	}
	@RequestMapping("/left")
	public String left(){
		return "/left";
	}
	@RequestMapping("/center")
	public String center(){
		return "/center";
	}
	@RequestMapping("/top")
	public String top(){
		return "/top";
	}
	
	@RequestMapping("/toLogin.coc")
	@ResponseBody
	public Msg toLogin(Menber m,HttpSession session){
		return ss.toLogin(m,session);
	}
	
	@RequestMapping("/loginOut.coc")
	@ResponseBody
	public String loginOut(HttpSession session){
		session.removeAttribute("loginMem");
		return "success";
	}
	
	@RequestMapping("/forgetPwd")
	public String forgetPwd(){
		return "/forgetPwd";
	}
	
	@RequestMapping("/sendEmail")
	@ResponseBody
	public Msg sendEmail(HttpServletRequest req){
		String loginName = req.getParameter("loginName");
		return ms.sendEmail(loginName, req);
	}
	
	@RequestMapping("/editPwd")
	public void editPwd(HttpServletRequest req,HttpServletResponse res) 
			throws Exception{
		String loginName = req.getParameter("login");
		String ms = req.getParameter("ms");
		String token = req.getParameter("token");
		Msg m = this.ms.editPwd(req,loginName,ms,token);
		
		//设置编码格式
		res.setContentType("text/html;charset=utf-8");
		
		if(!m.isIs()){
			PrintWriter out = res.getWriter();
			out.println("<script language='javascript'>");
			out.println("alert('"+m.getMsg()+"')");
			out.print("</script>");
		}else{
			req.setAttribute("m", m.getObj());
			//页面重定向
			req.getRequestDispatcher("/sc/pwdPage.coc").forward(req,res);
		}
	}
	
	@RequestMapping("/pwdPage")
	public String pwdPage(){
		return "/editPwd";
	}

	@RequestMapping("/getMobileCode")
	@ResponseBody
	public Msg getMobileCode(HttpServletRequest req){
		String mobile = req.getParameter("mobile");
		Msg m = new Msg("验证码发送失败！", false);
		if(mobile!=null){
			boolean flat = SendUtil.sendSms(mobile, req);
			if(flat){
				m = new Msg("验证码已经发送，有效时间5分钟", true);
			}
		}
		return m;
	}
	
	
	
	
	
	
	
	
}
