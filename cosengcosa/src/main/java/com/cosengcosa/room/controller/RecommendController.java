package com.cosengcosa.room.controller;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cosengcosa.room.domain.Recommend;
import com.cosengcosa.room.service.RecommendService;

/**
 * 추천이력 컨트롤러
 * @author 김지수
 *
 */
@Controller
public class RecommendController {

	// 추천이력 서비스 생성자 생성
	@Autowired
	private RecommendService recommendService;
	public void setRecommendService(RecommendService recommendService) {
		this.recommendService = recommendService;
	}
	
	/*
	 * 추천이력 입력
	 */
	@RequestMapping(value="/addRecommend.ajax", method=RequestMethod.POST)
	@ResponseBody
	public String addRecommend(Model model,
			@RequestParam(value="cmcode", required=false, defaultValue="") String cmcode,
			HttpSession session) {
		String userid = (String) session.getAttribute("userId");
		String result = "";
		if(userid == null) {
			result = "U";
			return result;			
		}
		result =recommendService.insertRecommend(cmcode, userid);
		return result;
	}
	
	
}
