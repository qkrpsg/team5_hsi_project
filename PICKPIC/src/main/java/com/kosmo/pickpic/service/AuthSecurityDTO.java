package com.kosmo.pickpic.service;

public class AuthSecurityDTO {
	private String as_id;
	private String as_enabled_flag;
	private String as_class;
	private java.sql.Date as_date;
	private String as_index;
	private String as_key;
	
	private String ppa_id;

	public String getAs_id() {
		return as_id;
	}

	public void setAs_id(String as_id) {
		this.as_id = as_id;
	}

	public String getAs_enabled_flag() {
		return as_enabled_flag;
	}

	public void setAs_enabled_flag(String as_enabled_flag) {
		this.as_enabled_flag = as_enabled_flag;
	}

	public String getAs_class() {
		return as_class;
	}

	public void setAs_class(String as_class) {
		this.as_class = as_class;
	}

	public java.sql.Date getAs_date() {
		return as_date;
	}

	public void setAs_date(java.sql.Date as_date) {
		this.as_date = as_date;
	}

	public String getAs_index() {
		return as_index;
	}

	public void setAs_index(String as_index) {
		this.as_index = as_index;
	}

	public String getAs_key() {
		return as_key;
	}

	public void setAs_key(String as_key) {
		this.as_key = as_key;
	}

	public String getPpa_id() {
		return ppa_id;
	}

	public void setPpa_id(String ppa_id) {
		this.ppa_id = ppa_id;
	}
}
