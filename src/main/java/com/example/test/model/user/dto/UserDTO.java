package com.example.test.model.user.dto;

public class UserDTO {

	private String userid;
	private String passwd;
	private int account;
	private int fund;
	private int grade;
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
				+ ", grade=" + grade + "]";
	}
	
	
}
