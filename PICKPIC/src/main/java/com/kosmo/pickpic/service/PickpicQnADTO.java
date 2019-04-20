package com.kosmo.pickpic.service;

public class PickpicQnADTO {
	
	private String qnaNo;
	private String oftenquestion;
	private String myqna;
	private String consultant;
	private String customersound;
	private String content;
	private String qnaDate;
	private String replyContent;
	private String replyDate;
	private String id;
	
	//게터/세터]
	public String getNo() {
		return qnaNo;
	}
	
	public void setNo(String no) {
		this.qnaNo = qnaNo;
	}
	
	public String getOftenquestion() {
		return oftenquestion;
	}
	public void setOftenquestion(String oftenquestion) {
		this.oftenquestion = oftenquestion;
	}
	public String getMyqna() {
		return myqna;
	}
	public void setMyqna(String myqna) {
		this.myqna = myqna;
	}
	public String getConsultant() {
		return consultant;
	}
	public void setConsultant(String consultant) {
		this.consultant = consultant;
	}
	public String getCustomersound() {
		return customersound;
	}
	public void setCustomersound(String customersound) {
		this.customersound = customersound;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getQnaDate() {
		return qnaDate;
	}
	public void setQnaDate(String qnaDate) {
		this.qnaDate = qnaDate;
	}
	public String getReplyContent() {
		return replyContent;
	}
	public void setReplyContent(String replyContent) {
		this.replyContent = replyContent;
	}
	public String getReplyDate() {
		return replyDate;
	}
	public void setReplyDate(String replyDate) {
		this.replyDate = replyDate;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
}
