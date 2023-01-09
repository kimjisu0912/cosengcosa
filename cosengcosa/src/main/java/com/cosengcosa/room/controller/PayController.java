package com.cosengcosa.room.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.service.PayService;

/**
 * 결재 컨트롤러
 * @author 김지수
 *
 */

@Controller
public class PayController {

	// 결재 서비스 생성자 생성
	@Autowired
	private PayService payService;
	
	public void setPayService(PayService payService) {
		this.payService = payService;
	}
	
	/*
	 * 결재 리스트
	 */
	@RequestMapping("/payList")
	public String payList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword,
			@RequestParam(value="userid", required=false, defaultValue="") String userid) {
		
		// 결재 리스트 서비스 호출통해서 결재리스트 데이터를 가져온다.
		Map<String, Object> modelMap = payService.payList(pageNum, type, keyword, userid);
		
		// 파라미터로 받은 모델 객체에 도메인 객체나 비지니스 로직을 처리한 결과를 모델을 저장.
		model.addAllAttributes(modelMap);
		
		return "/pay/payList";
	}
}
