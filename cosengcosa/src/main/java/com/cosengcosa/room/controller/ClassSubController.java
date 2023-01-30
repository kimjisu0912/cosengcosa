package com.cosengcosa.room.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.cosengcosa.room.domain.ClassSub;
import com.cosengcosa.room.domain.MyClassSub;
import com.cosengcosa.room.service.ClassSubService;
import com.cosengcosa.room.service.MyClassService;

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
	
	@Autowired
	private MyClassService myClassService;
	
	/*
	 * 서브강의 리스트
	 */
	@RequestMapping("/classSubList")
	public String classSubList(Model model, HttpSession session,
			@RequestParam(value="cmcode", required=false, defaultValue="") String cmcode) {
		
		String id = (String) session.getAttribute("userId");
		// 서브강의 리스트 서비스 호출통해서 메인강의 리스트 관련 데이터를 가져온다
		List<ClassSub> csList = classSubService.classSubList(cmcode);
		
		// 수강완료한 강의 정보 가져온다
		List<MyClassSub> mysList = myClassService.getDoneClass(id);
		// 파라미터로 받은 모델 객체에 도메인 객체나 비지니스 로직을 처리한 결과를 모델을 저장.
		model.addAttribute("csList", csList);
		model.addAttribute("cmcode", cmcode);
		model.addAttribute("mysList", mysList);
		
		return "/class/classSubList";
	}
	
	/*
	 * 서브강의 등록페이지 이동
	 */
	@RequestMapping("/classSubAddForm")
	public String classSubAddForm(Model model,
			@RequestParam(value="cmcode", required=false, defaultValue="") String cmcode) {
		
		// 서브 강의 코드값 가져오기
		ClassSub classSub = classSubService.getClassSubCode(cmcode);
		String chkCode = classSub.getCsCode();
		String csCode ="";
		if(chkCode.equals("01")) {
			String newCscode = cmcode.toLowerCase();
			csCode = newCscode + "_01";
		}else {
			csCode = classSub.getCsCode();
		}
		model.addAttribute("cscode", csCode);
		// 코드값 모델에 지정
		model.addAttribute("cmcode", cmcode);
		
		return "/class/classSubAddForm";
	}
	
	/*
	 * 서브강의 등록
	 */
	@RequestMapping("/classSubAdd")
	public String classSubAdd(Model model,
			@RequestParam(value="hcsTitle", required=false, defaultValue="") String csTitle,
			@RequestParam(value="hcsCode", required=false, defaultValue="") String csCode,
			@RequestParam(value="hcsGroup", required=false, defaultValue="") String csGroup,
			@RequestParam(value="hcsContent", required=false, defaultValue="") String csContent,
			@RequestParam(value="hcsVideo", required=false, defaultValue="") String csVideo,
			@RequestParam(value="hcsRuntime", required=false, defaultValue="") String csRuntime) {
		
		ClassSub classSub = new ClassSub();
		classSub.setCsCode(csCode);
		classSub.setCsGroup(csGroup);
		classSub.setCsTitle(csTitle);
		classSub.setCsContent(csContent);
		classSub.setCsVideo(csVideo);
		classSub.setCsRuntime(csRuntime);
		classSub.setCsYn("Y");
		
		classSubService.insertClassSub(classSub);
		
		return "redirect:/classSubList?cmcode="+csGroup;
	}
	
	/*
	 * 서브강의 수정페이지 이동
	 */
	@RequestMapping("/classSubModForm")
	public String classSubModForm(Model model,
			@RequestParam(value="csCode", required=false, defaultValue="") String cscode) {
		
		// 서브 강의 상세조회
		ClassSub classSub = classSubService.getClassSub(cscode);
		
		model.addAttribute("classSub", classSub);
		
		return "/class/classSubModForm";
	}
	
	/*
	 * 서브강의 수정
	 */
	@RequestMapping("/classSubMod")
	public String classSubMod(Model model,
			@RequestParam(value="hcsTitle", required=false, defaultValue="") String csTitle,
			@RequestParam(value="hcsCode", required=false, defaultValue="") String csCode,
			@RequestParam(value="hcsGroup", required=false, defaultValue="") String csGroup,
			@RequestParam(value="hcsContent", required=false, defaultValue="") String csContent,
			@RequestParam(value="hcsVideo", required=false, defaultValue="") String csVideo,
			@RequestParam(value="hcsRuntime", required=false, defaultValue="") String csRuntime) {
		
		ClassSub classSub = new ClassSub();
		classSub.setCsCode(csCode);
		classSub.setCsGroup(csGroup);
		classSub.setCsTitle(csTitle);
		classSub.setCsContent(csContent);
		classSub.setCsVideo(csVideo);
		classSub.setCsRuntime(csRuntime);
		classSub.setCsYn("Y");
		
		classSubService.updateClassSub(classSub);
		
		return "redirect:/classSubList?cmcode="+csGroup;
	}
	
	/*
	 * 서브강의 삭제(상태값 변화)
	 */
	@RequestMapping("/classSubDel")
	public String classSubDel(Model model,
			@RequestParam(value="csCode", required=false, defaultValue="") String csCode,
			@RequestParam(value="csGroup", required=false, defaultValue="") String csGroup
			) {
		
		ClassSub classSub = new ClassSub();
		classSub.setCsCode(csCode);
		classSub.setCsGroup(csGroup);
		classSub.setCsYn("N");
		
		classSubService.deleteClassSub(classSub);
		
		return "redirect:/classSubList?cmcode="+csGroup;
	}
}
