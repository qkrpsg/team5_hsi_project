package com.kosmo.pickpic.service;

public class QuestionDTO {
    private String q_id;
    private String q_title;
    private String q_content;
    private String q_post_date;
    private String q_index;
    private String ppa_id;
    private String aq_post_date;
    
    //편의상 추가
    private String aq_content;
    public String getAq_content() {
		return aq_content;
	}
	public void setAq_content(String aq_content) {
		this.aq_content = aq_content;
	}
	private String ppa_index;
    private String ppa_email;
    private String ppa_nickname;
	public String getQ_id() {
		return q_id;
	}
	public String getPpa_index() {
		return ppa_index;
	}
	public void setPpa_index(String ppa_index) {
		this.ppa_index = ppa_index;
	}
	public void setQ_id(String q_id) {
		this.q_id = q_id;
	}
	public String getQ_title() {
		return q_title;
	}
	public void setQ_title(String q_title) {
		this.q_title = q_title;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_post_date() {
		return q_post_date;
	}
	public void setQ_post_date(String q_post_date) {
		this.q_post_date = q_post_date;
	}
	public String getQ_index() {
		return q_index;
	}
	public void setQ_index(String q_index) {
		this.q_index = q_index;
	}
	public String getPpa_id() {
		return ppa_id;
	}
	public void setPpa_id(String ppa_id) {
		this.ppa_id = ppa_id;
	}
	public String getAq_post_date() {
		return aq_post_date;
	}
	public void setAq_post_date(String aq_post_date) {
		this.aq_post_date = aq_post_date;
	}
	public String getPpa_email() {
		return ppa_email;
	}
	public void setPpa_email(String ppa_email) {
		this.ppa_email = ppa_email;
	}
	public String getPpa_nickname() {
		return ppa_nickname;
	}
	public void setPpa_nickname(String ppa_nickname) {
		this.ppa_nickname = ppa_nickname;
	}

	
}
