package com.cosengcosa.room.controller;

import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.service.ClassMainService;

/**
 * 메인강의 컨트롤러
 * @author 김지수/박예준
 * 
 */
 
@Controller
public class ClassMainController {

	// 메인강의 서비스 생성자 생성
	@Autowired
	private ClassMainService classMainService;
	
	public void setClassMainService(ClassMainService classMainService) {
		
	}
	
	/*
	 * 메인강의 리스트
	 */
	@RequestMapping("/classMainList")
	public String classMainList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		
		// 메인강의 리스트 서비스 호출통해서 메인강의 리스트 관련 데이터를 가져온다
		Map<String, Object> modelMap = classMainService.classMainList(pageNum, type, keyword);
		
		// 파라미터로 받은 모델 객체에 도메인 객체나 비지니스 로직을 처리한 결과를 모델을 저장.
		model.addAllAttributes(modelMap);
		
		System.out.println("dd");  
		return "/class/classMainList";
	}
	
	@RequestMapping("/classMainDetail")
	public String classMainDetail(Model model, int cmNo, int pageNum,
	@RequestParam(value="type", required=false, defaultValue="null") String type,
	@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		
		
		ClassMain cl = classMainService.getDetail(cmNo, true);
		
		model.addAttribute("cl",cl );
		model.addAttribute("pageNum",pageNum );
		System.out.println("dd");  
		
		return "/class/classMainDetail";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.POST)// delete라고 했지만, 'N'으로 바꾸기 위해 update 구문
	public String DeleteMain(Model model, HttpServletResponse response, 
			PrintWriter out, int cmNo, String pass) {
	//패스워드 필요한가?
		
		
		
		return null;
	} 
}
