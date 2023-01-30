package com.cosengcosa.room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.domain.RequestBoard;
import com.cosengcosa.room.service.RequestBoardService;



/**
 * 지식공유 컨트롤러
 * @author 김태윤
 *
 */
@Controller
public class RequestBoardController {
	
	@Autowired
	private RequestBoardService requestBoardService;
	
	public void setRequestBoardService(RequestBoardService requestBoardService) {
		this.requestBoardService = requestBoardService;
	}
	
	
	@RequestMapping("/requestBoardList")
	public String BoardList(Model model,
			@RequestParam(value="pageNum", required=false, defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false, defaultValue="null") String type,
			@RequestParam(value="keyword", required=false, defaultValue="null") String keyword) {
		

		Map<String, Object> modelMap = 
				requestBoardService.boardList(pageNum, type, keyword);
		
		model.addAllAttributes(modelMap);
		
		
		return "/request/requestBoardList";
	}
	
	@RequestMapping("/requestBoardDetail")
	public String studyDetail(Model model, int no, HttpSession session,
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 		
		
		String userid = (String) session.getAttribute("userId");
		
		Member member = requestBoardService.getRequestMember(userid);
		
		RequestBoard board = requestBoardService.getBoard(no, true);
		
		model.addAttribute("board", board);
		model.addAttribute("member", member);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		return "/request/requestBoardDetail";
		
	}
	
	@RequestMapping("/boardUpdate")
	public String updateBoard (Model model, HttpServletResponse response, 
			PrintWriter out, String pass,
			@RequestParam(value="no", required=false, 
			defaultValue="1") int no,
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws Exception {
		
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		RequestBoard board = requestBoardService.getBoard(no, false);
		
		model.addAttribute("board", board);
		model.addAttribute("pageNum", pageNum);
		model.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			model.addAttribute("type", type);
			model.addAttribute("keyword", keyword);
		}
		
		return "/request/updateForm";
	}
	
	@RequestMapping(value="/boardUp", method=RequestMethod.POST)
	public String updateBoard(HttpServletResponse response, 
			PrintWriter out, RequestBoard board,
			RedirectAttributes reAttrs, 
			@RequestParam(value="pageNum", required=false, 
					defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
					defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
					defaultValue="null") String keyword) throws IOException {
		

		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		requestBoardService.updateBoard(board);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {			
				
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);		
		}
		
		reAttrs.addAttribute("pageNum", pageNum);		
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:requestBoardList";
	}
	
	@RequestMapping("/writeFormBoard")
	public String writeFormBoard() {
		return "/request/writeForm";
	}
	
	@RequestMapping(value="/writeProcessBoard", method=RequestMethod.POST)
	public String insertBoard(
			HttpServletRequest request,
			String title, String writer, String content, String open, String yn, String code,String rCount
			) 
					throws IOException {		
		
		rCount = "0";
		open = "N";
		yn = "Y";
		
		RequestBoard board= new RequestBoard();
		board.setTitle(title);
		board.setCode(code);
		board.setWriter(writer);
		board.setContent(content);
		board.setrCount(rCount);
		board.setOpen(open);
		board.setYn(yn);
			
		requestBoardService.insertBoard(board);
				
		
		return "redirect:requestBoardList";
	}
	
	@RequestMapping("/boardAnswer")
	public String answerBoard(
			@RequestParam(value="answerInput", required=false, defaultValue=" ")String answer,
			@RequestParam(value="no", required=false, defaultValue="1") int no) {
		
		
		RequestBoard board= new RequestBoard();
		
			board.setAnswer(answer);
			board.setNo(no);
			board.setOpen("Y");
			
			requestBoardService.updateAnswer(board);
		return "redirect:requestBoardDetail?no="+no;
	}
	
	
	@RequestMapping("/boardDelete")
	public String deleteBoard(HttpServletResponse response, 
			PrintWriter out, 
			RedirectAttributes reAttrs,
			@RequestParam(value="no", required=false, 
			defaultValue="1") int no,
			@RequestParam(value="pageNum", required=false, 
				defaultValue="1") int pageNum,
			@RequestParam(value="type", required=false,  
				defaultValue="null") String type,
			@RequestParam(value="keyword", required=false,
				defaultValue="null") String keyword) throws Exception {
		
		boolean searchOption = (type.equals("null") 
				|| keyword.equals("null")) ? false : true; 
		
		
		// BoardService 클래스를 이용해 게시판 테이블에서 게시 글을 수정한다.
		requestBoardService.deleteBoard(no);
		
		reAttrs.addAttribute("searchOption", searchOption);
		
		// 검색 요청이면 type과 keyword를 모델에 저장한다.
		if(searchOption) {
			
			reAttrs.addAttribute("type", type);
			reAttrs.addAttribute("keyword", keyword);			
		}
		
		reAttrs.addAttribute("pageNum", pageNum);
		//reAttrs.addFlashAttribute("test", "1회용 파라미터 받음 - test");
		return "redirect:requestBoardList";
	}
	
}
