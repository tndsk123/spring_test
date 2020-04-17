package com.example.test.model.fund_board.dao;

import java.util.List;

import com.example.test.model.fund_board.dto.FundBoardDTO;

public interface FundBoardDAO {

	public List<FundBoardDTO> list(int bno);
	public void insert(FundBoardDTO dto);
	public void good(int bf_no);
	public void hate(int bf_no);
	public void update(FundBoardDTO dto);
	public void delete(int bf_no);
	public FundBoardDTO view(int bf_no);
	public int count(int bno);
}
