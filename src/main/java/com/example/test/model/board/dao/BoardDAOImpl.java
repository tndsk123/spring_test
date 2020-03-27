package com.example.test.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.example.test.model.board.dto.BoardDTO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession session;
	
	@Override
	public List<BoardDTO> listAll() throws Exception {
		return session.selectList("board.list");
	}

	@Override
	public void create(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardDTO view(int bno) throws Exception {
		return session.selectOne("board.view", bno);
	}

	@Override
	public void increateViewcnt(int bno) throws Exception {
		// TODO Auto-generated method stub

	}
	@Override
	public void update(int bno, String title, int now_fund) {
		Map<String, Object> map=new HashMap<>();
		map.put("title", title);
		map.put("bno", bno);
		map.put("now_fund", now_fund);
		session.update("board.buy", map);
	}

}
