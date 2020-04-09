package com.example.test.controller.company;

import java.io.File;

import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.test.model.company.dto.CompanyDTO;
import com.example.test.service.company.CompanyService;


@Controller
@RequestMapping("company/*")
public class CompanyController {

	@Inject
	CompanyService service;
	@Resource(name="uploadPath")
	String uploadPath;
	
	@RequestMapping(value = "view.do", method = RequestMethod.GET)
	@ResponseBody
	public CompanyDTO view(@RequestParam("company_name") String company_name) {
		System.out.println(company_name);
		return service.view(company_name);
	}
	
	@RequestMapping("write.do")
	public String write() {
		return "board/company";
	}
	
	@RequestMapping(value="insert", method=RequestMethod.POST)
	public ModelAndView insert(@ModelAttribute CompanyDTO dto, @RequestParam("file") MultipartFile file, HttpSession session) throws Exception{
		String userid=(String)session.getAttribute("userid");
		String logo=file.getOriginalFilename();
		logo = uploadFile(logo, file.getBytes());
		dto.setLogo(logo);
		dto.setWriter(userid);
		System.out.println(dto);
		ModelAndView mav=new ModelAndView();
		service.insert(dto);
		mav.addObject("message","글 작성이 완료되었습니다. 승인 후 게시될 예정입니다.");
		mav.setViewName("redirect:/user/mypage.do");		 
		return mav;
	}
	String uploadFile(String originalName, byte[] fileData) throws Exception {
		UUID uid=UUID.randomUUID();
		String savedName=uid.toString()+"_"+originalName;
		File target=new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		return savedName;
	}
}
