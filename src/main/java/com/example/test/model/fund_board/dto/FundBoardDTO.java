package com.example.test.model.fund_board.dto;

import java.util.Date;

public class FundBoardDTO {

	private int fb_no;
	private int b_no;
	private String title;
	private String content;
	private String writer;
	private int good;
	private int hate;
	private int comment_count;
	private Date write_date;
	private String categories; 	
	

	public String getCategories() {
		return categories;
	}
	public void setCategories(String categories) {
		this.categories = categories;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getB_no() {
		return b_no;
	}
	public void setB_no(int b_no) {
		this.b_no = b_no;
	}
	public int getFb_no() {
		return fb_no;
	}
	public void setFb_no(int fb_no) {
		this.fb_no = fb_no;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public int getHate() {
		return hate;
	}
	public void setHate(int hate) {
		this.hate = hate;
	}
	public int getComment_count() {
		return comment_count;
	}
	public void setComment_count(int comment_count) {
		this.comment_count = comment_count;
	}
	public Date getWrite_date() {
		return write_date;
	}
	public void setWrite_date(Date write_date) {
		this.write_date = write_date;
	}
	@Override
	public String toString() {
		return "FundBoardDTO [fb_no=" + fb_no + ", b_no=" + b_no + ", title=" + title + ", content=" + content
				+ ", writer=" + writer + ", good=" + good + ", hate=" + hate + ", comment_count=" + comment_count
				+ ", write_date=" + write_date + ", categories=" + categories + "]";
	}
	
	
}
