package com.cosengcosa.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 회원관련 컨트롤러
 * @author 김동영
 *
 */
@Controller
public class MemberController {
	
	// 회원가입 화면 호출
	@RequestMapping("/join")
	public String joinForm() {
		System.out.println("회원가입 폼보기");
		return "member/join";
	}
	
	// 회원가입 처리 
	@RequestMapping("joinProc")
	public String joinProc() {
		
		return "";
	}
}
