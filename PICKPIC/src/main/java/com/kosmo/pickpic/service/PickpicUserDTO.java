package com.kosmo.pickpic.service;

public class PickpicUserDTO {
	//
	private String addr;
	private java.sql.Date regidate;
	private String id;
	//프로그램 효율성을 위한 속성 추가]
	private String name;
	private String age;
	private String pwd;
	private String mfm;
	private String socialnumber;
	private String profilepicture;
	//게터/세터]
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public java.sql.Date getRegidate() {
		return regidate;
	}
	public void setRegidate(java.sql.Date regidate) {
		this.regidate = regidate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getMfm() {
		return mfm;
	}
	public void setMfm(String mfm) {
		this.mfm = mfm;
	}
	public String getSocialnumber() {
		return socialnumber;
	}
	public void setSocialnumber(String socialnumber) {
		this.socialnumber = socialnumber;
	}
	public String getProfilepicture() {
		return profilepicture;
	}
	public void setProfilepicture(String profilepicture) {
		this.profilepicture = profilepicture;
	}
	
	
}
