package com.example.test.model.board.dao;

import java.util.List;

import com.example.test.model.board.dto.BoardDTO;
import com.example.test.model.board.dto.BoardGradeDTO;

public interface BoardGradeDAO {

	public void insert(BoardGradeDTO dto);
	public List<BoardDTO> list(int bno);
}
