package com.kosmo.pickpic.service;

public class TipBoardDTO {
    //컬럼 변수 생성
	private String tb_id;
	private String tb_title;
	private String tb_content;
	private java.sql.Date tb_post_date;
	private String tb_count;
	private String tb_index;
	//외래키 변수 생성
	private String ppa_id;
	
	//getter,setter
	public String getTb_id() {
		return tb_id;
	}
	public void setTb_id(String tb_id) {
		this.tb_id = tb_id;
	}
	public String getTb_title() {
		return tb_title;
	}
	public void setTb_title(String tb_title) {
		this.tb_title = tb_title;
	}
	public String getTb_content() {
		return tb_content;
	}
	public void setTb_content(String tb_content) {
		this.tb_content = tb_content;
	}
	public java.sql.Date getTb_post_date() {
		return tb_post_date;
	}
	public void setTb_post_date(java.sql.Date tb_post_date) {
		this.tb_post_date = tb_post_date;
	}
	public String getTb_count() {
		return tb_count;
	}
	public void setTb_count(String tb_count) {
		this.tb_count = tb_count;
	}
	public String getTb_index() {
		return tb_index;
	}
	public void setTb_index(String tb_index) {
		this.tb_index = tb_index;
	}
	public String getPpa_id() {
		return ppa_id;
	}
	public void setPpa_id(String ppa_id) {
		this.ppa_id = ppa_id;
	}
	
	
	
}
