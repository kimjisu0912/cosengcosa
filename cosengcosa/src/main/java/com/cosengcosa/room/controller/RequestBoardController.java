package com.cosengcosa.room.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


/**
 * 지식공유 컨트롤러
 * @author 김태윤
 *
 */
@Controller
public class RequestBoardController {
	
	@RequestMapping("/requestBoardList")
	public String StudyList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		
		
		return "/request/requestBoardList";
	}
	
}
