package com.entor.model;

public class Msg {
	
	private String msg;
	private boolean is;
	private Object obj;
	public Msg() {}
	public Msg(String msg, boolean is) {
		super();
		this.msg = msg;
		this.is = is;
	}
	public Msg(String msg, boolean is, Object obj) {
		super();
		this.msg = msg;
		this.is = is;
		this.obj = obj;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean isIs() {
		return is;
	}
	public void setIs(boolean is) {
		this.is = is;
	}
	public Object getObj() {
		return obj;
	}
	public void setObj(Object obj) {
		this.obj = obj;
	}
	

}
