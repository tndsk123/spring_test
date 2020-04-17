package com.example.test.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.board.dao.BoardGradeDAO;
import com.example.test.model.board.dto.BoardGradeDTO;

@Service
public class BoardGradeServiceImpl implements BoardGradeService {

	@Inject
	BoardGradeDAO dao;
	
	@Override
	public void insert(BoardGradeDTO dto) {
		dao.insert(dto);
	}

	@Override
	public List<BoardGradeDTO> list(int bno) {
		return dao.list(bno);
	}
	@Override
	public List<BoardGradeDTO> chart(int bno) {
		return dao.chart(bno);
	}

}
