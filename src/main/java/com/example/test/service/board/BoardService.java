package com.example.test.service.board;

import java.util.List;

import com.example.test.model.board.dto.BoardDTO;

public interface BoardService {
	public List<BoardDTO> listAll() throws Exception;//목록	
	public void create(BoardDTO dto) throws Exception; //글쓰기 
	public BoardDTO view(int bno) throws Exception;//세부 보기
	public void increateViewcnt(int bno) throws Exception;//조회수 증가 처리
	public void update(int bno, String title, int now_fund);
}
