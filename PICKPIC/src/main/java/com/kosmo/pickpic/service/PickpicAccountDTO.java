package com.kosmo.pickpic.service;

public class PickpicAccountDTO {
	//ppa 기본 컬럼
	private String ppa_id;
	private String ppa_email;
	private String ppa_password;
	private String ppa_nickname;
	private String ppa_join_date;
	private String ppa_type;
	private String ppa_token;
	private String ppa_profile_path;
	private String ppa_index;
	
	//편의상 제공하는 컬럼
	private String lh_ld;
	private String totalpick;
	private String totalpost;
	private String totalfilter;
	private String totalquestion;
	private String as_class;
	private String rownum;
	private String totalplace;
	private String totalroad;
	
	private String prb_title;
	private String prb_post_date;
	private String prb_content;

	
	public String getPrb_content() {
		return prb_content;
	}

	public void setPrb_content(String prb_content) {
		this.prb_content = prb_content;
	}

	public String getPrb_post_date() {
		return prb_post_date;
	}

	public void setPrb_post_date(String prb_post_date) {
		this.prb_post_date = prb_post_date;
	}

	public String getPrb_title() {
		return prb_title;
	}

	public void setPrb_title(String prb_title) {
		this.prb_title = prb_title;
	}

	//getter,setter
	public String getTotalplace() {
		return totalplace;
	}

	public void setTotalplace(String totalplace) {
		this.totalplace = totalplace;
	}

	public String getTotalroad() {
		return totalroad;
	}

	public void setTotalroad(String totalroad) {
		this.totalroad = totalroad;
	}

	public String getRownum() {
		return rownum;
	}

	public void setRownum(String rownum) {
		this.rownum = rownum;
	}
	public String getTotalpick() {
		return totalpick;
	}

	public void setTotalpick(String totalpick) {
		this.totalpick = totalpick;
	}

	public String getTotalpost() {
		return totalpost;
	}

	public void setTotalpost(String totalpost) {
		this.totalpost = totalpost;
	}

	public String getTotalfilter() {
		return totalfilter;
	}

	public void setTotalfilter(String totalfilter) {
		this.totalfilter = totalfilter;
	}

	public String getTotalquestion() {
		return totalquestion;
	}

	public void setTotalquestion(String totalquestion) {
		this.totalquestion = totalquestion;
	}

	public String getAs_class() {
		return as_class;
	}

	public void setAs_class(String as_class) {
		this.as_class = as_class;
	}

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

	public String getPpa_join_date() {
		return ppa_join_date;
	}

	public void setPpa_join_date(String ppa_join_date) {
		this.ppa_join_date = ppa_join_date;
	}

	public String getLh_ld() {
		return lh_ld;
	}

	public void setLh_ld(String lh_ld) {
		this.lh_ld = lh_ld;
	}

//	public java.sql.Date getLh_ld() {
//		return lh_ld;
//	}
//
//	public void setLh_ld(java.sql.Date lh_ld) {
//		this.lh_ld = lh_ld;
//	}
	
}
