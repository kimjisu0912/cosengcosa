package com.cosengcosa.room.controller;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.domain.Dmtb;
import com.cosengcosa.room.service.DmtbService;


/**
 * 장바구니 컨트롤러
 * @author 박예준/김지수
 *
 */
@Controller
public class DmtbController {

	// 서비스 생성자 생성
	@Autowired
	private DmtbService dmtbService;
	
	private void setDmtbService(DmtbService dmtbService) {
		this.dmtbService = dmtbService;
	}
	
	/*
	 * 장바구니 리스트
	 */
	@RequestMapping("/dmtbList")
	public String basketList(Model model,
			HttpServletRequest request, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		// 장바구니 리스트 서비스 호출통해서 리스트 관련 데이터를 가져온다.
		List<Dmtb> dmList = dmtbService.dmtbList(userId, userName);
		
		model.addAttribute("dmList", dmList);
		
		return "/dmtb/dmtbList";
	}
	
}
