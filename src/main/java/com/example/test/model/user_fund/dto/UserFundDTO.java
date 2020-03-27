package com.example.test.model.user_fund.dto;

public class UserFundDTO {

	private String userid;
	private String title;
	private String company_name;
	private int unit;
	private int count;
	private int now_fund;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getNow_fund() {
		return now_fund;
	}
	public void setNow_fund(int now_fund) {
		this.now_fund = now_fund;
	}
	@Override
	public String toString() {
		return "UserFundDTO [userid=" + userid + ", title=" + title + ", company_name=" + company_name + ", unit="
				+ unit + ", count=" + count + ", now_fund=" + now_fund + "]";
	}
	
	
}
