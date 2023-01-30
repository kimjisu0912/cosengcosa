package com.cosengcosa.room.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.service.MemberService;

/**
 * 회원관련 컨트롤러
 * @author 김동영
 *
 */

@Controller
@SessionAttributes("member")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	// 로그인 처리 
	@RequestMapping(value="/login", method=RequestMethod.POST)	
	public String login(Model model, @RequestParam("userId") String id, 
			@RequestParam("userPass") String pass, 
			HttpSession session, HttpServletResponse response) 
					throws ServletException, IOException {
		
		int result = memberService.login(id, pass);
		
		if(result == -1) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("	alert('존재하지 않는 아이디 입니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
			
		} else if(result == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 틀렸습니다.');");
			out.println("	history.back();");
			out.println("</script>");
			return null;
		}
		
		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);	
		
		model.addAttribute("member", member);
		session.setAttribute("userName", member.getName());
		session.setAttribute("userId", member.getId());
				
		return "redirect:main";
	}
	// 로그아웃 처리
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {	

		// 현재 세션을 종료하고 새로운 세션을 시작한다.
		session.invalidate();
		
		return "redirect:/main";
	}
	
	// 회원가입 화면 호출
	@RequestMapping("/join")
	public String joinForm() {
		System.out.println("회원가입 폼보기");
		return "member/join";
	}
	
	// 회원가입 처리 
	@RequestMapping("/joinResult")
	public String joinResult(Model model, Member member,
			String pass1, String birthY, String birthM, String birthD,
			String emailId, String emailDomain,
			String tel1, String tel2, String tel3) {		
		
		member.setPass(pass1);
		member.setBirth(birthY +"/" + birthD + "/" + birthD);
		member.setEmail(emailId + "@" + emailDomain);
		member.setTel(tel1 + "-" + tel2 + "-" + tel3);
				
		memberService.addMember(member);
		System.out.println("joinResult : " + member.getName());
		
		return "redirect:main";
	}
	
	// 회원가입 폼에서 들어오는 중복 아이디 체크 요청 처리
	@RequestMapping("/overlapIdCheck")	
	public String overlapIdCheck(Model model, String id) {		
		
		// 회원 아이디 중복 여부확인
		boolean overlap = memberService.overlapIdCheck(id);
		
		model.addAttribute("id", id);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
	}	
		
	// 회원정보 보기 요청처리 함수
	@RequestMapping("/myInfo")
	public String myInfo(Model model, HttpSession session) {		
		
		return "member/myInfo";
	}
	
	// 회원정보 수정 요청 처리 함수
	@RequestMapping("/memberUpdateResult")
	public String memberUpdateInfo(Model model, Member member,
			String nickname, String emailId, String emailDomain,
			String tel1, String tel2, String tel3, String zipcode,
			String address1, String adrress2){
		
		member.setEmail(emailId + "@" + emailDomain);
		member.setTel(tel1 + "-" + tel2 + "-" + tel3);
				
		if(tel2.equals("") || tel3.equals("")) {			
			member.setTel("");				
		} else {			
			member.setTel(tel1 + "-" + tel2 + "-" + tel3);
		}				
			
		memberService.updateMember(member);		
		System.out.println("memberUpdateResult : " + member.getId());
	
		model.addAttribute("member", member);
		
		return "redirect:myInfo";
	}
		
	// 회원가입시 닉네임 중복 체크 요청 처리
	@RequestMapping("/overlapNickNameCheck")	
	public String overlapNickNameCheck(Model model, String nickname) {		
		
		// 회원 닉네임 중복 여부 확인
		boolean overlap = memberService.overlapNickNameCheck(nickname);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapNickNameCheck.jsp";
	}	
	
	// 회원수정시 닉네임 중복 체크 요청 처리
	@RequestMapping("/overlapNickNameCheck2")	
	public String overlapNickNameCheck2(Model model, String nickname) {		
		
		// 회원 닉네임 중복 여부를 받아온다.
		boolean overlap = memberService.overlapNickNameCheck(nickname);
		
		model.addAttribute("nickname", nickname);
		model.addAttribute("overlap", overlap);
		
		return "forward:WEB-INF/views/member/overlapNickNameCheck2.jsp";
	}
		
	// 비밀번호 수정 처리 
	@RequestMapping("/passUpdate")
	public String passUpdate(Model model, Member member, String id, String pass1) {
		
		member.setPass(pass1);
		memberService.updatePass(member);
		
		model.addAttribute("member", member);
		
		return "redirect:myInfo";
	}
		
	// 회원정보 비밀번호 수정시 현재 비밀번호 확인
	@RequestMapping("/passCheck.ajax")
	@ResponseBody
	public Map<String, Boolean> memberPassCheck(String id, String pass) {
		
		boolean result = memberService.memberPassCheck(id, pass);
		Map<String, Boolean> map = new HashMap<String, Boolean>();
		map.put("result", result);
		
		return map;
	}
	
	// 회원탈퇴 요청 처리
	@RequestMapping("/deleteMember")
	public void deleteMember(HttpSession session, HttpServletResponse response, String id, String pass) 
				throws ServletException, IOException {
		
		//비밀번호 확인
		boolean result = memberService.memberPassCheck(id, pass);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if(result == true) {
			memberService.deleteMember(id);
			session.invalidate();
			out.println("<script>");
			out.println("	alert('그동안 코생코사를 이용해주셔서 감사합니다');");
			out.println("	location.href='main'");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("	alert('비밀번호가 맞지 않습니다');");
			out.println("	history.back();");
			out.println("</script>");
		}
	}
	
	
	// 아이디 비밀번호 찾기 페이지 요청
	@RequestMapping("/findForm")
	public String findMyInfo() {
	
		return "member/findForm";
	}
	
	// 아이디 찾기
	@RequestMapping("/findIdResult")
	public void findId(HttpServletResponse response, 
			Member member, String name, String emailId, String emailDomain) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String email = emailId + "@" + emailDomain;
		
		Map<String, Object> modelMap = memberService.findMemberIdChk(name, email);
		int result = (int) modelMap.get("result");
		String id = (String) modelMap.get("id");
		
		if(result == 1) {
			out.println("<script>");
			out.println("	alert('회원님의 아이디는 " + id + " 입니다.');");
			out.println("	history.back();");
			out.println("</script>");
		} else if(result == 0) {
			out.println("<script>");
			out.println("	alert('입력하신 이메일이 회원정보와 일치하지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("	alert('아이디가 존재하지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
		}
	}

	// 비밀번호 찾기 메서드
	@RequestMapping("/findPassResult")
	public void findPass(HttpServletResponse response, 
						Model model,	String id, String emailId2, String emailDomain2) throws ServletException, IOException {
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String email = emailId2 + "@" + emailDomain2;
		
		Map<String, Object> modelMap = memberService.findMemberPass(id, email);
		
		int result = (int) modelMap.get("result");
		String pass = (String) modelMap.get("pass");
		System.out.println(result);
		if(result == 1) {
			out.println("<script>");
			out.println("	alert('임시 비밀번호는 " + pass + " 입니다. 로그인 후 비밀번호를 변경해주세요!');");
			out.println("	location.href='main'");
			out.println("</script>");
		} else if(result == 0) {
			out.println("<script>");
			out.println("	alert('입력하신 이메일이 회원정보와 일치하지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
		} else {
			out.println("<script>");
			out.println("	alert('해당 아이디가 존재하지 않습니다.');");
			out.println("	history.back();");
			out.println("</script>");
		}
		
	}	
}
