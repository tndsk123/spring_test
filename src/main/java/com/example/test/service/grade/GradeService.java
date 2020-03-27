package com.example.test.service.grade;

import com.example.test.model.grade.dto.GradeDTO;

public interface GradeService {

	public GradeDTO grade_list();
	public GradeDTO grade_check(int grade);
}
