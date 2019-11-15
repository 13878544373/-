package com.entor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entor.dao.IndustryDaoI;
import com.entor.model.Industry;
import com.entor.model.Msg;

@Service
public class IndustryService implements BaseServiceI<Industry>{
	
	@Autowired
	private IndustryDaoI idi;

	public List<Industry> find(Industry t) {
		List<Industry> list = idi.find(t);
		return list;
	}

	public Industry get(Industry t) {
		return null;
	}

	public Msg insert(Industry t) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg batchInsert(String objs) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg edit(Industry t) {
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
