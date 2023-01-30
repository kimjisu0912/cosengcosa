<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<div class="row my-3 py-2 subBk">
	<h3 class="ms-5 fw-bold">회원정보</h3>
</div>
<div class="row">
	<div class="col-2  ps-0 pe-3">
		<aside class="bg-light border">
			<nav class="nav flex-column">
			  <a class="nav-link disabled fs-5 fw-bold" >HOME</a>
			  <a class="nav-link fbk fs-3" href="myClassMain">MyPage</a>
			  <a class="nav-link disabled fs-5 fw-bold" >학습관리</a>
			  <a class="nav-link fbk fs-3" href="myClass">내 강의실</a>
			  <a class="nav-link disabled fs-5 fw-bold">수강신청 관리</a>
			  <a class="nav-link fbk fs-3" href="myCart">장바구니</a>
			  <a class="nav-link fbk fs-3" href="myPay">결제내역</a>
			  <a class="nav-link disabled fs-5 fw-bold">설정</a>
			  <a class="nav-link fbk fs-3" href="myInfo">회원정보</a>
			</nav>
		</aside>
	</div>
	<div class="col-10">
		<div class="row text-center my-3"> <!-- 헤더 -->
			<h3>${userName} 님의 정보</h3>
		</div>
		<!-- 회원정보 -->
		<div class="row border my-3"> 
			<form action="memberUpdateResult" method="post" name="memberUpdateForm" id="memberUpdateForm">
			<!-- 닉네임  중복검사를 했는지 확인 -->
			<input type="hidden" name="isNickNameCheck" id="isNickNameCheck" value="false"/>
				<div class="row mt-5">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 닉네임</span>
						  	<input type="text" class="form-control" name="nickname" id="nickname" value="${member.nickname }">
						  	<input type="button" class="btn btn-dark" id="btnOverlapNickName2" value="중복확인">
						</div>					
					</div>				
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 전화번호</span>
							<select class="form-select" name="tel1" id="tel1" value="${member.tel.split('-')[0] }">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
							</select>
						  	<span class="input-group-text">-</span>
							<input type="text" class="form-control" name="tel2" id="tel2" maxlength="4" value="${member.tel.split('-')[1] }">
						  	<span class="input-group-text">-</span>
						  	<input type="text" class="form-control" name="tel3" id="tel3" maxlength="4" value="${member.tel.split('-')[2] }">
						</div>
					</div>
				</div>			
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 이메일</span>
							<input type="text" class="form-control" name="emailId" id="emailId" value="${member.email.split('@')[0]}">
						  	<span class="input-group-text">@</span>
						  	<input type="text" class="form-control" name="emailDomain" id="emailDomain" value="${member.email.split('@')[1]}">
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
							<span class="input-group-text">* 우편번호</span>
						  	<input type="text" class="form-control" name="zipcode" id="zipcode" value="${member.zipcode}" readonly>
						  	<input type="button" class="btn btn-dark" id="btnZipcode" value="우편번호 찾기">
						</div>	
					</div>
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 기본주소</span>
						  	<input type="text" class="form-control" name="address1" id="address1" value="${member.address1}" readonly>
						</div>	
					</div>	
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">상세주소</span>
						  	<input type="text" class="form-control" name="address2" id="address2" value="${member.address2}">
						</div>	
					</div>
				</div>
				<div class="row mt-3 mb-5">				
					<div class="col-8 offset-2 text-center">
						<input type="submit" value="회원정보 수정하기" class="btn btn-warning">
					</div>
				</div>
			</form>
		</div>
		<div class="row border my-5">
			<div class="row my-3 text-center">
				<h4>비밀번호</h4>
			</div>
			<div class="row mb-10">
			<form id="passChange" action="passUpdate" method="post">
				<input type="hidden" name="id" id="id" value="${userId}"/>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 현재 비밀번호</span>
						  	<input type="password" class="form-control" name="oldPass" id="oldPass">
						  	<input type="button" class="btn btn-dark" id="btnPassCheck" value="비밀번호 확인">
						</div>	
					</div>				
				</div>
				<div class="row">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 새 비밀번호</span>
						  	<input type="password" class="form-control" name="pass1" id="pass1">
						</div>
					</div>				
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 새 비밀번호 확인</span>
						  	<input type="password" class="form-control" name="pass2" id="pass2">
						</div>
					</div>				
				</div>	
				<div class="row my-3">
					<div class="col-8 offset-2">	
						<div class="text-center mb-5">
							<input type="submit" value="비밀번호 변경하기" class="btn btn-warning">
						</div>
					</div>				
				</div>			
			</form>	
			</div>
		</div>
		<div class="row border my-3">
			<div class="row my-3 text-center">
				<h4 >계정탈퇴</h4>
			</div>
			<div class="row text-center">
				<p class="fs-6 text-danger">※ 계정 탈퇴 시 결제하신 모든 강의는 수강하실 수 없습니다.</p>
			</div>
			<div class="row mb-10">
			<form id="deleteMember" action="deleteMember" method="post">
				<input type="hidden" name="id" id="id" value="${userId}"/>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 비밀번호</span>
						  	<input type="password" class="form-control" name="pass" id="pass">
						</div>	
					</div>				
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">	
						<div class="text-center mb-5">
							<input type="submit" value="탈퇴하기" class="btn btn-danger">
						</div>
					</div>				
				</div>			
			</form>	
			</div>
		</div>
	</div>
</div>
