package com.entor.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseDaoI<T> {
	
	public List<T> find(T t);
	
	public int insert(T t);
	public int insert(@Param(value="list")List<T> list);
	
	public int edit(T t);
	
	public int remove(@Param(value="id") Integer id);
	public int batchRemove(@Param(value="list")List<Integer> ids);

}
