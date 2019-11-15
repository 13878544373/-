package com.entor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entor.dao.EnterpriseDaoI;
import com.entor.model.Enterprise;
import com.entor.model.Msg;

@Service
public class EnterpriseService implements BaseServiceI<Enterprise>{
	
	@Autowired
	private EnterpriseDaoI edi;

	public List<Enterprise> find(Enterprise t) {
		return edi.find(t);
	}

	public Enterprise get(Enterprise t) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg insert(Enterprise t) {
		Msg m = new Msg("保存失败", false);
		int i = edi.insert(t);
		if(i>0) m = new Msg("保存成功", true,t);
		return m;
	}

	public Msg batchInsert(String objs) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg edit(Enterprise t) {
		// TODO Auto-generated method stub
		return null;
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
