package com.example.test.controller.admin;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.admin.dto.AdminDTO;
import com.example.test.service.admin.AdminService;

@Controller
@RequestMapping("admin/*")
public class AdminController {

	@Inject
	AdminService service;
	
	@RequestMapping("login_check.do")
	public ModelAndView login(AdminDTO dto, HttpSession session) {
		String result=service.login(dto);		
		ModelAndView mav=new ModelAndView();
		if(result=="" || result == null) {
			mav.setViewName("board/login");
			mav.addObject("message", "error");
		}else {
			session.setAttribute("userid", dto.getUserid());
			mav.setViewName("admin/home");
		}
		return mav;
	}
}
