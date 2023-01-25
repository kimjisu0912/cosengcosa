package com.cosengcosa.room.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * 로그인 인터셉터 체크
 * @author 김지수
 *
 */

public class LoginCheckInterceptor implements HandlerInterceptor {

	/*
	 * 컨트롤러 실행 전 로그인체크 인터셉터
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if(request.getSession().getAttribute("isLogin") == null) {
			response.setContentType("text/html; charset=UTF-8");
			StringBuilder sb = new StringBuilder();
			sb.append("<script>");
			sb.append("	alert('정상적인 경로 접근이 아닙니다 로그인 후 이용 해주세요.');");
			sb.append("	history.back();");
			sb.append("</script>");
		    PrintWriter out = response.getWriter();
			out.println(sb.toString());
			//response.sendRedirect("/main");
			return false;
		}
		return true;
	}

	/*
	 * 컨트롤러가 정상 실행 후 실행되는 인터셉터
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
	}

	/*
	 * 클라이언트의 요청을 처리하고 뷰를 생성해 클라이언트로 전송한 후에 호출
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {

	}

}
