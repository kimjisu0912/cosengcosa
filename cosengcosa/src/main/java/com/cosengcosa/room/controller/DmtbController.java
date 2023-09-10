package com.cosengcosa.room.controller;

import java.io.PrintWriter;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

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
	 * 리스트
	 */
	@RequestMapping("/dmtbList")
	public String dmtbList(Model model,
			HttpServletRequest request, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		// 리스트 서비스 호출통해서 리스트 관련 데이터를 가져온다.
		List<Dmtb> dmList = dmtbService.dmtbList(userId, userName);
		
		model.addAttribute("dmList", dmList);
		
		return "/dmtb/dmtbList";
	}
	
	/*
	 * 적용
	 */
	@RequestMapping("/applyDmtb")
	public String applyDmtb(Model model,
			HttpServletRequest request, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		Map<String, String[]> paramMap = request.getParameterMap();
		Iterator<String> itr = paramMap.keySet().iterator();
		
		while(itr.hasNext()) {
	        String key = itr.next();
	        String[] values = paramMap.get(key);
	        
	        System.out.println(key + ":" + Arrays.toString(values));
	    }
	    String[] dmtbNameArr = request.getParameterValues("dmtbName[]");
	    String[] dmtbCodeArr = request.getParameterValues("dmtbCode[]");

	    dmtbService.dmtbDel();
	    dmtbService.dmtbAdd(dmtbNameArr, dmtbCodeArr);
		
		// 리스트 서비스 호출통해서 리스트 관련 데이터를 가져온다.
		List<Dmtb> dmList = dmtbService.dmtbList(userId, userName);
		model.addAttribute("dmList", dmList);
		System.out.println("=====applyDmtb=====");
		
		return "/dmtb/dmtbList";
	}
	
}
