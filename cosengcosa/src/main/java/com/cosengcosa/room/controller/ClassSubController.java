package com.cosengcosa.room.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.domain.ClassSub;
import com.cosengcosa.room.service.ClassSubService;

/**
 * 서브강의 컨트롤러
 * @author 김지수
 *
 */

@Controller
public class ClassSubController {

	// 서브강의 서비스 생성자 생성
	@Autowired
	private ClassSubService classSubService;
	
	private void setClassSubService(ClassSubService classSubService) {
		this.classSubService = classSubService;
	}
	
	/*
	 * 서브강의 리스트
	 */
	@RequestMapping("/classSubList")
	public String classSubList(Model model,
			@RequestParam(value="cmcode", required=false, defaultValue="") String cmcode) {
		
		// 서브강의 리스트 서비스 호출통해서 메인강의 리스트 관련 데이터를 가져온다
		List<ClassSub> csList = classSubService.classSubList(cmcode);
		
		// 파라미터로 받은 모델 객체에 도메인 객체나 비지니스 로직을 처리한 결과를 모델을 저장.
		model.addAttribute("csList", csList);
		
		return "/class/classSubList";
	}
}
