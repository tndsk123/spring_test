package com.example.test.controller.user;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.grade.dto.GradeUpDTO;
import com.example.test.model.user.dto.UserDTO;
import com.example.test.model.user_fund.dto.UserFundDTO;
import com.example.test.service.grade.GradeUpService;
import com.example.test.service.user.UserService;
import com.example.test.service.user_fund.UserFundService;

@Controller
@RequestMapping("user/*")
public class UserController {

	@Inject
	UserService userservice;
	@Inject
	BCryptPasswordEncoder pwEncoder;
	@Inject
	UserFundService userfundservice;
	@Inject
	GradeUpService gradeupservice;
	
	@RequestMapping("login.do")
	public String login() {
		return "board/login"; 
	}

	@RequestMapping("login_check.do")
	public ModelAndView login(UserDTO dto, HttpSession session) {
		String result=userservice.login(dto, session);
		ModelAndView mav=new ModelAndView();
		if(pwEncoder.matches(dto.getPasswd(), result)) {
			mav.setViewName("redirect:/");
			mav.addObject("message", "success");
		}else {
			mav.setViewName("board/login");
			mav.addObject("message", "error");   
		}  
		return mav;
	}
	
	@RequestMapping("join.do")
	public String join() {
		return "board/join";
	}
	
	@RequestMapping("logout.do")
	public String logout(HttpSession session, Model model) {
		session.invalidate();
		model.addAttribute("message", "logout");
		return "redirect:/"; 
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
	
	@RequestMapping("mypage.do")
	public ModelAndView mypage(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		UserDTO dto=userservice.user_view(userid);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/mypage");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping("account.do")
	public ModelAndView account(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		UserDTO dto=userservice.user_view(userid);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/account_up");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping("account_up.do")
	public ModelAndView accountup(@RequestParam("charge") int charge, HttpSession session) {
		System.out.println(charge);
		String userid=(String)session.getAttribute("userid");
		userservice.account_up(userid, charge);
		ModelAndView mav=new ModelAndView();
		mav.addObject("message","account");
		mav.setViewName("redirect:/user/mypage.do");
		return mav;
	}
	
	@RequestMapping("fund_confirm.do")
	public ModelAndView fund_confirm(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		System.out.println(userid);
		List<UserFundDTO> list=userfundservice.fund_view(userid);
		System.out.println(list);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/fund_confirm");
		mav.addObject("list", list);
		return mav;
	}
	
	@RequestMapping("grade_up.do")
	public ModelAndView grade_up(HttpSession session) {
		String userid=(String)session.getAttribute("userid");
		ModelAndView mav=new ModelAndView();
		mav.setViewName("board/grade_up");
		mav.addObject("dto", userservice.user_view(userid));
		mav.addObject("grade_dto",gradeupservice.check(userid));
		return mav;
	}
	
	@RequestMapping("grade_insert.do")
	public ModelAndView grade_insert(@ModelAttribute GradeUpDTO dto) {
		gradeupservice.insert(dto);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/user/mypage.do");
		mav.addObject("message", "grade_up");
		return mav;
	}
	
	@RequestMapping("grade_list.do")
	public ModelAndView grade_list() {
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/gradeup_approve");
		mav.addObject("list", gradeupservice.gradeUpList());
		return mav;
	}
	
	@RequestMapping("gradeup_view.do")
	public ModelAndView grade_view(int gno) {
		System.out.println(gno);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("admin/gradeup_view");
		mav.addObject("list", gradeupservice.view(gno));
		return mav;
	}
	
	@RequestMapping("approve_gradeup.do")
	@Transactional
	public ModelAndView approve_gradeup(int gno) {
		userservice.grade_up(gno);
		gradeupservice.update(gno);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/user/grade_list.do");
		mav.addObject("message", "등급승인 되었습니다.");
		return mav;
	}
	
	@RequestMapping("grade_delete.do")
	public ModelAndView grade_delete(int gno) {
		gradeupservice.delete(gno);
		ModelAndView mav=new ModelAndView();
		mav.setViewName("redirect:/user/mypage.do");
		return mav;
	}
}
