package com.example.test.model.board.dto;

import java.util.Date;

public class BoardGradeDTO {

	private int bno;
	private String name;
	private String division;
	private int now_fund;
	private Date buy_date;
	
	public Date getBuy_date() {
		return buy_date;
	}
	public void setBuy_date(Date buy_date) {
		this.buy_date = buy_date;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public int getNow_fund() {
		return now_fund;
	}
	public void setNow_fund(int now_fund) {
		this.now_fund = now_fund;
	}
	@Override
	public String toString() {
		return "BoardGradeDTO [bno=" + bno + ", name=" + name + ", division=" + division + ", now_fund=" + now_fund
				+ ", buy_date=" + buy_date + "]";
	}
	
	
}
