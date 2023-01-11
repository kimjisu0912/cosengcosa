package com.cosengcosa.room.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
			@RequestParam(value="datePicker1", required=false, defaultValue="null") String datePicker1,
			@RequestParam(value="datePicker2", required=false, defaultValue="null") String datePicker2,
			HttpServletRequest request, HttpSession session) {
		
		System.out.println("userid====>"+session.getAttribute("userid"));
		System.out.println("datePicker1====>"+datePicker1);
		System.out.println("datePicker2====>"+datePicker2);
		String userid = (String) session.getAttribute("userid");
		
		
		// 결재 리스트 서비스 호출통해서 결재리스트 데이터를 가져온다.
		Map<String, Object> modelMap = payService.payList(pageNum, datePicker1, datePicker2, userid);
		
		// 파라미터로 받은 모델 객체에 도메인 객체나 비지니스 로직을 처리한 결과를 모델을 저장.
		model.addAllAttributes(modelMap);
		
		return "/pay/payList";
	}
}
