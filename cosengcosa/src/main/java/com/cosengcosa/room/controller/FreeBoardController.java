package com.cosengcosa.room.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cosengcosa.room.domain.FreeBoard;
import com.cosengcosa.room.domain.FreeBoardCmt;
import com.cosengcosa.room.domain.Study;
import com.cosengcosa.room.service.FreeBoardService;


/**
 * 지식공유 컨트롤러
 * @author 김태윤
 *
 */
@Controller
public class FreeBoardController {
	
	private final static String DEFAULT_PATH = "/resources/upload/";
	
	@Autowired
	private FreeBoardService freeBoardService;
	
	public void setStudyService(FreeBoardService freeBoardService) {
		this.freeBoardService = freeBoardService;
	}
	
	@RequestMapping("/freeBoardList")
	public String FreeBoardList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		
		Map<String, Object> modelMap = 
				freeBoardService.freeBoardList(pageNum, type, keyword);
		
		model.addAllAttributes(modelMap);
		
		return "/free/freeBoardList";
	}
	
	@RequestMapping("/freeBoardDetail")
	public String FreeBoardDetail(Model model, HttpSession session,
			@RequestParam(value="fno", required=false, 
			defaultValue="1") int fno, 
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		session.getAttribute("userId");
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 		
		
		List<FreeBoardCmt> freeBoardCmtList = freeBoardService.FreeBoardCmtList(fno);
		
		FreeBoard freeBoard = freeBoardService.getFreeBoard(fno, true);
		
		model.addAttribute("freeBoard", freeBoard);
		model.addAttribute("freeBoardCmtList", freeBoardCmtList);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		return "/free/freeBoardDetail";
		
	}
	
	// 등록폼으로 전달
		@RequestMapping("/writefreeBoardForm")
		public String writeForm() {
			return "/free/writeForm";
		}
		
		@RequestMapping(value="/writeProcessFreeBoard", method=RequestMethod.POST)
		public String insertFreeBoard(
				HttpServletRequest request,
				String fTitle, String fWriter, String fContent, String fYn, String fCount, String fRecommend
				// @RequestParam(value="qimg", required=false) MultipartFile multipartFile,
				// @RequestParam(value="sFile", required=false) MultipartFile multipartFile2
				) 
						throws IOException {
			
			fRecommend = "0";
			fCount = "0";
			fYn = "Y"; 
			
			FreeBoard freeBoard= new FreeBoard();
			freeBoard.setfTitle(fTitle);
			freeBoard.setfContent(fContent);
			freeBoard.setfWriter(fWriter);
			freeBoard.setfYn(fYn);
			freeBoard.setfCount(fCount);
			freeBoard.setfRecommend(fRecommend);
			
			
			
			freeBoardService.insertFreeBoard(freeBoard);
					
			
			return "redirect:freeBoardList";
		}
		
	
		@RequestMapping(value="/freeBoardUpdate")
		public String updateFreeBoard(Model model, HttpServletResponse response, 
				PrintWriter out, String pass,
				@RequestParam(value="fNo", required=false, 
				defaultValue="1") int fno,
				@RequestParam(value="pageNum", required=false, 
						defaultValue="1") int pageNum,
				@RequestParam(value="type", required=false,  
						defaultValue="null") String type,
				@RequestParam(value="keyword", required=false,
						defaultValue="null") String keyword) throws Exception {
			
			boolean searchOption = (type.equals("null") 
					|| keyword.equals("null")) ? false : true; 
			
			FreeBoard freeBoard = freeBoardService.getFreeBoard(fno, false);
			
			model.addAttribute("freeBoard", freeBoard);
			model.addAttribute("pageNum", pageNum);
			model.addAttribute("searchOption", searchOption);
			
			// 검색 요청이면 type과 keyword를 모델에 저장한다.
			if(searchOption) {
				model.addAttribute("type", type);
				model.addAttribute("keyword", keyword);
			}
			
			return "/free/updateForm";
		}
		
		// 수정2
		@RequestMapping(value="/freeBoardUp", method=RequestMethod.POST)
		public String freeBoardUp(HttpServletResponse response, 
				PrintWriter out, FreeBoard freeBoard,
				RedirectAttributes reAttrs, 
				@RequestParam(value="pageNum", required=false, 
						defaultValue="1") int pageNum,
				@RequestParam(value="type", required=false,  
						defaultValue="null") String type,
				@RequestParam(value="keyword", required=false,
						defaultValue="null") String keyword,
				@RequestParam(value="fno", required=false,
				defaultValue="1") int fNo
				// @RequestParam(value="fImg", required=false) MultipartFile multipartFile
				) throws IOException {		
			
			// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
			
			// 비밀번호가 맞지 않으면
			
			
			boolean searchOption = (type.equals("null") 
					|| keyword.equals("null")) ? false : true; 
			
			freeBoard.setfNo(fNo);
			
			
			System.out.println(freeBoard.getfContent());
			
			// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
			freeBoardService.updateFreeBoard(freeBoard);
			
			System.out.println(freeBoard.getfContent());
			
			reAttrs.addAttribute("searchOption", searchOption);
			
			// 검색 요청이면 type과 keyword를 모델에 저장한다.
			if(searchOption) {			
					
				reAttrs.addAttribute("type", type);
				reAttrs.addAttribute("keyword", keyword);		
			}
			
			reAttrs.addAttribute("pageNum", pageNum);		
			//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
			return "redirect:freeBoardList";
		}
		
		
		// 삭제
		@RequestMapping("/freeBoardDelete")
		public String deleteFreeBoard(HttpServletResponse response, 
				PrintWriter out,  String pass,
				RedirectAttributes reAttrs,
				@RequestParam(value="fNo", required=false, 
				defaultValue="1") int fno,
				@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
				@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
				@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
			
			// BoardService 클래스를 이용해 게시판 테이블에서 비밀번호가 맞는지 체크한다. 
			// 비밀번호가 맞지 않으면
			
			boolean searchOption = (type.equals("null") 
					|| keyword.equals("null")) ? false : true; 
			
			
			// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
			freeBoardService.deleteFreeBoard(fno);
			
			
			reAttrs.addAttribute("searchOption", searchOption);
			
			// 검색 요청이면 type과 keyword를 모델에 저장한다.
			if(searchOption) {
						
				reAttrs.addAttribute("type", type);
				reAttrs.addAttribute("keyword", keyword);			
			}
			
			reAttrs.addAttribute("pageNum", pageNum);
			//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
			return "redirect:freeBoardList";
		}
		
}
