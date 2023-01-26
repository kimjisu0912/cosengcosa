package com.cosengcosa.room.service;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.mail.HtmlEmail;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.cosengcosa.room.domain.Member;
import com.cosengcosa.room.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;
	
	/* 회원 비밀번호에 대한 암호화 인코딩관련 스프링 시큐리티의 PasswordEncoder
	 * 회원 로그인 요청시 DB 테이블에 암호화 인코딩되어 저장된 비밀번호와 사용자가
	 * 입력한 일반 문자열 비밀번호를 비교하는데 사용되고 회원 가입과 회원 정보 수정에서
	 * 사용자가 입력한 비밀번호를 암호화 인코딩하여 저장하는데도 사용된다.
	 **/
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	// 로그인 처리 메서드
	@Override
	public int login(String id, String pass) {
		
		Member m = memberDao.getMember(id);
		
		int result = -1;		
		
		// id가 존재하지 않으면
		if(m == null) {
			return result;
		}
			
		if(passwordEncoder.matches(pass, m.getPass())) {
			result = 1;
			
		} else { // 비밀번호가 틀리면
				result = 0;
		}
		
		return result;
	}

	// 회원조회 메서드
	@Override
	public Member getMember(String id) {
		return memberDao.getMember(id);
	}
	
	
	// 아이디 중복확인 메서드
	@Override
	public boolean overlapIdCheck(String id) {
		Member member = memberDao.getMember(id);
		System.out.println("overlapIdCheck - member : " + member);
		if(member == null) {
			return false;
		}
		return true;
	}
	
	// 회원가입 메서드
	@Override
	public void addMember(Member member) {
		// BCryptPasswordEncoder 객체를 이용해 비밀번호를 암호화한 후 저장
		member.setPass(passwordEncoder.encode(member.getPass()));
		
		System.out.println(member.getPass());
		memberDao.addMember(member);

	}

	// 회원 비밀번호 확인 메서드
	@Override
	public boolean memberPassCheck(String id, String pass) {
		String dbPass = memberDao.memberPassCheck(id, pass);		
		boolean result = false;		
		
		if(passwordEncoder.matches(pass, dbPass)) {
			result = true;	
		}
		return result;
	}

	// 회원 비밀번호 수정 메서드
	@Override
	public void updateMember(Member member) {
		memberDao.updateMember(member);
	}

	// 닉네임 중복확인 메서드
	@Override
	public boolean overlapNickNameCheck(String nickname) {
		Member member = memberDao.getNickName(nickname);
		System.out.println("overlapNickNameCheck - member : " + member);
		if(member == null) {
			return false;
		}
		return true;
	}

	// 비밀번호 변경 메서드
	@Override
	public void updatePass(Member member) {
		member.setPass(passwordEncoder.encode(member.getPass()));
		
		memberDao.updatePass(member);
		
	}

	// 회원 탈퇴 처리 메서드
	@Override
	public void deleteMember(String id) {
		memberDao.deleteMember(id);
	}

	
	// 아이디 찾기 메서드
	@Override
	public int findMemberIdChk(String name, String email) {		
		
		Member member = memberDao.findMemberId(name);
		int result = -1;
		
		if(member == null) {
			return result;
		}
		
		if(member.getEmail().equals(email)) {
			result = 1;
		} else {
			result = 0;
		}
		
		return result;
	}
	
	// 이름으로 멤버 조회 메서드
	@Override
	public Member findMemberId(String name) {
		
		return memberDao.findMemberId(name);
	}

	/**
	// 이메일 발송 메서드
	@Override
	public void sendEmail(Member member, String div) throws Exception {
		// Mail Server 설정
		String charSet = "utf-8";
		String hostSMTP = "smtp.gmail.com"; //네이버 이용시 smtp.naver.com
		String hostSMTPid = "2023.dvtest@gmail.com";
		String hostSMTPpwd = "tester2023";

		// 보내는 사람 EMail, 제목, 내용
		String fromEmail = "2023.dvtest@gmail.com";
		String fromName = "코생코사";
		String subject = "코생코사";
		String msg = "비밀번호 찾기";

		if(div.equals("findpw")) {
			subject = "코생코사 임시 비밀번호 입니다.";
			msg += "<div align='center' style='border:1px solid black; font-family:verdana'>";
			msg += "<h3 style='color: blue;'>";
			msg += member.getId() + "님의 임시 비밀번호 입니다. 비밀번호를 변경하여 사용하세요.</h3>";
			msg += "<p>임시 비밀번호 : ";
			msg += member.getPass() + "</p></div>";
		}

		// 받는 사람 E-Mail 주소
		String mail = member.getEmail();
		System.out.println("email : " + mail);
		try {
			HtmlEmail email = new HtmlEmail();
			email.setDebug(true);
			email.setCharset(charSet);
			email.setSSL(true);
			email.setHostName(hostSMTP);
			email.setSmtpPort(465); //네이버 이용시 587

			email.setAuthentication(hostSMTPid, hostSMTPpwd);
			email.setTLS(true);
			email.addTo(mail, charSet);
			email.setFrom(fromEmail, fromName, charSet);
			email.setSubject(subject);
			email.setHtmlMsg(msg);
			email.send();
		} catch (Exception e) {
			System.out.println("메일발송 실패 : " + e);
		}
		
	}
	**/

	@Override
	public Map<String, Object> findMemberPass(String id, String email){
		
		Member member = memberDao.getMember(id);
		
		String pass = "";
		
		int result = -1;
		
		if(member == null) {
			result = -1;
		}
		
		if(member.getEmail().equals(email)) {
			
			for (int i = 0; i < 12; i++) {
				pass += (char) ((Math.random() * 26) + 97);
			}
			member.setPass(passwordEncoder.encode(pass));;
			// 비밀번호 변경
			System.out.println("memberService 임시비밀번호 : " + pass);
			memberDao.updatePass(member);
			
			result = 1;
			
		} else {
			result = 0;
		}
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		modelMap.put("result", result);
		modelMap.put("pass", pass);
		
		
		
		return modelMap;
	}
}
