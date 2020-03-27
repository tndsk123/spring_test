package com.example.test.controller.user;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.user.dto.UserDTO;
import com.example.test.service.user.UserService;

@Controller
@RequestMapping("user/*")
public class UserController {

	@Inject
	UserService userservice;
	@Inject
	BCryptPasswordEncoder pwEncoder;
	
	
	@RequestMapping("login.do")
	public String login() {
		return "board/login"; 
	}

	@RequestMapping("login_check.do")
	public ModelAndView login(UserDTO dto, HttpSession session) {
		String result=userservice.login(dto, session);
		ModelAndView mav=new ModelAndView();
		if(pwEncoder.matches(dto.getPasswd(), result)) {
			mav.setViewName("home");
		}else {
			mav.setViewName("member/login");
			mav.addObject("message", "error");   
		}  
		return mav;
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "board/join";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "board/login"; 
	}
	
	@RequestMapping(value = "id_chk", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(@RequestParam("userid") String userid) {
		return userservice.id_chk(userid);
	}
	
	@RequestMapping("insert.do")
	public ModelAndView insert(@ModelAttribute UserDTO dto) {
		System.out.println(dto.getPasswd());
		System.out.println(pwEncoder.encode(dto.getPasswd()));
		dto.setPasswd(pwEncoder.encode(dto.getPasswd()));
		userservice.insert(dto);
		ModelAndView mav=new ModelAndView();
		mav.addObject("userid",dto.getUserid());
		mav.addObject("message","join");
		mav.setViewName("board/login");
		return mav;
	}
}
