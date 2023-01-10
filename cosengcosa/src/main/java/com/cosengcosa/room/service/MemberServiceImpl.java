package com.cosengcosa.room.service;

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
	
	
	@Override
	public int login(String id, String pass) {
		
		Member m = memberDao.getMember(id);
		
		int result = -1;		
		
		// id가 존재하지 않으면
		if(m == null) {
			return result;
		}
		/* 로그인 성공
		 * BCryptPasswordEncoder 객체의 matches 메소드를 이용해 암호가 맞는지 확인
		 * matches() 메소드의 첫 번 인수로 인코딩이 않된 문자열, 두 번째 인수로 인코딩된 
		 * 문자열을 지정하면 두 문자열의 원본 데이터가 같을 경우 true를 반환해 준다.
		 **/		
		if(passwordEncoder.matches(pass, m.getPass())) {
			result = 1;
			
		} else { // 비밀번호가 틀리면
				result = 0;
		}
		
		return result;
	}

	@Override
	public Member getMember(String id) {
		return memberDao.getMember(id);
	}

	@Override
	public boolean overlapIdCheck(String id) {
		Member member = memberDao.getMember(id);
		System.out.println("overlapIdCheck - member : " + member);
		if(member == null) {
			return false;
		}
		return true;
	}

	@Override
	public void addMember(Member member) {
		// BCryptPasswordEncoder 객체를 이용해 비밀번호를 암호화한 후 저장
		member.setPass(passwordEncoder.encode(member.getPass()));
		
		System.out.println(member.getPass());
		memberDao.addMember(member);

	}

	@Override
	public boolean memberPassCheck(String id, String pass) {
		String dbPass = memberDao.memberPassCheck(id, pass);		
		boolean result = false;		

		/* 비밀번호가 맞으면 true를 반환하도록 작성한다.
		 * BCryptPasswordEncoder 객체의 matches 메소드를 이용해 암호가 맞는지 확인
		 * matches() 메소드의 첫 번 인수로 인코딩이 않된 문자열, 두 번째 인수로 인코딩된 
		 * 문자열을 지정하면 두 문자열의 원본 데이터가 같을 경우 true를 반환해 준다.
		 **/		
		if(passwordEncoder.matches(pass, dbPass)) {
			result = true;	
		}
		return result;
	}

	@Override
	public void updateMember(Member member) {
		// BCryptPasswordEncoder 객체를 이용해 비밀번호를 암호화한 후 저장
		member.setPass(passwordEncoder.encode(member.getPass()));
		System.out.println(member.getPass());
		
		memberDao.updateMember(member);
	}

}
