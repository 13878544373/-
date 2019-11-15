package com.entor.model;

import java.util.Date;

public class Enterprise extends BaseClass{

	private String work;
	private Date joinTime;
	private String industry;
	private String phone;
	private String address;
	private String url;
	private String produst;
	private String content;
	private Integer memId;
	public Enterprise() {}
	public Enterprise(String name, String work, Date joinTime, String industry, String phone, String address,
			String url, String produst, String content, Integer memId) {
		super();
		this.name = name;
		this.work = work;
		this.joinTime = joinTime;
		this.industry = industry;
		this.phone = phone;
		this.address = address;
		this.url = url;
		this.produst = produst;
		this.content = content;
		this.memId = memId;
	}
	public String getWork() {
		return work;
	}
	public void setWork(String work) {
		this.work = work;
	}
	public Date getJoinTime() {
		return joinTime;
	}
	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}
	public String getIndustry() {
		return industry;
	}
	public void setIndustry(String industry) {
		this.industry = industry;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getProdust() {
		return produst;
	}
	public void setProdust(String produst) {
		this.produst = produst;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Integer getMemId() {
		return memId;
	}
	public void setMemId(Integer memId) {
		this.memId = memId;
	}
	@Override
	public String toString() {
		return "Enterprise [name=" + name + ", work=" + work + ", joinTime=" + joinTime + ", industry=" + industry
				+ ", phone=" + phone + ", address=" + address + ", url=" + url + ", produst=" + produst + ", content="
				+ content + ", memId=" + memId + "]";
	}
	
}
