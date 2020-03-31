package com.example.test;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.board.dto.BoardDTO;
import com.example.test.service.board.BoardService;
import com.example.test.service.user.UserService;

@Controller
public class Homecontroller {

	private static final Logger logger =LoggerFactory.getLogger(Homecontroller.class);

	@Inject
	BoardService boardService;
	@Inject
	UserService userService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET) 
	public ModelAndView home() {
		List<BoardDTO> cnt_list=boardService.bestList();
		List<BoardDTO> good_list=boardService.goodList();
		List<BoardDTO> support_list=boardService.supportList();
		List<BoardDTO> progress_list=boardService.progressList();
		List<BoardDTO> today_list=boardService.todayList();
		
		ModelAndView mav=new ModelAndView();
		mav.addObject("good_list", good_list);
		mav.addObject("cnt_list", cnt_list);
		mav.addObject("support_list", support_list);
		mav.addObject("today_list", today_list);
		mav.addObject("progress_list", progress_list);
		mav.setViewName("home");
		return mav; 	
	}
			 

}
