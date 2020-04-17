package com.example.test.model.fund_board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.test.model.fund_board.dto.FundBoardDTO;

@Repository
public class FundBoardDAOImpl implements FundBoardDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<FundBoardDTO> list(int bno) {
		return session.selectList("fund_board.list", bno);
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
		return session.selectOne("fund_board.count", bno);
	}

}
