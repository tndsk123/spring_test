package com.example.test.service.chart;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.example.test.model.board.dto.BoardGradeDTO;
import com.example.test.service.board.BoardGradeService;

@Service
public class ChartServiceImpl implements ChartService {

	@Inject
	BoardGradeService service;
	
	@Override
	public JSONObject getChartData(int bno) {
		List<BoardGradeDTO> items=service.chart(bno);
		//리턴할 최종 json객체
		JSONObject data=new JSONObject();
		//컬럼을 정의할 json 객체
		JSONObject col1=new JSONObject();
		JSONObject col2=new JSONObject();
		JSONArray title=new JSONArray();
		//json의 cols 객체구성(헤더,제목구성)
		col1.put("label", "등급");
		col1.put("type", "string");
		col2.put("label", "금액");
		col2.put("type", "number");
		//json 배열에 json 객체 추가
		title.add(col1);
		title.add(col2);
		data.put("cols", title);
		//json의 rows 객체구성(바디,내용구성)
		JSONArray body=new JSONArray();
		for(BoardGradeDTO dto : items) {
			JSONObject name=new JSONObject();
			name.put("v", dto.getName());
			JSONObject money=new JSONObject();
			money.put("v", dto.getNow_fund());
			JSONArray row=new JSONArray();
			row.add(name);
			row.add(money);
			JSONObject cell=new JSONObject();
			cell.put("c", row);
			body.add(cell);
		}
		data.put("rows", body);
		return data;
	}

}
