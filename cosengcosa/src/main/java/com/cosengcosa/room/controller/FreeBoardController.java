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
	public String FreeBoardDetail(Model model, 
			@RequestParam(value="fno", required=false, 
			defaultValue="1") int fno, 
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
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
				String fTitle, String fWriter, String fContent, String fYn
				// @RequestParam(value="qimg", required=false) MultipartFile multipartFile,
				// @RequestParam(value="sFile", required=false) MultipartFile multipartFile2
				) 
						throws IOException {		
			
			fYn = "Y"; 
			
			FreeBoard freeBoard= new FreeBoard();
			freeBoard.setfTitle(fTitle);
			freeBoard.setfContent(fContent);
			freeBoard.setfWriter(fWriter);
			freeBoard.setfYn(fYn);
			
			/*
			if(!multipartFile.isEmpty()) { // 업로드된 파일 데이터가 존재하면
				
				// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
				String filePath = 
						request.getServletContext().getRealPath(DEFAULT_PATH);
				
				UUID uid = UUID.randomUUID();
				String saveName = 
						uid.toString() + "_" + multipartFile.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("insertStudy - newName : " + file.getName());			
				
				// 업로드 되는 파일을 upload 폴더로 저장한다.
				multipartFile.transferTo(file);
				
				study.setsAskimg(saveName);
			}
			*/
			/*
			if(!multipartFile2.isEmpty()) { // 업로드된 파일 데이터가 존재하면
				
				// Request 객체를 이용해 파일이 저장될 실제 경로를 구한다.
				String filePath = 
						request.getServletContext().getRealPath(DEFAULT_PATH);
				
				UUID uid = UUID.randomUUID();
				String saveName = 
						uid.toString() + "_" + multipartFile2.getOriginalFilename();
				
				File file = new File(filePath, saveName);
				System.out.println("insertStudy - newName : " + file.getName());			
				
				// 업로드 되는 파일을 upload 폴더로 저장한다.
				multipartFile2.transferTo(file);
				
				study.setsFile(saveName);
			}
			*/
			
			freeBoardService.insertFreeBoard(freeBoard);
					
			
			return "redirect:freeBoardList";
		}
		
	
		@RequestMapping(value="/freeBoardUpdate")
		public String updateFreeBoard(Model model, HttpServletResponse response, 
				PrintWriter out, String pass,
				@RequestParam(value="fno", required=false, 
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
			
			System.out.println("1111");
			
			System.out.println(freeBoard.getfContent());
			
			// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
			freeBoardService.updateFreeBoard(freeBoard);
			
			System.out.println("4444");
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
				@RequestParam(value="fno", required=false, 
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
				
				/* Redirect 되는 경우 주소 끝에 파라미터를 지정해 GET방식의 파라미터로
				 * 전송할 수 있지만 스프링프레임워크가 지원하는 RedirectAttributs객체를
				 * 이용하면 한 번만 사용할 임시 데이터와 지속적으로 사용할 파라미터를 구분해
				 * 지정할 수 있다.
				 * 
				 * 게시 글 상세 보기 요청을 처리하는 boardDetail() 메서드에서 뷰 페이지에서
				 * 링크에 사용할 keyword를 java.net 패키지의 URLEncoder 클래스를
				 * 이용해 수동으로 인코딩한 후 모델에 담아 뷰 페이지로 전달하였다.
				 * 
				 * 리다이렉트 될 때 필요한 파라미터를 스프링이 제공하는 RedirectAttributs의
				 * addAttribute() 메서드를 사용해 파라미터를 지정하면 자동으로 주소 뒤에 
				 * 요청 파라미터로 추가되며 파라미터에 한글이 포함되는 경우 URLEncoding을
				 * java.net 패키지의 URLEncoder 클래스를 이용해 인코딩 해줘야 하지만
				 * web.xml에서 스프링프레임워크가 지원하는 CharacterEncodingFilter를
				 * 설정했기 때문에 Filter에 의해 UTF-8로 인코딩 되어 클라이언트로 응답된다.
				 * 
				 * 아래는 검색 리스트로 Redirect 되면서 같이 보내야할 keyword와 type을
				 * RedirectAttributs를 이용해 파라미터로 전달하는 예이다. 
				 **/			
				reAttrs.addAttribute("type", type);
				reAttrs.addAttribute("keyword", keyword);			
			}
			
			reAttrs.addAttribute("pageNum", pageNum);
			//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
			return "redirect:freeBoardList";
		}
		
}
