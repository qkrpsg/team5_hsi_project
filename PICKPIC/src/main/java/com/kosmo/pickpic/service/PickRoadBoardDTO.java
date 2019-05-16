package com.kosmo.pickpic.service;

public class PickRoadBoardDTO {
	//컬럼 변수 생성
	private String prb_id;
	private String prb_title;
	private String prb_content;
	private java.sql.Date prb_post_date;
	private String prb_view;
	private String prb_recommend;
	private java.sql.Date prb_start_date;
	private java.sql.Date prb_end_date;
	private String prb_index;
	//외래키 변수 생성
	private String ppa_id;
	
	//getter, setter
	public String getPrb_id() {
		return prb_id;
	}
	public void setPrb_id(String prb_id) {
		this.prb_id = prb_id;
	}
	public String getPrb_title() {
		return prb_title;
	}
	public void setPrb_title(String prb_title) {
		this.prb_title = prb_title;
	}
	public String getPrb_content() {
		return prb_content;
	}
	public void setPrb_content(String prb_content) {
		this.prb_content = prb_content;
	}
	public java.sql.Date getPrb_post_date() {
		return prb_post_date;
	}
	public void setPrb_post_date(java.sql.Date prb_post_date) {
		this.prb_post_date = prb_post_date;
	}
	public String getPrb_view() {
		return prb_view;
	}
	public void setPrb_view(String prb_view) {
		this.prb_view = prb_view;
	}
	public String getPrb_recommend() {
		return prb_recommend;
	}
	public void setPrb_recommend(String prb_recommend) {
		this.prb_recommend = prb_recommend;
	}
	public java.sql.Date getPrb_start_date() {
		return prb_start_date;
	}
	public void setPrb_start_date(java.sql.Date prb_start_date) {
		this.prb_start_date = prb_start_date;
	}
	public java.sql.Date getPrb_end_date() {
		return prb_end_date;
	}
	public void setPrb_end_date(java.sql.Date prb_end_date) {
		this.prb_end_date = prb_end_date;
	}
	public String getPrb_index() {
		return prb_index;
	}
	public void setPrb_index(String prb_index) {
		this.prb_index = prb_index;
	}
	public String getPpa_id() {
		return ppa_id;
	}
	public void setPpa_id(String ppa_id) {
		this.ppa_id = ppa_id;
	}
}
