package com.example.test.model.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

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
	public void create(BoardDTO dto){
		System.out.println(dto);
		session.insert("board.insert", dto);
	}

	@Override
	public BoardDTO view(int bno) throws Exception {
		return session.selectOne("board.view", bno);
	}

	@Override
	public void increateViewcnt(int bno) throws Exception {
		session.update("board.increatViewcnt", bno);
	}
	@Override
	public void update(int bno, String title, int now_fund) {
		Map<String, Object> map=new HashMap<>();
		map.put("title", title);
		map.put("bno", bno);
		map.put("now_fund", now_fund);
		session.update("board.buy", map);
	}
	
	@Override
	public List<BoardDTO> bestList() {
		return session.selectList("board.best");
	}
	
	@Override
	public List<BoardDTO> goodList() {
		return session.selectList("board.goodList");
	}
	
	@Override
	public void good(int bno) {
		session.update("board.good", bno);
	}
	
	@Override
	public List<BoardDTO> supportList() {
		return session.selectList("board.supportList");
	}
	@Override
	public List<BoardDTO> todayList() {
		return session.selectList("board.todayList");
	}
	@Override
	public List<BoardDTO> progressList() {
		return session.selectList("board.progressList");
	}
	
	@Override
	public List<BoardDTO> fund_approve() {
		return session.selectList("board.fund_approve");
	}
	
	@Override
	public void approve(int bno) {
		session.update("board.approve", bno);
	}
	
	@Override
	public List<BoardDTO> searchList(String keyword) {
		return session.selectList("board.search", keyword);
	}

}
