package com.example.test.controller;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.example.test.service.chart.ChartService;

@RestController
@RequestMapping("chart/*")
public class ChartController {

	@Inject
	ChartService ChartService;
	
	@RequestMapping("cart_money_list.do")
	public JSONObject cart_money_list(int bno) {
		return ChartService.getChartData(bno);
	}
}
