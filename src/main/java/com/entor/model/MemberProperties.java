package com.entor.model;

import java.util.Date;

public class MemberProperties extends BaseClass{
	
	private Integer cocId;
	private String cocName;
	private Integer memId;
	private String properties;
	private Integer cocWork;
	private String workName;
	private Date joinTime;
	private Date fireTime;
	
	public MemberProperties() {}

	public MemberProperties(Integer cocId, String properties, Integer cocWork, Date joinTime, Date fireTime) {
		super();
		this.cocId = cocId;
		this.properties = properties;
		this.cocWork = cocWork;
		this.joinTime = joinTime;
		this.fireTime = fireTime;
	}

	public String getCocName() {
		return cocName;
	}

	public void setCocName(String cocName) {
		this.cocName = cocName;
	}

	public String getWorkName() {
		return workName;
	}

	public void setWorkName(String workName) {
		this.workName = workName;
	}

	public Integer getCocId() {
		return cocId;
	}

	public void setCocId(Integer cocId) {
		this.cocId = cocId;
	}

	public String getProperties() {
		return properties;
	}

	public void setProperties(String properties) {
		this.properties = properties;
	}

	public Integer getCocWork() {
		return cocWork;
	}

	public void setCocWork(Integer cocWork) {
		this.cocWork = cocWork;
	}

	public Date getJoinTime() {
		return joinTime;
	}

	public void setJoinTime(Date joinTime) {
		this.joinTime = joinTime;
	}

	public Date getFireTime() {
		return fireTime;
	}

	public void setFireTime(Date fireTime) {
		this.fireTime = fireTime;
	}

	public Integer getMemId() {
		return memId;
	}

	public void setMemId(Integer memId) {
		this.memId = memId;
	}

	@Override
	public String toString() {
		return "MemberProperties [cocId=" + cocId + ", properties=" + properties + ", cocWork=" + cocWork
				+ ", joinTime=" + joinTime + ", fireTime=" + fireTime + "]";
	}
	

}
