<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<div class="row my-3 py-2 subBk">
	<h2 class="ms-5 fw-bold">회원정보</h2>
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
			  <a class="nav-link fbk fs-3" href="myPay">신청내역</a>
			  <a class="nav-link disabled fs-5 fw-bold">설정</a>
			  <a class="nav-link fbk fs-3" href="myInfo">회원정보</a>
			</nav>
		</aside>
	</div>
	<div class="col-10">
		<div class="row text-center my-3"> <!-- 헤더 -->
			<h2>${userName}님의 정보</h2>
		</div>
		<!-- 회원정보 -->
		<div class="row border my-3"> 
			<form action="" name="MyInfoEditForm" method="post" id="MyInfoEditForm">
				<div class="row mt-5">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 닉네임</span>
						  	<input type="text" class="form-control" name="nickname" id="nickname" value="${member.nickname }">
						  	<input type="button" class="btn btn-dark" id="btnOverlapNickName" value="중복확인">
						</div>					
					</div>				
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 전화번호</span>
							<select class="form-select" name="mobile1" id="mobile1" value="${member.tel.split('-')[0] }">
									<option>010</option>
									<option>011</option>
									<option>016</option>
									<option>017</option>
									<option>018</option>
									<option>019</option>
							</select>
						  	<span class="input-group-text">-</span>
							<input type="text" class="form-control" name="mobile2" id="mobile2" maxlength="4" value="${member.tel.split('-')[1] }">
						  	<span class="input-group-text">-</span>
						  	<input type="text" class="form-control" name="mobile3" id="mobile3" maxlength="4" value="${member.tel.split('-')[2] }">
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
			<form id="passChange">
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 현재 비밀번호</span>
						  	<input type="text" class="form-control" name="oldPass" id="oldPass">
						  	<input type="button" class="btn btn-dark" id="btnPassCheck" value="비밀번호 확인">
						</div>	
					</div>				
				</div>
				<div class="row">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 새 비밀번호</span>
						  	<input type="text" class="form-control" name="pass1" id="pass1">
						</div>
					</div>				
				</div>
				<div class="row my-3">
					<div class="col-8 offset-2">
						<div class="input-group mb-3">
							<span class="input-group-text">* 새 비밀번호 확인</span>
						  	<input type="text" class="form-control" name="pass2" id="pass2">
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
	</div>
</div>
