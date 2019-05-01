package com.kosmo.pickpic.service;

public class PickpicUserDTO {
	//ppu_id},#{ppu_password},#{ppu_name},#{ppu_gender},#{ppu_nickname},#{ppu_profile_path}
	private String ppu_id;
	private String ppu_password;
	private String ppu_name;
	private String ppu_gender;
	private String ppu_nickname;
	private java.sql.Date ppu_register_date; 
	private String ppu_profile_path;
	public String getPpu_id() {
		return ppu_id;
	}
	public void setPpu_id(String ppu_id) {
		this.ppu_id = ppu_id;
	}
	public String getPpu_password() {
		return ppu_password;
	}
	public void setPpu_password(String ppu_password) {
		this.ppu_password = ppu_password;
	}
	public String getPpu_name() {
		return ppu_name;
	}
	public void setPpu_name(String ppu_name) {
		this.ppu_name = ppu_name;
	}
	public String getPpu_gender() {
		return ppu_gender;
	}
	public void setPpu_gender(String ppu_gender) {
		this.ppu_gender = ppu_gender;
	}
	public String getPpu_nickname() {
		return ppu_nickname;
	}
	public void setPpu_nickname(String ppu_nickname) {
		this.ppu_nickname = ppu_nickname;
	}
	public java.sql.Date getPpu_register_date() {
		return ppu_register_date;
	}
	public void setPpu_register_date(java.sql.Date ppu_register_date) {
		this.ppu_register_date = ppu_register_date;
	}
	public String getPpu_profile_path() {
		return ppu_profile_path;
	}
	public void setPpu_profile_path(String ppu_profile_path) {
		this.ppu_profile_path = ppu_profile_path;
	}
	
	
	//get set
	
	
	
	
	
	
}
