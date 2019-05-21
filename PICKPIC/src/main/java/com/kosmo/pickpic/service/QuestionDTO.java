package com.kosmo.pickpic.service;

public class QuestionDTO {
    private String Q_ID;
    private String Q_TITLE;
    private String Q_CONTNET;
    private String Q_POST_DATE;
    private String Q_INDEX;
    private String PPA_ID;
    private String AQ_POST_DATE;
    
    //편의상 추가
  
    
    private String ppa_email;
    private String PPA_NICKNAME;
    
    
	public String getPPA_NICKNAME() {
		return PPA_NICKNAME;
	}
	public void setPPA_NICKNAME(String pPA_NICKNAME) {
		PPA_NICKNAME = pPA_NICKNAME;
	}
	public String getPpa_email() {
		return ppa_email;
	}
	public void setPpa_email(String ppa_email) {
		this.ppa_email = ppa_email;
	}

	

	public String getAQ_POST_DATE() {
		return AQ_POST_DATE;
	}
	public void setAQ_POST_DATE(String aQ_POST_DATE) {
		AQ_POST_DATE = aQ_POST_DATE;
	}
	public String getQ_ID() {
		return Q_ID;
	}
	public void setQ_ID(String q_ID) {
		Q_ID = q_ID;
	}
	public String getQ_TITLE() {
		return Q_TITLE;
	}
	public void setQ_TITLE(String q_TITLE) {
		Q_TITLE = q_TITLE;
	}
	public String getQ_CONTNET() {
		return Q_CONTNET;
	}
	public void setQ_CONTNET(String q_CONTNET) {
		Q_CONTNET = q_CONTNET;
	}
	public String getQ_POST_DATE() {
		return Q_POST_DATE;
	}
	public void setQ_POST_DATE(String q_POST_DATE) {
		Q_POST_DATE = q_POST_DATE;
	}
	public String getQ_INDEX() {
		return Q_INDEX;
	}
	public void setQ_INDEX(String q_INDEX) {
		Q_INDEX = q_INDEX;
	}
	public String getPPA_ID() {
		return PPA_ID;
	}
	public void setPPA_ID(String pPA_ID) {
		PPA_ID = pPA_ID;
	}
	
	
	
	
	
}
