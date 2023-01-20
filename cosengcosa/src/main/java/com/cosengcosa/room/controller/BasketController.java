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

import com.cosengcosa.room.domain.Basket;
import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.service.BasketService;

/**
 * 장바구니 컨트롤러
 * @author 박예준/김지수
 *
 */
@Controller
public class BasketController {

	// 장바구니 서비스 생성자 생성
	@Autowired
	private BasketService basketService;
	
	private void setBasketService(BasketService basketService) {
		this.basketService = basketService;
	}
	
	/*
	 * 장바구니 리스트
	 */
	@RequestMapping("/basketList")
	public String basketList(Model model,
			HttpServletRequest request, HttpSession session) {
		
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		
		// 장바구니 리스트 서비스 호출통해서 리스트 관련 데이터를 가져온다.
		List<Basket> baList = basketService.basketList(userId, userName);
		
		model.addAttribute("baList", baList);
		
		return "/basket/basketList";
	}
	
	/*
	 * 장바구니 등록
	 */
	@RequestMapping("/basketAdd")
	public String basketAdd(Model model,
			@RequestParam(value="cmcode", required=false, defaultValue="null") String cmcode,
			@RequestParam(value="cmNo", required=false, defaultValue="null") String cmNo,
			HttpServletRequest request, HttpSession session, PrintWriter out, HttpServletResponse response) {
		
		String userId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("userName");
		String baCmcode = cmcode;
		response.setContentType("text/html; charset=utf-8");
		
		// 로그인 유무 체크
		if(userId == null) {
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("	alert('로그인이 필요한 서비스 입니다.');");
			sb.append("	history.back();");
			sb.append("</script>");
			
			out.println(sb.toString());
			return null;
			
		}
		
		// 중복 확인
		int baCnt  = basketService.basketCount(baCmcode, userId);
		if(baCnt > 0) {
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("	alert('이미 장바구니에 등록된 강의 입니다.');");
			sb.append("	history.back();");
			sb.append("</script>");
			
			out.println(sb.toString());
			return null;
		}
		
		// 코드값으로 메인강의 에서 정보 가져오기
		ClassMain classmain = basketService.getClassMainInfo(baCmcode);
		String baCname = classmain.getCmTitle();
		int baPrice = classmain.getCmPrice();
		
		// 장바구니 등록
		Basket basket = new Basket();
		basket.setBaMid(userId);
		basket.setBaName(userName);
		basket.setBaCmcode(baCmcode);
		basket.setBaCname(baCname);
		basket.setBaPrice(baPrice);
		
		basketService.insertBasket(basket);
		String url1 = "/cosengcosa/classMainDetail?cmNo="+cmNo;
		String url2 = "cmCode="+baCmcode;
		request.setAttribute("msg", "장바구니에 등록 되었습니다.");
		request.setAttribute("url1", url1);
		request.setAttribute("url2", url2);
		
		return "/class/alert";
	}
	
}
