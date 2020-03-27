package com.example.test.service.board;

import java.util.List;

import com.example.test.model.board.dto.BoardDTO;
import com.example.test.model.board.dto.BoardGradeDTO;

public interface BoardGradeService {

	public void insert(BoardGradeDTO dto);
	public List<BoardDTO> list(int bno);
}
