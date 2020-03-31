package com.example.test.model.user.dto;

public class UserDTO {

	private String userid;
	private String passwd;
	private int account;
	private int fund;
	private int grade;
	private String interest;
	private String company_name;
	
	
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getInterest() {
		return interest;
	}
	public void setInterest(String interest) {
		this.interest = interest;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public int getAccount() {
		return account;
	}
	public void setAccount(int account) {
		this.account = account;
	}
	public int getFund() {
		return fund;
	}
	public void setFund(int fund) {
		this.fund = fund;
	}
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
	}
	@Override
	public String toString() {
		return "UserDTO [userid=" + userid + ", passwd=" + passwd + ", account=" + account + ", fund=" + fund
				+ ", grade=" + grade + ", interest=" + interest + ", company_name=" + company_name + "]";
	}
	
	
}
