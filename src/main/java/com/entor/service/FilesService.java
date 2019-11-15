package com.entor.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.entor.dao.FilesDaoI;
import com.entor.model.Files;
import com.entor.model.Msg;

@Service
public class FilesService implements BaseServiceI<Files>{
	
	@Autowired
	private FilesDaoI fdi;

	public List<Files> find(Files t) {
		return fdi.find(t);
	}

	public Files get(Files t) {
		List<Files> list = this.find(t);
		return list.size()>0?list.get(0):null;
	}

	public Msg insert(Files t) {
		Msg m = new Msg("保存失败", false);
		int i = fdi.insert(t);
		if(i>0) m = new Msg("保存成功", true);
		return m;
	}

	public Msg batchInsert(String objs) {
		// TODO Auto-generated method stub
		return null;
	}

	public Msg edit(Files t) {
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
