 package com.kosmo.pickpic.service;

public class FormCommand {
	//폼의 파라미터명과 같게 속성(멤버변수) 정의]
	private String ppa_id;
	private String ppa_email;
	private String ppa_password;
	private String ppa_name;
	private String ppa_nickname;
	private java.sql.Date ppa_join;
	private String ppa_type;
	private String ppa_token;
	private String ppa_profile_path;
	private String ppa_index;
	
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
	public String getPpa_name() {
		return ppa_name;
	}
	public void setPpa_name(String ppa_name) {
		this.ppa_name = ppa_name;
	}
	public String getPpa_nickname() {
		return ppa_nickname;
	}
	public void setPpa_nickname(String ppa_nickname) {
		this.ppa_nickname = ppa_nickname;
	}
	public java.sql.Date getPpa_join() {
		return ppa_join;
	}
	public void setPpa_join(java.sql.Date ppa_join) {
		this.ppa_join = ppa_join;
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
}
