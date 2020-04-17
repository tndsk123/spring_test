package com.example.test.model.board.dao;

import java.util.List;

import com.example.test.model.board.dto.BoardGradeDTO;

public interface BoardGradeDAO {

	public void insert(BoardGradeDTO dto);
	public List<BoardGradeDTO> list(int bno);
	public List<BoardGradeDTO> chart(int bno);
}
