package com.example.test.controller.fund_board;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.test.service.fund_board.FundBoardService;

@Controller
@RequestMapping("fund_board/*")
public class FundBoardController {

	@Inject
	FundBoardService service;
	
}
