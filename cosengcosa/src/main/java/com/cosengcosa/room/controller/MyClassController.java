package com.cosengcosa.room.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.domain.Pay;
import com.cosengcosa.room.domain.SubTitle;
import com.cosengcosa.room.service.MyClassService;
import com.fasterxml.jackson.databind.ObjectMapper;

import sun.util.calendar.BaseCalendar.Date;

/**
 * 내강의실 컨트롤러
 * @author 김동영
 *
 */

@Controller
public class MyClassController {
	
	@Autowired
	private MyClassService myClassService;
	
	// MyPage 메인 화면 호출 
	@RequestMapping("/myClassMain")
	public String myClassMain( Model model, Member member,
			HttpSession session, HttpServletResponse response) 
					throws ServletException, IOException {
		
		String id = (String)session.getAttribute("userId");
		
		// 수강한 메인강의 개수
		ObjectMapper mapper = new ObjectMapper();
		SubTitle count = myClassService.getSubCount(id);
		
		// {"JA":"", DB, JS, SP, BS, KT, HL, JQ, AJ}
		String result = mapper.writeValueAsString(count);
		
		// 해당날짜에 수강완료한 서브강의 수
		List<List<Object>> dataList = myClassService.getDoneCount(id);
		String heatData = mapper.writeValueAsString(dataList);
		
		// 최근 수강한 강의 정보 가져오기
		MyClassSub sub = myClassService.getRecentClass(id);
		
		model.addAttribute("result", result);
		model.addAttribute("sub", sub);
		model.addAttribute("heatData", heatData);
		
		return "myClass/myClassMain";
	}
	
	// 내 강의실 화면 호출 
	@RequestMapping("/myClass")
	public String myclassmain(Model model, HttpSession session, 
			@RequestParam(value="keyword", required=false, defaultValue="") String keyword, 
			@RequestParam(value="done", required=false, defaultValue="N") String done) {
		
		String id = (String)session.getAttribute("userId");
		
		// 수강중인 메인강의 리스트 가져오기
		List<MyClassMain> mList = myClassService.getMyClassMain(id, keyword, done);
		
		// myClassService에서 계산된 학습률 리스트에 담아주기
		for(int i = 0; i < mList.size(); i++) {
			String group = mList.get(i).getMymCode();
			Double progress = myClassService.getProgress(id, group);
			
			mList.get(i).setProgress(progress);
		}
	
		model.addAttribute("mList", mList);
		model.addAttribute("keyword", keyword);
		model.addAttribute("done", done);
		
		return "myClass/myClass";
	}
	

	// 장바구니 화면 호출 
	@RequestMapping("/myCart")
	public String myCart(Model model, HttpSession session,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		
		String id = (String)session.getAttribute("userId"); 
		
		Map<String, Object> modelMap = myClassService.getBasketList(id, pageNum);
		
		model.addAllAttributes(modelMap);
		
		return "myClass/myCart";
	}
	
	// 결제내역 화면 호출 
	@RequestMapping("/myPay")
	public String myPay(Model model, HttpSession session,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum) {
		
		String id = (String)session.getAttribute("userId");
		
		Map<String, Object> modelMap = myClassService.getPayList(id, pageNum);
		
		model.addAllAttributes(modelMap);
		
		return "myClass/myPay";
	}
	
	// 강의 수강시간 업데이트 
	@RequestMapping("/getWatchTime.ajax")
	@ResponseBody
	public void updateWatchTime(HttpSession session, String id, String hCode, String wTime ) {
		
		id = (String) session.getAttribute("userId");
		String str = wTime;
		wTime = str.substring(0, str.indexOf("."));
		
		myClassService.updateWatchTime(id, hCode, wTime);
		
	}
	
}
