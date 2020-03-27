package com.example.test.service.grade;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.grade.dao.GradeDAO;
import com.example.test.model.grade.dto.GradeDTO;

@Service
public class GradeServiceImpl implements GradeService {

	@Inject
	GradeDAO dao;
	
	@Override
	public GradeDTO grade_list() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public GradeDTO grade_check(int grade) {
		return dao.grade_check(grade);
	}

}
