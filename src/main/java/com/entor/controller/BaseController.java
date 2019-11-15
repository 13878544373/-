package com.entor.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.entor.model.Msg;

@Controller
public class BaseController<T> {
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		binder.registerCustomEditor(Date.class, 
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), 
						true));
	}
	
	@RequestMapping("/find.coc")
	@ResponseBody
	public List<T> find(T t){
		return null;
	}
	
	@RequestMapping("/get.coc")
	@ResponseBody
	public T get(T t){
		return null;
	}
	
	@RequestMapping("/insertNoFile.coc")
	@ResponseBody
	public Msg insert(T t){
		return null;
	}
	
	@RequestMapping("/insert.coc")
	@ResponseBody
	public Msg insert(T t,
			@RequestParam(required=false,value="file") MultipartFile[] files){
		return null;
	}
	
	@RequestMapping("/edit.coc")
	@ResponseBody
	public Msg edit(T t,
			@RequestParam(required=false,value="file") MultipartFile[] files){
		return null;
	}
	
	@RequestMapping("/remove/{id}.coc")
	@ResponseBody
	public Msg remove(@PathVariable(value="id") Integer id){
		return null;
	}
	
	
	

}
