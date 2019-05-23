package com.kosmo.pickpic.service;

public class PaymentDTO {

	private String p_id;
	private String p_price;
	private String p_method;
	private String p_date;
	private String p_index;
	private String f_id;
	private String ppa_id;
	
	
	public String getP_id() {
		return p_id;
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
	public void setP_id(String p_id) {
		this.p_id = p_id;
	}
	public String getP_price() {
		return p_price;
	}
	public void setP_price(String p_price) {
		this.p_price = p_price;
	}
	public String getP_method() {
		return p_method;
	}
	public void setP_method(String p_method) {
		this.p_method = p_method;
	}
	public String getP_date() {
		return p_date;
	}
	public void setP_date(String p_date) {
		this.p_date = p_date;
	}
	public String getP_index() {
		return p_index;
	}
	public void setP_index(String p_index) {
		this.p_index = p_index;
	}
	
	
	
	
}//payment
