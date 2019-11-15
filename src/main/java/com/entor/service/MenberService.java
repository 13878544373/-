package com.entor.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entor.dao.EnterpriseDaoI;
import com.entor.dao.MemberPropertiesDaoI;
import com.entor.dao.MenberDaoI;
import com.entor.model.Enterprise;
import com.entor.model.MemberProperties;
import com.entor.model.Menber;
import com.entor.model.Msg;
import com.entor.util.Ch2PinYin;
import com.entor.util.MD5Util;
import com.entor.util.SendUtil;
@Service
public class MenberService implements BaseServiceI<Menber> {
	
	@Autowired
	private MenberDaoI mdi;
	@Autowired
	private MemberPropertiesDaoI mpdi;
	@Autowired
	private EnterpriseDaoI edi;

	public List<Menber> find(Menber t) {
		List<Menber> newList = new ArrayList<Menber>();
		List<Menber> list = mdi.find(t);
		for (Menber menber : list) {
			//查询会员性质
			MemberProperties mp = new MemberProperties();
			mp.setMemId(menber.getId());
			List<MemberProperties> mps = mpdi.find(mp);
			menber.setMps(mps);
			//查询企业信息
			Enterprise emp = new Enterprise();
			emp.setMemId(menber.getId());
			List<Enterprise> emps = edi.find(emp);
			menber.setEmps(emps);
			
			//重新添加到新的集合中
			newList.add(menber);
		}
		return newList;
	}

	public Menber get(Menber t) {
		List<Menber> list = this.find(t);
		
		return list.size()>0?list.get(0):null;
	}

	public Msg insert(Menber t) {
		
		//设置登录名
		String loginName = Ch2PinYin.getFirstChPy(t.getName())
				+new SimpleDateFormat("MMdd").format(t.getBirthday());
		t.setLoginName(loginName);
		//设置密码
		String password = MD5Util.getMd5(t.getIdcard().substring(t.getIdcard().length()-6));
		t.setPassword(password);
		
		int i = mdi.insert(t);
		Msg m = new Msg("保存失败", false);
		if(i>0){
			m.setMsg("保存成功");
			m.setIs(true);
		}
		return m;
	}

	public Msg batchInsert(String objs) {
		return null;
	}

	public Msg edit(Menber t) {
		int i = mdi.edit(t);
		Msg m = new Msg("更新失败", false);
		if(i>0){
			m.setMsg("更新成功");
			m.setIs(true);
		}
		return m;
	}

	public Msg remove(Integer id) {
		int i = mdi.remove(id);
		Msg m = new Msg("删除失败", false);
		if(i>0){
			m.setMsg("删除成功");
			m.setIs(true);
		}
		return m;
	}

	public Msg batchRemove(String ids) {
		// TODO Auto-generated method stub
		return null;
	}
	
	public Msg sendEmail(String loginName,HttpServletRequest req){
		Msg m = new Msg();
		Menber menber = new Menber();
		menber.setLoginName(loginName);
		
		menber = this.get(menber);
		if(menber==null){
			m = new Msg("邮件发送失败,该用户不存在",false);
		}else{
			String to = menber.getEmail();
			if(to==null||to==""){
				m = new Msg("邮件发送失败,该用户邮箱不存在,<br/>请联系管理员383391403@qq.com",false);
			}else{
				Calendar c = Calendar.getInstance();
				c.add(Calendar.MINUTE, 20);
				Random r = new Random();
				String code = (r.nextInt(9000)+1000)+"";
				menber.setCode(code);
				mdi.edit(menber);
				//req.getSession().setAttribute("pwdCode", code);
				
				String token = "?login="+loginName
						+"&ms="+c.getTimeInMillis()
						+"&token="+MD5Util.getMd5(code);
				String content="此链接只能用于'商会后台管理系统'的密码找回，点击该链接"
						+ "<a href='#'>"
						+ "http://localhost:8082"+req.getContextPath()+"/sc/editPwd.coc"
						+token+ "</a>";
				System.out.println("content:"+content);
				
				boolean b = SendUtil.sendEmail(to, content);
				if(b)
					m = new Msg("邮件发送成功", true, menber);
				else
					m = new Msg("邮件发送失败,邮件服务器掉链子了，请稍候再尝试！", false);
			}
		}
		return m;
	}
	
	
	public Msg editPwd(HttpServletRequest req,String ...str){
		Msg m = new Msg("验证成功",true);
		//判断时间是否有效
		String ms = str[1]==null?"0":str[1];
		ms = ms.replaceAll("[^0-9]+", "");
		long mins = Long.parseLong(ms);
		if(System.currentTimeMillis()>mins){
			m = new Msg("链接时间已过，无法修改，请重新获取链接!", false);
			return m;
		}
		
		//获取token
		String token = str[2];
		//获取session的验证码
		//String code = req.getSession().getAttribute("pwdCode")+"";
		Menber menber = new Menber();
		menber.setLoginName(str[0]);
		menber = this.get(menber);
		if(menber==null){
			m = new Msg("链接内容被非法修改，无法修改，请重新获取链接!", false);
			return m;
		}
		String code = menber.getCode();
		if(!MD5Util.getMd5(code).equals(token)){
			m = new Msg("token错误，无法修改，请重新获取链接!", false);
			return m;
		}
		//销毁session
		//req.getSession().removeAttribute("pwdCode");
		
		menber = new Menber();
		menber.setLoginName(str[0]);
		m.setObj(menber);
		return m;
	}

}
