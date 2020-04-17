package com.example.test.service.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.example.test.model.board.dao.BoardDAO;
import com.example.test.model.board.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {

	@Inject
	BoardDAO boardDao;
	
	@Override
	public List<BoardDTO> listAll(int start, int end, String keyword) throws Exception {
		return boardDao.listAll(start,end,keyword);
	}

	@Override
	public void create(BoardDTO dto){
		boardDao.create(dto);
	}

	@Override
	public BoardDTO view(int bno) throws Exception {
		return boardDao.view(bno);
	}

	@Override
	public void increateViewcnt(int bno, HttpSession session) throws Exception {
		long cnt_update_time=0;
		String userid=(String)session.getAttribute("userid");
		if(session.getAttribute("cnt_update_time_"+bno+userid) != null) {
			//최근에 조회수를 올린 시간
			cnt_update_time=(long)session.getAttribute("cnt_update_time_"+bno+userid);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간(10초)이 경과후 조회수 증가 처리
		if(current_time - cnt_update_time > 10*1000) {
			boardDao.increateViewcnt(bno);
			session.setAttribute("cnt_update_time_"+bno+userid, current_time);
		}
	}
	@Override
	public void update(int bno, String title, int now_fund) {
		boardDao.update(bno,title,now_fund);
	}
	
	@Override
	public List<BoardDTO> bestList() {
		return boardDao.bestList();
	}
	@Override
	public void good(int bno, HttpSession session) {
		long good_update_time=0;
		String userid=(String)session.getAttribute("userid");
		if(session.getAttribute("good_update_time_"+bno+userid) != null) {
			//최근에 조회수를 올린 시간
			good_update_time=(long)session.getAttribute("good_update_time_"+bno+userid);
		}
		long current_time=System.currentTimeMillis();
		//일정 시간(10초)이 경과후 조회수 증가 처리
		if(current_time - good_update_time > 24*60*60*1000) {
			boardDao.good(bno);
			session.setAttribute("good_update_time_"+bno+userid, current_time);
		}		
	}
	
	@Override
	public List<BoardDTO> goodList() {
		return boardDao.goodList();
	}
	
	@Override
	public List<BoardDTO> supportList() {
		return boardDao.supportList();
	}
	@Override
	public List<BoardDTO> todayList() {
		return boardDao.todayList();
	}
	@Override
	public List<BoardDTO> progressList() {
		return boardDao.progressList();
	}
	
	@Override
	public List<BoardDTO> fund_approve() {
		return boardDao.fund_approve();
	}
	
	@Override
	public void approve(int bno) {
		boardDao.approve(bno);
	}
	
	@Override
	public List<BoardDTO> searchList(String keyword) {
		keyword="%"+keyword+"%";
		return boardDao.searchList(keyword);
	}
	
	@Override
	public int countBoard(String keyword) {
		System.out.println("서비스에서의"+keyword);
		return boardDao.countBoard(keyword);
	}
	@Override
	public List<BoardDTO> categories() {
		return boardDao.categories();
	}
	@Override
	public int search_count(String keyword) {
		keyword="%"+keyword+"%";
		return boardDao.search_count(keyword);
	}
	@Override
	public List<BoardDTO> searchdetail(String progress, String max_fund, String min_fund) {
		return boardDao.searchdetail(progress, max_fund, min_fund);
	}
	@Override
	public int searchdetail_count(String progress, String max_fund, String min_fund) {
		return boardDao.searchdetail_count(progress, max_fund, min_fund);
	}
}
