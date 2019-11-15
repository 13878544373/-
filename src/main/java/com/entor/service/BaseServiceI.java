package com.entor.service;

import java.util.List;
import com.entor.model.Msg;

public interface BaseServiceI<T> {
	
	public List<T> find(T t);
	
	public T get(T t);
	
	public Msg insert(T t);
	public Msg batchInsert(String objs);
	
	public Msg edit(T t);
	
	public Msg remove(Integer id);
	public Msg batchRemove(String ids);

}
