package com.example.test.model.company.dto;

import java.util.Date;

public class CompanyDTO {

	private int cno;
	private String company_name;
	private String ceo;
	private int count_member;
	private Date found_date;
	private String writer;
	private String greeting;
	private Date open_date;
	private String logo;
	private String company_num;
	
	public String getCompany_num() {
		return company_num;
	}
	public void setCompany_num(String company_num) {
		this.company_num = company_num;
	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getCeo() {
		return ceo;
	}
	public void setCeo(String ceo) {
		this.ceo = ceo;
	}
	public int getCount_member() {
		return count_member;
	}
	public void setCount_member(int count_member) {
		this.count_member = count_member;
	}
	public Date getFound_date() {
		return found_date;
	}
	public void setFound_date(Date found_date) {
		this.found_date = found_date;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getGreeting() {
		return greeting;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}
	public Date getOpen_date() {
		return open_date;
	}
	public void setOpen_date(Date open_date) {
		this.open_date = open_date;
	}
	@Override
	public String toString() {
		return "CompanyDTO [cno=" + cno + ", company_name=" + company_name + ", ceo=" + ceo + ", count_member="
				+ count_member + ", found_date=" + found_date + ", writer=" + writer + ", greeting=" + greeting
				+ ", open_date=" + open_date + ", logo=" + logo + ", company_num=" + company_num + "]";
	}
	
	
}
