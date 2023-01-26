package com.cosengcosa.room.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cosengcosa.room.domain.ClassMain;
import com.cosengcosa.room.service.ClassMainService;


/**
 * 메인강의 컨트롤러
 * @author 김지수/박예준
 * 
 */
 
@Controller
public class ClassMainController {

	private static final String DEFAULT_PATH = "/resources/upload/";
	
	// 메인강의 서비스 생성자 생성
	@Autowired
	private ClassMainService classMainService;
	
	public void setClassMainService(ClassMainService classMainService) {
		this.classMainService = classMainService;
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
		
	
		return "/class/classMainList";
	}
	
	/*
	 * 메인강의 상제조회
	 */
	@RequestMapping("/classMainDetail")
	public String classMainDetail(Model model, int cmNo, 
	@RequestParam(value="cmCode", required=false, defaultValue="null") String cmCode,
	@RequestParam(value="pageNum", required=false, defaultValue="null") String pageNum,
	@RequestParam(value="keyword", required=false,defaultValue="null") String keyword,
	@RequestParam(value="type", required=false,defaultValue="null") String type,
	HttpServletRequest request, HttpSession session) {
		
		
		String userid = (String) session.getAttribute("userId");
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 	
		
		Map<String, Object> cl = classMainService.getDetail(cmNo, true, cmCode, userid);
		
		model.addAllAttributes(cl);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("pageNum", searchOption);
		

		return "/class/classMainDetail";
	}
	
	/*
	 * 메인강의 코드 체크 ajax
	 */
	// 회원정보 수정에서 비밀번호 수정시 현재 비밀번호 확인하는 메서드
	@RequestMapping("/cmCodeChk.ajax")
	@ResponseBody
	public int cmCodeCheck(String cmCode) {
		int cmCodeChk = classMainService.cmCodeCount(cmCode); 
		return cmCodeChk;
	}
	
	/*
	 * 메인강의 입력
	 */
	@RequestMapping(value="/classMainAdd", method= RequestMethod.POST)
	public String classMainAdd(Model model,
			@RequestParam(value="cmTitle", required=false, defaultValue="null") String cmTitle,
			@RequestParam(value="cmCode", required=false, defaultValue="null") String cmCode,
			@RequestParam(value="cmName", required=false, defaultValue="null") String cmName,
			@RequestParam(value="cmPrice", required=false, defaultValue="null") String cmPrice,
			@RequestParam(value="cmPeriod", required=false, defaultValue="null") String cmPeriod,
			@RequestParam(value="cmContent", required=false, defaultValue="null") String cmContent,
			HttpSession session) throws IOException{
		
		ClassMain classMain = new ClassMain();
		
		classMain.setCmTitle(cmTitle);
		classMain.setCmCode(cmCode);
		classMain.setCmName(cmName);
		classMain.setCmPeriod(Integer.parseInt(cmPeriod));
		classMain.setCmContent(cmContent);
		classMain.setCmPrice(Integer.parseInt(cmPrice));
		classMain.setCmYn("Y");
		
		classMainService.classMainInsert(classMain);
		
		return "redirect:classMainList";
	}
	
	/*
	 * 메인강의 수정폼
	 */
	@RequestMapping("/classMainModForm")
	public String classMainModForm(Model model, 
			int cmNo,
			@RequestParam(value="cmcode", required=false, defaultValue="null") String cmCode,
			HttpServletResponse response,
			HttpSession session, PrintWriter out 
			)throws Exception {
		
		String userid = (String) session.getAttribute("userId");
		Map<String, Object> cm = classMainService.getDetail(cmNo, true, cmCode, userid);
		model.addAllAttributes(cm);
		
		return "/class/classMainUpdate";
		
	}
	
	/*
	 * 메인강의 수정
	 */
	@RequestMapping(value="/classMainUpdate", method= RequestMethod.POST)
	public String classMainUpdate(Model model,
			@RequestParam(value="cmTitle", required=false, defaultValue="null") String cmTitle,
			@RequestParam(value="cmCode", required=false, defaultValue="null") String cmCode,
			@RequestParam(value="cmName", required=false, defaultValue="null") String cmName,
			@RequestParam(value="cmPrice", required=false, defaultValue="null") String cmPrice,
			@RequestParam(value="cmPeriod", required=false, defaultValue="null") String cmPeriod,
			@RequestParam(value="cmContent", required=false, defaultValue="null") String cmContent,
			HttpSession session) throws IOException{
		
		ClassMain classMain = new ClassMain();
		
		classMain.setCmTitle(cmTitle);
		classMain.setCmCode(cmCode);
		classMain.setCmName(cmName);
		classMain.setCmPeriod(Integer.parseInt(cmPeriod));
		classMain.setCmContent(cmContent);
		classMain.setCmPrice(Integer.parseInt(cmPrice));
		classMain.setCmYn("Y");
		
		classMainService.classMainUpdate(classMain);
		
		return "redirect:classMainList";
	}
	
	/*
	 * 메인강의 삭제
	 */
	@RequestMapping(value="/classMainDelete", method= RequestMethod.GET)
	public String classMainDelete(HttpServletResponse response, 
			@RequestParam(value="cmcode", required=false, defaultValue="null") String cmCode)
			throws IOException{
		
		
		//service를 이용해서 게시글을 삭제 
		 classMainService.classMainDelete(cmCode);
		 classMainService.classMainSubDelete(cmCode);
		 
		
		return "redirect:classMainList";
	}
	

}
