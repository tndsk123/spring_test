package com.example.test.service.fund_board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.fund_board.dao.FundBoardDAO;
import com.example.test.model.fund_board.dto.FundBoardDTO;

@Service
public class FundBoardServiceImpl implements FundBoardService {

	@Inject
	FundBoardDAO dao;
	
	@Override
	public List<FundBoardDTO> list(int bno) {
		return dao.list(bno);
	}

	@Override
	public void insert(FundBoardDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void good(int bf_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void hate(int bf_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(FundBoardDTO dto) {
		// TODO Auto-generated method stub

	}

	@Override
	public void delete(int bf_no) {
		// TODO Auto-generated method stub

	}

	@Override
	public FundBoardDTO view(int bf_no) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public int count(int bno) {
		return dao.count(bno);
	}

}
