package com.example.test.service.grade;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.grade.dao.GradeUpDAO;
import com.example.test.model.grade.dto.GradeUpDTO;

@Service
public class GradeUpServiceImpl implements GradeUpService {

	@Inject
	GradeUpDAO dao;
	
	@Override
	public List<GradeUpDTO> gradeUpList() {
		return dao.gradeUpList();
	}

	@Override
	public GradeUpDTO view(int gno) {
		return dao.view(gno);
	}

	@Override
	public void insert(GradeUpDTO dto) {
		dao.insert(dto);
	}

	@Override
	public void update(int gno) {
		dao.update(gno);
	}
	
	@Override
	public GradeUpDTO check(String userid) {
		return dao.check(userid);
	}
	@Override
	public void delete(int gno) {
		dao.delete(gno);
	}

}
