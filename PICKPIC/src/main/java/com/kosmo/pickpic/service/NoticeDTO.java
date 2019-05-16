package com.kosmo.pickpic.service;

public class NoticeDTO {
	//멤버변수
	private String n_id;
	private String n_index; //번호
	private String n_title;
	private String n_content;
	private String n_post_date;
	
	//게터,세터
	public String getN_id() {
		return n_id;
	}
	public void setN_id(String n_id) {
		this.n_id = n_id;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_post_date() {
		return n_post_date;
	}
	public void setN_post_date(String n_post_date) {
		this.n_post_date = n_post_date;
	}
	public String getN_index() {
		return n_index;
	}
	public void setN_index(String n_index) {
		this.n_index = n_index;
	}
}
