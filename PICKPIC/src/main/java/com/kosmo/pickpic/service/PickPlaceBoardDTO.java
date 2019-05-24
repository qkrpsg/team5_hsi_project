package com.kosmo.pickpic.service;

public class PickPlaceBoardDTO {
	//컬럼 변수 생성
	private String ppb_id;
	private String ppb_title;
	private String ppb_content;
	private java.sql.Date ppb_post_date;
	private String ppb_count;
	private String ppb_pick;
	private String ppb_nation;
	private String ppb_city;
	private String ppb_area;
	private String ppb_detail;
	private String ppb_image_path;
	private String ppb_index;
	//외래키 변수 생성
	private String f_id;
	private String ppa_id;
	//작성자 닉네임을 얻기 위한 변수 생성
	private String ppa_nickname;
	
	private String f_name;
	private String rownum;
	
	//getter,setter
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getRownum() {
		return rownum;
	}
	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getPpb_id() {
		return ppb_id;
	}
	public void setPpb_id(String ppb_id) {
		this.ppb_id = ppb_id;
	}
	public String getPpb_title() {
		return ppb_title;
	}
	public void setPpb_title(String ppb_title) {
		this.ppb_title = ppb_title;
	}
	public String getPpb_content() {
		return ppb_content;
	}
	public void setPpb_content(String ppb_content) {
		this.ppb_content = ppb_content;
	}
	public java.sql.Date getPpb_post_date() {
		return ppb_post_date;
	}
	public void setPpb_post_date(java.sql.Date ppb_post_date) {
		this.ppb_post_date = ppb_post_date;
	}
	public String getPpb_count() {
		return ppb_count;
	}
	public void setPpb_count(String ppb_count) {
		this.ppb_count = ppb_count;
	}
	public String getPpb_pick() {
		return ppb_pick;
	}
	public void setPpb_pick(String ppb_pick) {
		this.ppb_pick = ppb_pick;
	}
	public String getPpb_nation() {
		return ppb_nation;
	}
	public void setPpb_nation(String ppb_nation) {
		this.ppb_nation = ppb_nation;
	}
	public String getPpb_city() {
		return ppb_city;
	}
	public void setPpb_city(String ppb_city) {
		this.ppb_city = ppb_city;
	}
	public String getPpb_area() {
		return ppb_area;
	}
	public void setPpb_area(String ppb_area) {
		this.ppb_area = ppb_area;
	}
	public String getPpb_detail() {
		return ppb_detail;
	}
	public void setPpb_detail(String ppb_detail) {
		this.ppb_detail = ppb_detail;
	}
	public String getPpb_image_path() {
		return ppb_image_path;
	}
	public void setPpb_image_path(String ppb_image_path) {
		this.ppb_image_path = ppb_image_path;
	}
	public String getPpb_index() {
		return ppb_index;
	}
	public void setPpb_index(String ppb_index) {
		this.ppb_index = ppb_index;
	}
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getPpa_id() {
		return ppa_id;
	}
	public void setPpa_id(String ppa_id) {
		this.ppa_id = ppa_id;
	}
	public String getPpa_nickname() {
		return ppa_nickname;
	}
	public void setPpa_nickname(String ppa_nickname) {
		this.ppa_nickname = ppa_nickname;
	}
}
