package com.entor.util;

import java.io.OutputStreamWriter;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class LoginInterceptor implements HandlerInterceptor{

	//验证后的方法
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	//提交后执行的方法
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		
	}

	//执行验证
	/**
	 * return true 验证通过不拦截 false 验证不通过，被拦截
	 */
	public boolean preHandle(HttpServletRequest req, 
			HttpServletResponse res, Object obj) throws Exception {
		
		//获取session
		HttpSession session = req.getSession();
		//获取会话内容
		Object o = session.getAttribute("loginMem");
		if(o!=null){
			return true;
		}
		PrintWriter out = res.getWriter();
		String str = "javascript:alert('未登录或登录信息已过期')";
		res.sendRedirect(req.getContextPath()+"/login.jsp");
		out.write(str);
		return false;
	}

}
