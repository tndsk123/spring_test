package com.example.test.model.grade.dto;

public class GradeDTO {

	private int grade; 
	private String name;
	private String division;
	private int grade_limit;
	
	public int getGrade() {
		return grade;
	}
	public void setGrade(int grade) {
		this.grade = grade;
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
	public int getGrade_limit() {
		return grade_limit;
	}
	public void setGrade_limit(int grade_limit) {
		this.grade_limit = grade_limit;
	}
	@Override
	public String toString() {
		return "GradeDTO [grade=" + grade + ", name=" + name + ", division=" + division + ", grade_limit=" + grade_limit
				+ "]";
	}
	
	
}
