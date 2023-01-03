package com.cosengcosa.room.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 메인페이지 컨트롤러
 * @author 김동영
 *
 */

@Controller
public class MainController {

	
	
	/*
	 * 메인화면 호출
	 */
	@RequestMapping(value={"/main", "/Main"}, method=RequestMethod.GET)
	public String mainView() {
		System.out.println("메인호출");
		return "main";
	}
}
