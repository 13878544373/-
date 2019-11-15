package com.entor.model;

public class User extends BaseClass{
	
	private String userName;
	private String password;
	private String loginName;
	private Integer roleId;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getLoginName() {
		return loginName;
	}
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	@Override
	public String toString() {
		return "User [userName=" + userName + ", password=" + password + ", loginName=" + loginName + ", roleId="
				+ roleId + "]";
	}

}
