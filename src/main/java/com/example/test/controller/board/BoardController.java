package com.example.test.controller.board;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.board.dto.BoardDTO;
import com.example.test.model.board.dto.BoardGradeDTO;
import com.example.test.model.grade.dto.GradeDTO;
import com.example.test.model.user.dto.UserDTO;
import com.example.test.model.user_fund.dto.UserFundDTO;
import com.example.test.service.board.BoardGradeService;
import com.example.test.service.board.BoardService;
import com.example.test.service.grade.GradeService;
import com.example.test.service.user.UserService;
import com.example.test.service.user_fund.UserFundService;

@Controller
@RequestMapping("board/*")
public class BoardController {

	@Inject
	BoardService boardService;
	@Inject
	UserService userService;
	@Inject
	UserFundService userFundService;
	@Inject
	GradeService gradeService;
	@Inject
	BoardGradeService boardgradeService;
	
	@RequestMapping("list.do")
	public ModelAndView list() throws Exception{
		List<BoardDTO> list=boardService.listAll();
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/list");
		mav.addObject("list", list);
		return mav;
	}
	@RequestMapping("write.do")
	public String write() {
		return "board/write";
	}
	
	@RequestMapping("view/{bno}")
	public ModelAndView view(@PathVariable("bno") int bno, HttpSession session) throws Exception {
		boardService.increateViewcnt(bno, session);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/view");
		mav.addObject("list", boardService.view(bno));
		mav.addObject("grade", boardgradeService.list(bno));
		return mav;
	}
	
	@RequestMapping("buy/{bno}")
	public ModelAndView buy(@PathVariable("bno") int bno, ModelAndView mav, HttpSession session) throws Exception{
		String userid=(String)session.getAttribute("userid");
		UserDTO user_view=userService.user_view(userid);
		int grade=user_view.getGrade();
		mav.addObject("user_info", user_view);
		mav.addObject("list", boardService.view(bno));
		mav.addObject("grade", gradeService.grade_check(grade));
		mav.setViewName("board/buy");
		return mav;
	}
	
	@Transactional
	@RequestMapping("buy_success/{bno}")
	public ModelAndView buy_succes(@PathVariable("bno") int bno, @ModelAttribute UserFundDTO dto, HttpSession session) throws Exception{
		String userid=(String)session.getAttribute("userid");
		dto.setUserid(userid);
		userFundService.fund_buy(dto);
		userService.update(dto.getUserid(), dto.getNow_fund());
		boardService.update(bno, dto.getTitle(), dto.getNow_fund());
		UserDTO dto4=userService.user_view(userid);
		int grade=dto4.getGrade();
		GradeDTO dto3=gradeService.grade_check(grade);
		BoardGradeDTO dto2=new BoardGradeDTO();
		dto2.setBno(bno);
		dto2.setDivision(dto3.getDivision());
		dto2.setName(dto3.getName());
		dto2.setNow_fund(dto.getNow_fund());
		boardgradeService.insert(dto2);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("home");
		return mav;
	}
	
	@RequestMapping("address.do")
	public String address() {
		return "include/address"; 
	}
	
	@RequestMapping("good.do")
	public String good(int bno, HttpSession session) {
		boardService.good(bno, session);
		return "redirect:/board/view/"+bno;
	}
	
	@RequestMapping("fund_approve.do")
	public ModelAndView fund_approve() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/fund_approve");
		mav.addObject("list", boardService.fund_approve());
		return mav;
	}
	
	@RequestMapping("view_approve/{bno}")
	public ModelAndView view_approve(@PathVariable("bno") int bno, HttpSession session) throws Exception {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/view");
		mav.addObject("list", boardService.view(bno));
		return mav;
	}
	
	@RequestMapping("approve/{bno}")
	public ModelAndView approve(@PathVariable("bno") int bno) {
		boardService.approve(bno);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/board/fund_approve.do");
		return mav;
	}
	
	@RequestMapping("insert.do")
	public ModelAndView insert(@ModelAttribute BoardDTO dto){
		System.out.println(dto);
		boardService.create(dto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("message", "글 작성이 완료되었습니다. 승인 후 게시될 예정입니다.");
		mav.setViewName("redirect:/board/list.do");
		return mav;
	}
	
	@RequestMapping("search.do")
	public ModelAndView search(String keyword) {
		System.out.println(keyword);
		ModelAndView mav=new ModelAndView();
		mav.addObject("keyword", keyword);
		mav.addObject("list", boardService.searchList(keyword));
		mav.setViewName("board/search_list");
		return mav;
	}
}
