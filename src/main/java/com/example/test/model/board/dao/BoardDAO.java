package com.example.test.model.board.dao;

import java.util.List;

import com.example.test.model.board.dto.BoardDTO;

public interface BoardDAO {
	public List<BoardDTO> listAll() throws Exception;//목록	
	public void create(BoardDTO dto); //글쓰기 
	public BoardDTO view(int bno) throws Exception;//세부 보기
	public void increateViewcnt(int bno) throws Exception;//조회수 증가 처리
	public void update(int bno, String title, int now_fund);
	public List<BoardDTO> bestList();
	public List<BoardDTO> goodList();
	public List<BoardDTO> supportList();
	public List<BoardDTO> todayList();
	public List<BoardDTO> progressList();
	public void good(int bno);
	public List<BoardDTO> fund_approve();
	public void approve(int bno);
	public List<BoardDTO> searchList(String keyword);
}
