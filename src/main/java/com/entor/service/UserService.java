package com.entor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entor.dao.UserDaoI;
import com.entor.model.Msg;
import com.entor.model.User;
import com.entor.util.MD5Util;

@Service
public class UserService implements BaseServiceI<User>{
	
	@Autowired
	private UserDaoI udi;

	public List<User> find(User t) {
		List<User> list = udi.find(t);
		return list;
	}

	public User get(User t) {
		List<User> list = this.find(t);
		return list.size()>0?list.get(0):null;
	}

	public Msg insert(User t) {
		Msg m = new Msg("新增失败", false);
		t.setPassword(MD5Util.getMd5(t.getPassword()));
		int i = udi.insert(t);
		if(i>0) m = new Msg("新增成功", true);
		return m;
	}

	public Msg batchInsert(String objs) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg edit(User t) {
		Msg m = new Msg("修改失败", false);
		int i = udi.edit(t);
		if(i>0) new Msg("修改成功", true);
		return m;
	}

	public Msg remove(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg batchRemove(String ids) {
		// TODO Auto-generated method stub
		return null;
	}

}
