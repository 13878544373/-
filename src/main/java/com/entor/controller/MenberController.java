package com.entor.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.entor.model.Enterprise;
import com.entor.model.Files;
import com.entor.model.MemberProperties;
import com.entor.model.Menber;
import com.entor.model.Msg;
import com.entor.service.BaseServiceI;
import com.entor.util.FileIOUtil;
import com.entor.util.MD5Util;

@Controller
@RequestMapping("/mc")
public class MenberController extends BaseController<Menber>{
	
	@Resource(name="menberService")
	private BaseServiceI<Menber> bsi;
	@Resource(name="filesService")
	private BaseServiceI<Files> fsi;
	@Resource(name="enterpriseService")
	private BaseServiceI<Enterprise> ebsi;
	
	@Override
	public List<Menber> find(Menber t) {
		return bsi.find(t);
	}

	@RequestMapping("/index.coc")
	public String index(){
		return "/member/index";
	}
	
	@RequestMapping("/addMember")
	@ResponseBody
	public Msg insert(Menber t,
			@RequestParam(required=false,value="photo") 
				MultipartFile[] files,HttpServletRequest req) {
		//验证短信验证码
		HttpSession session = req.getSession();
		String codePwd = session.getAttribute("codePwd")+"";
		if(!(t.getMobile()+"-"+t.getCode()).equals(codePwd)){
			return new Msg("手机验证码错误!请重新获取,在提交保存",false);
		}
		
		Msg m = bsi.insert(t);
		if(m.isIs()){
			try {
				List<Files> list = 
						FileIOUtil.saveFile(files,"t_coc_member",t.getId());
				if(list!=null){
					fsi.insert(list.get(0));
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return m;
	}
	
	
	@RequestMapping("/aoe.coc")
	public String addOrEdit(HttpServletRequest req) throws Exception{
		String vals = req.getParameter("vals");
		if(vals!=null){
			vals = new String(vals.getBytes("iso-8859-1"),"utf-8");
			Menber menber = JSON.parseObject(vals, Menber.class);
			req.setAttribute("mb", menber);
		}
		return "/member/addOrEdit";
	}
	
	@Override
	public Msg edit(Menber t, MultipartFile[] files) {
		return bsi.edit(t);
	}
	
	@Override
	public Msg remove(Integer id) {
		return bsi.remove(id);
	}
	
	@RequestMapping("/showPro.coc")
	public String showPro(HttpServletRequest req) 
			throws Exception{
		String mps = req.getParameter("mps");
		if(mps!=null){
			mps = new String(mps.getBytes("iso-8859-1"),"utf-8");
			List<MemberProperties> list = JSON.parseArray(mps, MemberProperties.class);
			//设置request的编码格式
			req.setCharacterEncoding("utf-8");
			req.setAttribute("list", list);
		}
		return "/member/showPro";
	}
	
	@RequestMapping("/enterprise.coc")
	public String enterprise(HttpServletRequest req){
		String memId = req.getParameter("memId");
		
		Enterprise t = new Enterprise();
		t.setMemId(Integer.parseInt(memId));
		
		List<Enterprise> list = ebsi.find(t);
		req.setAttribute("list", list);
		req.setAttribute("memId", memId);
		return "/member/enterprise";
	}
	
	@RequestMapping("/editPwd")
	@ResponseBody
	public Msg editPwd(Menber m){
		String password = MD5Util.getMd5(m.getPassword());
		m = bsi.get(m);
		if(m==null){
			return new Msg("用户不存在,密码修改失败",false);
		}else{
			m.setPassword(password);
		}
		return bsi.edit(m);
	}
	
}
