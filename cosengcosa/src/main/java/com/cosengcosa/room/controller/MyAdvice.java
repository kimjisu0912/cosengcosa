package com.cosengcosa.room.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

@ControllerAdvice
public class MyAdvice {

	private Logger logger = LoggerFactory.getLogger(MyAdvice.class);
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception ex, Model model, HttpSession session) {
		logger.error("Exception 발생 : {}", ex.getMessage());
		model.addAttribute("msg", "죄송합니다 잠시 후 다시 시도해 주세요");
		// 현재 세션을 종료하고 새로운 세션을 시작한다.
		session.invalidate();
		
		return "error/error";
	}
	
	@ExceptionHandler(NoHandlerFoundException.class)
	@ResponseStatus(value = HttpStatus.NOT_FOUND)
	public String handle404(NoHandlerFoundException ex, Model model, HttpSession session) {
		logger.error("404 요청 발생", ex.getRequestURL());
		model.addAttribute("msg", "그런 페이지는 존재하지 않습니다.");
		// 현재 세션을 종료하고 새로운 세션을 시작한다.
		session.invalidate();
		
		return "error/error";
	}
	
}
