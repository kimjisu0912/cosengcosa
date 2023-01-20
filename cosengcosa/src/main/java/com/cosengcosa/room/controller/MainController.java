package com.cosengcosa.room.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.service.MainService;

/** 
 * 메인페이지 컨트롤러
 * @author 김동영
 * 
 */

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	/*
	 * 메인화면 호출
	 */
	@RequestMapping(value={"/main", "/Main"}, method=RequestMethod.GET)
	public String mainView(Model model) {
		
		// 강의 리스트 가져오기
		List<ClassMain> dList = mainService.getClassMainListD();
		List<ClassMain> rList = mainService.getClassMainListR();
		
		// 게시글 리스트 가져오기
		List<Study> sList = mainService.getStudyList();
		//List<FreeBoard> fList = mainService.getFreeBoardList();
		
		// 별점 반복문을 위한 리스트
		List<Integer> list = new ArrayList<>(5);
		list.add(1);
		list.add(1);
		list.add(1);
		list.add(1);
		list.add(1);
		
		model.addAttribute("dList", dList);
		model.addAttribute("rList", rList);
		model.addAttribute("list", list);
		model.addAttribute("sList", sList);
		
		return "main";
	}
	
	
}
