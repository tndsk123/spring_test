package com.example.test.model.board.dto;

import java.util.Date;

public class BoardDTO {

	private int bno;//게시물번호
	private String title;
	private String title_img;	
	private String subtitle;
	private String s_division;//주식구분
	private String project_name;
	private String start_date;//게시일자
	private String end_date;//종료 일자
	private long now_date;
	private Date rest_date;//남은일자
	private int progress;//--진행률
	private int benefit;//이익률
	private int min_fund;//--최소 투자액
	private int max_fund;//목표액
	private int now_fund;//현재투자액
	private int unit;//1주당 가격
	private int support;
	private String p_division;//프로젝트 구분
	private String company_name;
	private String content_title;
	private String content;
	private String writer;//작성자
	private int viewcnt;//조회 수
	private int approve;//승인 여부
	private int good;//좋아요
	private long sledding;//진행상태
	private int margin;//이익률
	private int limit;
	
	public int getLimit() {
		return limit;
	}
	public void setLimit(int limit) {
		this.limit = limit;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getTitle_img() {
		return title_img;
	}
	public void setTitle_img(String title_img) {
		this.title_img = title_img;
	}
	public String getSubtitle() {
		return subtitle;
	}
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}
	public String getS_division() {
		return s_division;
	}
	public void setS_division(String s_division) {
		this.s_division = s_division;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public String getStart_date() {
		return start_date;
	}
	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}
	public String getEnd_date() {
		return end_date;
	}
	public void setEnd_date(String end_date) {
		this.end_date = end_date;
	}
	public long getNow_date() {
		return now_date;
	}
	public void setNow_date(long now_date) {
		this.now_date = now_date;
	}
	public Date getRest_date() {
		return rest_date;
	}
	public void setRest_date(Date rest_date) {
		this.rest_date = rest_date;
	}
	public int getProgress() {
		return progress;
	}
	public void setProgress(int progress) {
		this.progress = progress;
	}
	public int getBenefit() {
		return benefit;
	}
	public void setBenefit(int benefit) {
		this.benefit = benefit;
	}
	public int getMin_fund() {
		return min_fund;
	}
	public void setMin_fund(int min_fund) {
		this.min_fund = min_fund;
	}
	public int getMax_fund() {
		return max_fund;
	}
	public void setMax_fund(int max_fund) {
		this.max_fund = max_fund;
	}
	public int getNow_fund() {
		return now_fund;
	}
	public void setNow_fund(int now_fund) {
		this.now_fund = now_fund;
	}
	public int getUnit() {
		return unit;
	}
	public void setUnit(int unit) {
		this.unit = unit;
	}
	public int getSupport() {
		return support;
	}
	public void setSupport(int support) {
		this.support = support;
	}
	public String getP_division() {
		return p_division;
	}
	public void setP_division(String p_division) {
		this.p_division = p_division;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getContent_title() {
		return content_title;
	}
	public void setContent_title(String content_title) {
		this.content_title = content_title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getViewcnt() {
		return viewcnt;
	}
	public void setViewcnt(int viewcnt) {
		this.viewcnt = viewcnt;
	}
	public int getApprove() {
		return approve;
	}
	public void setApprove(int approve) {
		this.approve = approve;
	}
	public int getGood() {
		return good;
	}
	public void setGood(int good) {
		this.good = good;
	}
	public long getSledding() {
		return sledding;
	}
	public void setSledding(long sledding) {
		this.sledding = sledding;
	}
	public int getMargin() {
		return margin;
	}
	public void setMargin(int margin) {
		this.margin = margin;
	}
	@Override
	public String toString() {
		return "BoardDTO [bno=" + bno + ", title=" + title + ", title_img=" + title_img + ", subtitle=" + subtitle
				+ ", s_division=" + s_division + ", project_name=" + project_name + ", start_date=" + start_date
				+ ", end_date=" + end_date + ", now_date=" + now_date + ", rest_date=" + rest_date + ", progress="
				+ progress + ", benefit=" + benefit + ", min_fund=" + min_fund + ", max_fund=" + max_fund
				+ ", now_fund=" + now_fund + ", unit=" + unit + ", support=" + support + ", p_division=" + p_division
				+ ", company_name=" + company_name + ", content_title=" + content_title + ", content=" + content
				+ ", writer=" + writer + ", viewcnt=" + viewcnt + ", approve=" + approve + ", good=" + good
				+ ", sledding=" + sledding + ", margin=" + margin + ", limit=" + limit + "]";
	}
	
	
	
}
