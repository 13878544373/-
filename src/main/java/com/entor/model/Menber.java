package com.entor.model;

import java.util.List;

public class Menber extends BaseClass{
	
	private String loginName;
	private String password;
	private Integer nationId;
	private String address;
	private String idcard;
	private String eduction;
	private String tellphone;
	private String email;
	private String qq;
	private String wechat;
	private String mobile;
	private List<MemberProperties> mps;
	private List<Enterprise> emps;
	public Menber() {}
	
	public Menber(String loginName, String password, Integer nationId, String address, String idcard, String eduction,
			String tellphone, String email, String qq, String wechat, String mobile) {
		super();
		this.loginName = loginName;
		this.password = password;
		this.nationId = nationId;
		this.address = address;
		this.idcard = idcard;
		this.eduction = eduction;
		this.tellphone = tellphone;
		this.email = email;
		this.qq = qq;
		this.wechat = wechat;
		this.mobile = mobile;
	}

	public List<Enterprise> getEmps() {
		return emps;
	}

	public void setEmps(List<Enterprise> emps) {
		this.emps = emps;
	}

	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public Integer getNationId() {
		return nationId;
	}
	public void setNationId(Integer nationId) {
		this.nationId = nationId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getIdcard() {
		return idcard;
	}
	public void setIdcard(String idcard) {
		this.idcard = idcard;
	}
	public String getEduction() {
		return eduction;
	}
	public void setEduction(String eduction) {
		this.eduction = eduction;
	}
	public String getTellphone() {
		return tellphone;
	}
	public void setTellphone(String tellphone) {
		this.tellphone = tellphone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getWechat() {
		return wechat;
	}
	public void setWechat(String wechat) {
		this.wechat = wechat;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public List<MemberProperties> getMps() {
		return mps;
	}

	public void setMps(List<MemberProperties> mps) {
		this.mps = mps;
	}

}
