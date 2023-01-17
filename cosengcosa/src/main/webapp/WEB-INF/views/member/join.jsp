<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	새로운 5자리 우편번호로 회원 주소를 입력 받기 위해 daum.net에서
	제공하는 우편번호 찾기 API를 사용하였다.
	참고 사이트 : http://postcode.map.daum.net/guide
-->    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row">
			<div class="col-4"></div>
				<form action="joinResult" name="joinForm" method="post" id="joinForm">
					<%-- 
						회원 아이디 중복 검사를 했는지의 정보를 hidden 필드로 저장 
					--%>
					<input type="hidden" name="isIdCheck" id="isIdCheck" value="false"/>
					<input type="hidden" name="isNickNameCheck" id="isNickNameCheck" value="false"/>
					<div class="row text-center mb-10">
						<h2 class="fs03 fw-bold">회원가입</h2>
					</div>
					<div class="row mt-5 mb-3">
						<div class="col-8 offset-2">
							<p>* 표시된 항목은 필수입력 사항 입니다.</p>
						</div>
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 이름</span>
							  	<input type="text" class="form-control" name="name" id="name">
							</div>				
						</div>	
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 아이디</span>
							  	<input type="text" class="form-control" name="id" id="id">
							  	<input type="button" class="btn btn-dark" id="btnOverlapId" value="중복확인">
							</div>	
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 비밀번호</span>
							  	<input type="password" class="form-control" name="pass1" id="pass1">
							</div>				
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 비밀번호 확인</span>
							  	<input type="password" class="form-control" name="pass2" id="pass2">
							</div>	
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 생년월일</span>
							  	<input type="text" class="form-control" name="birthY" id="birthY" maxlength="4">
								<span class="input-group-text">년</span>
							  	<input type="text" class="form-control" name="birthM" id="birthM" maxlength="2">
								<span class="input-group-text">월</span>
							  	<input type="text" class="form-control" name="birthD" id="birthD" maxlength="2">
								<span class="input-group-text">일</span>
							</div>	
						</div>
					</div>			
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 닉네임</span>
							  	<input type="text" class="form-control" name="nickname" id="nickname">
							  	<input type="button" class="btn btn-dark" id="btnOverlapNickName" value="중복확인">
							</div>					
						</div>				
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 우편번호</span>
							  	<input type="text" class="form-control" name="zipcode" id="zipcode">
							  	<input type="button" class="btn btn-dark" id="btnZipcode" value="우편번호 찾기">
							</div>	
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">* 기본주소</span>
							  	<input type="text" class="form-control" name="address1" id="address1"  readonly>
							</div>	
						</div>	
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">상세주소</span>
							  	<input type="text" class="form-control" name="address2" id="address2">
							</div>	
						</div>
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">이메일</span>
								<input type="text" class="form-control" name="emailId" id="emailId">
							  	<span class="input-group-text">@</span>
							  	<input type="text" class="form-control" name="emailDomain" id="emailDomain">
							  	<select class="form-select" name="selectDomain" id="selectDomain">
										<option>직접입력</option>
										<option>네이버</option>
										<option>다음</option>
										<option>한메일</option>
										<option>구글</option>
								</select>
							</div>
						</div>	
					</div>
					<div class="row my-3">
						<div class="col-8 offset-2">
							<div class="input-group mb-3">
								<span class="input-group-text">전화번호</span>
								<select class="form-select" name="tel1" id="tel1">
										<option>010</option>
										<option>011</option>
										<option>016</option>
										<option>017</option>
										<option>018</option>
										<option>019</option>
								</select>
							  	<span class="input-group-text">-</span>
								<input type="text" class="form-control" name="tel2" id="tel2" maxlength="4">
							  	<span class="input-group-text">-</span>
							  	<input type="text" class="form-control" name="tel3" id="tel3" maxlength="4">
							</div>
						</div>
					</div>			
					<div class="row mb-3 mt-5">				
						<div class="col-8 offset-2 text-end">
							<input type="submit" value="가입하기" class="btn btn-dark">
						</div>
					</div>
				</form>
			<div class="col-4"></div>	
		</div>
	</div>
</div>
