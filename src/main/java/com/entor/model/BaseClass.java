package com.entor.model;

import java.text.SimpleDateFormat;
import java.util.Date;

public class BaseClass {
	
	public Integer id;
	public String name;
	public String sex;
	public Integer age;
	public Date birthday;
	public String bir;
	public Date createDate;
	public String state; 
	public String code;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public String getBir() {
		if(this.birthday==null)
			return bir;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(this.birthday);
	}
	public void setBir(String bir) {
		this.bir = bir;
	}
	public String getState() {
		if(this.state==null){
			this.state = "0";
		}
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
}
