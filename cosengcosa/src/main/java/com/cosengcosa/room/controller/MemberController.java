package com.cosengcosa.room.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	// 로그인 처리 함수
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
			
			/* 컨트롤러에서 null을 반환하거나 메서드의 반환 타입이 void일 경우
			 * Writer나 OutputStream을 이용해 응답 결과를 직접 작성할 수 있다.
			 * DispatcherServlet을 경유해 리소스 자원에 접근하는 경우에
			 * 자바스크립트의 history.back()은 약간의 문제를 일으킬 수 있다.
			 * history 객체를 이용하는 경우 서버로 요청을 보내는 것이 아니라
			 * 브라우저의 접속 이력에서 이전 페이지로 이동되기 때문에 발생한다. 
			 **/
			return null;
			
		} else if(result == 0) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("	alert('비밀번호가 다릅니다.');");
			out.println("	location.href='loginForm'");
			out.println("</script>");
			
			return null;
		}
		
		Member member = memberService.getMember(id);
		session.setAttribute("isLogin", true);	
		
		/* 클래스 레벨에 @SessionAttributes("member") 애노테이션을
		 * 지정하고 컨트롤러의 메서드에서 아래와 같이 동일한 이름으로 모델에
		 * 추가하면 스프링이 세션 영역에 데이터를 저장해 준다.
		 **/ 
		model.addAttribute("member", member);
		session.setAttribute("userid", member.getName());
		System.out.println("member.name : " + member.getName());

		/* 클라이언트 요청을 처리한 후 리다이렉트 해야할 경우 아래와 같이 redirect:
		 * 접두어를 붙여 뷰 이름을 반환하면 된다. 뷰 이름에 redirect 접두어가 붙으면
		 * HttpServletResponse를 사용해서 지정한 경로로 Redirect 된다. 
		 * redirect 접두어 뒤에 경로를 지정할 때 "/"로 시작하면 ContextRoot를
		 * 기준으로 절대 경로 방식으로 Redirect 된다. "/"로 시작하지 않으면 현재 
		 * 경로를 기준으로 상대 경로로 Redirect 된다. 또한 다른 사이트로 Redirect
		 * 되기를 원한다면 redirect:http://사이트 주소를 지정한다.
		 * 
		 * 로그인이 성공하면 메인페이지로 리다이렉트 된다.
		 **/		
		return "redirect:main";
	}
	// 로그아웃 처리
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus, HttpSession session) {	
		
		/* 세션 영역에서 객체를 삭제
		 * 세션 영역에서만 삭제되고 모델에는 삭제되지 않는다.
		 * 세션을 다시 시작하지 않기 때문에 세션이 계속해서 유지된다.
		 **/
		//sessionStatus.setComplete();
		
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
			String mobile1, String mobile2, String mobile3) {		
		
		member.setPass(pass1);
		member.setBirth(birthY +"/" + birthD + "/" + birthD);
		member.setEmail(emailId + "@" + emailDomain);
		member.setTel(mobile1 + "-" + mobile2 + "-" + mobile3);
				
		

		// MemberService를 통해서 회원 가입 폼에서 들어온 데이터를 DB에 저장한다.
		memberService.addMember(member);
		System.out.println("joinResult : " + member.getName());
		
		// 로그인 폼으로 리다이렉트 시킨다.
		return "redirect:main";
	}
	
	// 회원가입 폼에서 들어오는 중복 아이디 체크 요청을 처리하는 메서드
		@RequestMapping("/overlapIdCheck")	
		public String overlapIdCheck(Model model, String id) {		
			
			// 회원 아이디 중복 여부를 받아온다.
			boolean overlap = memberService.overlapIdCheck(id);
			
			// model에 id와 회원 아이디 중복 여부를 저장 한다. 
			model.addAttribute("id", id);
			model.addAttribute("overlap", overlap);
			
			/* 회원 가입 폼에서 아이디 중복확인 버튼을 클릭하면 새창으로 뷰가 보이게
			 * 해야 하므로 뷰 이름을 반환 할 때 "forward:" 접두어를 사용했다. 
			 * "forwrad:" 접두어가 있으면 뷰 리졸버 설정에 지정한 prefix, suffix를
			 * 적용하지 않고 "forwrad:" 뒤에 붙인 뷰 페이지로 포워딩 된다. 
			 **/
			return "forward:WEB-INF/views/member/overlapIdCheck.jsp";
		}	
		
		// 회원정보 보기 요청처리 함수
		
		@RequestMapping("/myInfo")
		public String myInfo(Model model, HttpSession session) {		
			
			return "member/myInfo";
		}
}
