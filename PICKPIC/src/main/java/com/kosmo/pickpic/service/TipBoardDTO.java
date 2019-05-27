package com.kosmo.pickpic.service;

public class TipBoardDTO {
    //컬럼 변수 생성
	private String TB_ID;
	private String TB_TITLE;
	private String TB_CONTENT;
	private String TB_POST_DATE;
	private String TB_COUNT;
	private String TB_INDEX;
	
	//외래키 변수 생성
	private String PPA_ID;
	
	//편의상 추가
	private String aq_content;
	private String aq_post_date;
	
	
	//getter,setter
	public String getAq_content() {
		return aq_content;
	}
	public String getTB_ID() {
		return TB_ID;
	}
	public void setTB_ID(String tB_ID) {
		TB_ID = tB_ID;
	}
	public String getTB_TITLE() {
		return TB_TITLE;
	}
	public void setTB_TITLE(String tB_TITLE) {
		TB_TITLE = tB_TITLE;
	}
	public String getTB_CONTENT() {
		return TB_CONTENT;
	}
	public void setTB_CONTENT(String tB_CONTENT) {
		TB_CONTENT = tB_CONTENT;
	}
	public String getTB_POST_DATE() {
		return TB_POST_DATE;
	}
	public void setTB_POST_DATE(String tB_POST_DATE) {
		TB_POST_DATE = tB_POST_DATE;
	}
	public String getTB_COUNT() {
		return TB_COUNT;
	}
	public void setTB_COUNT(String tB_COUNT) {
		TB_COUNT = tB_COUNT;
	}
	public String getTB_INDEX() {
		return TB_INDEX;
	}
	public void setTB_INDEX(String tB_INDEX) {
		TB_INDEX = tB_INDEX;
	}
	public String getPPA_ID() {
		return PPA_ID;
	}
	public void setPPA_ID(String pPA_ID) {
		PPA_ID = pPA_ID;
	}
	public void setAq_content(String aq_content) {
		this.aq_content = aq_content;
	}
	public String getAq_post_date() {
		return aq_post_date;
	}
	public void setAq_post_date(String aq_post_date) {
		this.aq_post_date = aq_post_date;
	}
	
	
}
