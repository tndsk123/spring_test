package com.example.test.model.board.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import com.example.test.model.board.dto.BoardGradeDTO;

@Repository
public class BoardGradeDAOImpl implements BoardGradeDAO {

	@Inject
	SqlSession session;
	
	@Override
	public void insert(BoardGradeDTO dto) {
		session.insert("boardgrade.insert", dto);
	}

	@Override
	public List<BoardGradeDTO> list(int bno) {
		return session.selectList("boardgrade.list", bno);
	}
	@Override
	public List<BoardGradeDTO> chart(int bno) {
		return session.selectList("boardgrade.chart", bno);
	}

}
