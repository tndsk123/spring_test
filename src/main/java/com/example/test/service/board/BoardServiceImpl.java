package com.example.test.service.board;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.example.test.model.board.dao.BoardDAO;
import com.example.test.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;
	
	@Override
	public List<BoardDTO> listAll() throws Exception {
		return boardDao.listAll();
	}

	@Override
	public void create(BoardDTO dto) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public BoardDTO view(int bno) throws Exception {
		return boardDao.view(bno);
	}

	@Override
	public void increateViewcnt(int bno) throws Exception {
		// TODO Auto-generated method stub

	}
	@Override
	public void update(int bno, String title, int now_fund) {
		boardDao.update(bno,title,now_fund);
	}

}
