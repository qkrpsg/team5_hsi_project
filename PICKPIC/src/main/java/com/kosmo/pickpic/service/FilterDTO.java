package com.kosmo.pickpic.service;

public class FilterDTO {
	//컬럼 변수 생성
	private String f_id;
	private String f_name;
	private String f_price;
	private String f_post_date;
	private String f_change_date;
	private String f_reason;
	private String f_sale_yn;
	private String f_event_yn;
	private String f_index_number;
	
	private String totalFilter;
	private String filterName;

	//편의성
	private String ppa_email;
	private String ppa_nickname;
	private String ppa_index;

	public String getTotalFilter() {
		return totalFilter;
	}
	public void setTotalFilter(String totalFilter) {
		this.totalFilter = totalFilter;
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
	public String getPpa_index() {
		return ppa_index;
	}
	public void setPpa_index(String ppa_index) {
		this.ppa_index = ppa_index;
	}
	//getter,setter
	public String getFilterName() {
		return filterName;
	}
	public void setFilterName(String filterName) {
		this.filterName = filterName;
	}
	public String getTotalfilter() {
		return totalFilter;
	}
	public void setTotalfilter(String totalfilter) {
		this.totalFilter = totalfilter;
	}
	public String getF_id() {
		return f_id;
	}
	public void setF_id(String f_id) {
		this.f_id = f_id;
	}
	public String getF_name() {
		return f_name;
	}
	public void setF_name(String f_name) {
		this.f_name = f_name;
	}
	public String getF_price() {
		return f_price;
	}
	public void setF_price(String f_price) {
		this.f_price = f_price;
	}
	public String getF_post_date() {
		return f_post_date;
	}
	public void setF_post_date(String f_post_date) {
		this.f_post_date = f_post_date;
	}
	public String getF_change_date() {
		return f_change_date;
	}
	public void setF_change_date(String f_change_date) {
		this.f_change_date = f_change_date;
	}
	public String getF_reason() {
		return f_reason;
	}
	public void setF_reason(String f_reason) {
		this.f_reason = f_reason;
	}
	public String getF_sale_yn() {
		return f_sale_yn;
	}
	public void setF_sale_yn(String f_sale_yn) {
		this.f_sale_yn = f_sale_yn;
	}
	public String getF_event_yn() {
		return f_event_yn;
	}
	public void setF_event_yn(String f_event_yn) {
		this.f_event_yn = f_event_yn;
	}
	public String getF_index_number() {
		return f_index_number;
	}
	public void setF_index_number(String f_index_number) {
		this.f_index_number = f_index_number;
	}
}
