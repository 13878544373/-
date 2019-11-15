package com.entor.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.entor.model.Enterprise;
import com.entor.model.Msg;
import com.entor.service.BaseServiceI;
@RequestMapping("/ec")
@Controller
public class EnterpriseController extends BaseController<Enterprise>{
	
	@Resource(name="enterpriseService")
	private BaseServiceI<Enterprise> ebsi;
	
	@Override
	public List<Enterprise> find(Enterprise t) {
		return ebsi.find(t);
	}
	
	@Override
	public Msg insert(Enterprise t,
			@RequestParam(required=false,value="file")MultipartFile[] files) {
		return ebsi.insert(t);
	}

}
