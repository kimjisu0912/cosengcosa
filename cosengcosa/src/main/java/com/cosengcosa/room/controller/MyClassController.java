package com.cosengcosa.room.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.domain.MyClassMain;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.service.MyClassService;

@Controller
public class MyClassController {
	
	@Autowired
	private MyClassService myclassservice;
	
	// MyPage 메인 화면 호출 함수
	@RequestMapping("/myClassMain")
	public String myClassMain( Model model, Member member,
			HttpSession session, HttpServletResponse response) 
					throws ServletException, IOException {
		
		return "myClass/myClassMain";
	}
	
	// 내 강의실 화면 호출 함수
	@RequestMapping("/myClass")
	public String myclassmain(Model model, HttpSession session) {
		
		String id = (String)session.getAttribute("userId");
		
		List<MyClassMain> mList = myclassservice.getMyClassMain(id);
		
		model.addAttribute("mList", mList);
		
		return "myClass/myClass";
	}
	
	// 장바구니 화면 호출 함수
	@RequestMapping("/myCart")
	public String myCart(Model model) {
		return "myClass/myCart";
	}
	
	// 결제내역 화면 호출 함수
	@RequestMapping("/myPay")
	public String myPay(Model model) {
		return "myClass/myPay";
	}
	
}
