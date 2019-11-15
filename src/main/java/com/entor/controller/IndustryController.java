package com.entor.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.entor.model.Industry;
import com.entor.service.BaseServiceI;
@Controller
@RequestMapping("/ic")
public class IndustryController extends BaseController<Industry>{

	@Resource(name="industryService")
	private BaseServiceI<Industry> ibsi;
	
	@Override
	public List<Industry> find(Industry t) {
		return ibsi.find(t);
	}
}






