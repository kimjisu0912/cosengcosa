package com.cosengcosa.room.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.cosengcosa.room.domain.StudyAnswer;
import com.cosengcosa.room.service.StudyService;

@Controller
public class StudyAnswerController {
	
	@Autowired
	StudyService studyService;
	
	
	@RequestMapping("/recommend.ajax")
	@ResponseBody
	public int recommend(int sno) {
		
		return studyService.recommend(sno);		
	}
	
	// 댓글 쓰기 요청을 처리하는 메서드
	@RequestMapping("/replyWrite.ajax")
	@ResponseBody
	public List<StudyAnswer> addAnswer(
			@RequestParam(value="saAnswerimg", required=false, defaultValue="null") String saAnswerimg,
			StudyAnswer studyAnswer) {
		if(saAnswerimg.equals("null")) {
			saAnswerimg = "";
		}
		studyAnswer.setSaAnswerimg(saAnswerimg);
		// 새로운 댓글을 등록한다.
		studyService.addReply(studyAnswer);
		
		
		return studyService.answerList(studyAnswer.getSaNum());
	}
	
	// 댓글 수정 요청을 처리하는 메서드	
	@RequestMapping("/replyUpdate.ajax")
	@ResponseBody
	public List<StudyAnswer> updateAnswer(StudyAnswer studyAnswer,
			@RequestParam(value="saAnswer", required=false, defaultValue="null") String saAnswer,
			@RequestParam(value="saNum", required=false, defaultValue="1") int saNum,
			@RequestParam(value="saNo", required=false, defaultValue="1") int saNo) {
		
		studyAnswer.setSaAnswer(saAnswer);
		studyAnswer.setSaNum(saNum);
		studyAnswer.setSaNo(saNo);
		
		
		// 새로운 댓글을 등록한다.
		studyService.updateReply(studyAnswer);
		
		// 새롭게 갱신된 댓글 리스트를 가져와 반환한다.
		return studyService.answerList(studyAnswer.getSaNo());
	}
	
	// 댓글 삭제 요청을 처리하는 메서드
	@RequestMapping("/replyDelete.ajax")
	@ResponseBody
	public List<StudyAnswer> deleteAnswer(int saNum, int saNo) {
		
		// 새로운 댓글을 등록한다.
		studyService.deleteReply(saNo);
		
		// 새롭게 갱신된 댓글 리스트를 가져와 반환한다.
		return studyService.answerList(saNum);
	}
	
}
