package com.entor.model;

public class Files extends BaseClass{

	private String tname;
	private Integer tid;
	private String fileSize;
	private String oldName;
	private String newName;
	private String filePath;
	public Files() {}
	public Files(String tname, Integer tid, String fileSize, String oldName, String newName, String filePath) {
		super();
		this.tname = tname;
		this.tid = tid;
		this.fileSize = fileSize;
		this.oldName = oldName;
		this.newName = newName;
		this.filePath = filePath;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
	}
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getOldName() {
		return oldName;
	}
	public void setOldName(String oldName) {
		this.oldName = oldName;
	}
	public String getNewName() {
		return newName;
	}
	public void setNewName(String newName) {
		this.newName = newName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	@Override
	public String toString() {
		return "Files [tname=" + tname + ", tid=" + tid + ", fileSize=" + fileSize + ", oldName=" + oldName
				+ ", newName=" + newName + ", filePath=" + filePath + "]";
	}
	
}
