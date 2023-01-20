package com.cosengcosa.room.controller;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.Pay;
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
		
		String userid = (String) session.getAttribute("userId");
		
		// 결재 리스트 서비스 호출통해서 결재리스트 데이터를 가져온다.
		Map<String, Object> modelMap = payService.payList(pageNum, datePicker1, datePicker2, userid);
		
		// 파라미터로 받은 모델 객체에 도메인 객체나 비지니스 로직을 처리한 결과를 모델을 저장.
		model.addAllAttributes(modelMap);
		
		return "/pay/payList";
	}
	
	/*
	 * 결재 입력 폼
	 */
	@RequestMapping("/payAddForm")
	public String payAddForm(Model model,
			@RequestParam(value="cmcode", required=false, defaultValue="null") String cmcode,
			HttpServletRequest request, HttpSession session, PrintWriter out, HttpServletResponse response) {
		
		String userid = (String) session.getAttribute("userId");
		if(userid == null) {
			
			response.setContentType("text/html; charset=utf-8");
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("	alert('로그인이 필요한 서비스 입니다.');");
			sb.append("	history.back();");
			sb.append("</script>");
			
			out.println(sb.toString());
			return null;			
			
		}else {
			
			// 코드값으로 메인강의 에서 정보 가져오기
			ClassMain classmain = payService.getClassMainInfo(cmcode);
			model.addAttribute("classmain", classmain);

			return "/pay/payAddForm";
		}
		
	}
	
	/*
	 * 결재 입력
	 */
	@RequestMapping("classPayAdd")
	public String classPayAdd(Model model,
			@RequestParam(value="cmNo", required=false, defaultValue="null") String cmNo,
			@RequestParam(value="pMid", required=false, defaultValue="null") String pMid,
			@RequestParam(value="pName", required=false, defaultValue="null") String pName,
			@RequestParam(value="pCmcode", required=false, defaultValue="null") String pCmcode,
			@RequestParam(value="pCname", required=false, defaultValue="null") String pCname,
			@RequestParam(value="pPrice", required=false, defaultValue="null") String pPrice,
			PrintWriter out, HttpServletResponse response, HttpSession session) {
		
		Pay pay = new Pay();
		
		pay.setpMid(pMid);
		pay.setpName(pName);
		pay.setpCmcode(pCmcode);
		pay.setpCname(pCname);
		pay.setpChk("Y");
		int pprice = Integer.parseInt(pPrice);
		pay.setpPrice(pprice);
		pay.setpYn("Y");
		
		
		
		String cmcode = pCmcode;
		String userid = (String) session.getAttribute("userId");
		// 장바구니에 해당 과목이 있는지 확인
		int cnt = payService.baCount(cmcode, userid);
		// 있으면 장바구니에 해당과목 삭제
		if(cnt > 0) {
			payService.baDelete(cmcode, userid);
		 }
		
		payService.insertPay(pay);
		
		return "redirect:/classMainDetail?cmNo="+cmNo+"&cmCode="+pCmcode;
	}

	
	
}
