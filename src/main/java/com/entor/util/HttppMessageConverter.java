package com.entor.util;

import java.io.IOException;
import java.io.OutputStream;

import org.springframework.http.HttpInputMessage;
import org.springframework.http.HttpOutputMessage;
import org.springframework.http.converter.AbstractHttpMessageConverter;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.http.converter.HttpMessageNotWritableException;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;
/**
 * 前端数据与后台数据交互的数据封装类
 * @author HQJ
 * @date 2019年10月30日 上午10:32:29
 * @version 1.0
 */
public class HttppMessageConverter extends 
	AbstractHttpMessageConverter<Object>{
	
	private SerializerFeature[] sf;

	@Override
	protected Object readInternal(Class<? extends Object> arg0, HttpInputMessage arg1)
			throws IOException, HttpMessageNotReadableException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	protected boolean supports(Class<?> arg0) {
		return true;
	}

	@Override
	protected void writeInternal(Object arg0, HttpOutputMessage arg1)
			throws IOException, HttpMessageNotWritableException {
		OutputStream out = arg1.getBody();
		byte []bs;
		if(sf!=null){
			bs = JSON.toJSONBytes(arg0, sf);
		}else{
			bs = JSON.toJSONBytes(arg0, SerializerFeature.WriteDateUseDateFormat);
		}
		out.write(bs);
	}

}
