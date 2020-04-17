package com.example.test.service.board;

import java.util.List;

import com.example.test.model.board.dto.BoardGradeDTO;

public interface BoardGradeService {

	public void insert(BoardGradeDTO dto);
	public List<BoardGradeDTO> list(int bno);
	public List<BoardGradeDTO> chart(int bno);
}
