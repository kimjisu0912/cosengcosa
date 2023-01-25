package com.cosengcosa.room.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cosengcosa.room.domain.FreeBoardCmt;
import com.cosengcosa.room.service.FreeBoardService;

@Controller
public class FreeBoardCmtController {
	
	@Autowired
	FreeBoardService freeBoardService; 
	
	@RequestMapping("/recommend2.ajax")
	@ResponseBody
	public int recommend(@RequestParam(value="fNo", required=false, defaultValue="1") int fNo) {
		
		return freeBoardService.recommend(fNo);		
	}
	
	// 댓글 쓰기 요청을 처리하는 메서드
	@RequestMapping("/replyWrite2.ajax")
	@ResponseBody
	public List<FreeBoardCmt> addAnswer(FreeBoardCmt freeCmt, String fcYn) {
		
		System.out.println("1111");
		
		fcYn = "Y";
		
		freeCmt.setFcYn(fcYn);
		// 새로운 댓글을 등록한다.
		freeBoardService.addReply(freeCmt);
		
		System.out.println("2222");
		return freeBoardService.FreeBoardCmtList(freeCmt.getFcNum());
	}
	
	// 댓글 수정 요청을 처리하는 메서드	
	@RequestMapping("/replyUpdate2.ajax")
	@ResponseBody
	public List<FreeBoardCmt> updateFreeCmt(FreeBoardCmt freeCmt,
			@RequestParam(value="fcContent", required=false, defaultValue="null") String fcContent,
			@RequestParam(value="fcNum", required=false, defaultValue="1") int fcNum,
			@RequestParam(value="fcNo", required=false, defaultValue="1") int fcNo) {
		
		freeCmt.setFcContent(fcContent);
		freeCmt.setFcNum(fcNum);
		freeCmt.setFcNo(fcNo);
		
		
		System.out.println("asdasdsa");
		// 새로운 댓글을 등록한다.
		freeBoardService.updateReply(freeCmt);
		
		// 새롭게 갱신된 댓글 리스트를 가져와 반환한다.
		return freeBoardService.FreeBoardCmtList(freeCmt.getFcNo());
	}
	
	// 댓글 삭제 요청을 처리하는 메서드
	@RequestMapping("/replyDelete2.ajax")
	@ResponseBody
	public List<FreeBoardCmt> deleteCmt(int fcNum, int fcNo) {
		
		// 새로운 댓글을 등록한다.
		freeBoardService.deleteReply(fcNo);
		
		// 새롭게 갱신된 댓글 리스트를 가져와 반환한다.
		return freeBoardService.FreeBoardCmtList(fcNum);
	}
	
}
