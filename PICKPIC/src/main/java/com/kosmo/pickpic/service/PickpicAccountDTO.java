package com.kosmo.pickpic.service;

public class PickpicAccountDTO {
	private String ppa_id;
	private String ppa_email;
	private String ppa_password;
	private String ppa_nickname;
	private java.sql.Date ppa_join_date;
	private String ppa_type;
	private String ppa_token;
	private String ppa_profile_path;
	private String ppa_index;
	
	private String lh_ld;
	
	//getter,setter
	public String getPpa_id() {
		return ppa_id;
	}

	public void setPpa_id(String ppa_id) {
		this.ppa_id = ppa_id;
	}

	public String getPpa_email() {
		return ppa_email;
	}

	public void setPpa_email(String ppa_email) {
		this.ppa_email = ppa_email;
	}

	public String getPpa_password() {
		return ppa_password;
	}

	public void setPpa_password(String ppa_password) {
		this.ppa_password = ppa_password;
	}

	public String getPpa_nickname() {
		return ppa_nickname;
	}

	public void setPpa_nickname(String ppa_nickname) {
		this.ppa_nickname = ppa_nickname;
	}

	public java.sql.Date getPpa_join_date() {
		return ppa_join_date;
	}

	public void setPpa_join_date(java.sql.Date ppa_join_date) {
		this.ppa_join_date = ppa_join_date;
	}

	public String getPpa_type() {
		return ppa_type;
	}

	public void setPpa_type(String ppa_type) {
		this.ppa_type = ppa_type;
	}

	public String getPpa_token() {
		return ppa_token;
	}

	public void setPpa_token(String ppa_token) {
		this.ppa_token = ppa_token;
	}

	public String getPpa_profile_path() {
		return ppa_profile_path;
	}

	public void setPpa_profile_path(String ppa_profile_path) {
		this.ppa_profile_path = ppa_profile_path;
	}

	public String getPpa_index() {
		return ppa_index;
	}

	public void setPpa_index(String ppa_index) {
		this.ppa_index = ppa_index;
	}

	public String getLh_ld() {
		return lh_ld;
	}

	public void setLh_ld(String lh_ld) {
		this.lh_ld = lh_ld;
	}
	
}
