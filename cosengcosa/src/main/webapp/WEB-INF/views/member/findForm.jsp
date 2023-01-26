<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<div class="row">
	<div class="col-3"></div>
		<div class="col-6" >
			<div class="row text-center mt-5">
				<div class="col form-check form-check-inline">
					<input class="form-check-input ms-3" type="radio" name="find" id="findId" value="findId" >
					<label class="form-check-label" for="findPass">아이디 찾기</label>
				</div>
				<div class="col form-check form-check-inline">
					<input class="form-check-input ms-3" type="radio" name="find" id="findPass" value="findPass">
					<label class="form-check-label" for="findPass">비밀번호 찾기</label>
				</div>
			</div>
			<!-- 아이디 찾기 폼  -->
			<div class="row text-center my-5 d-none" id="findIdFrm">
				<form action="findIdResult" name="findIdForm" method="post" id="findIdForm">
					<h3>아이디 찾기</h3>
					<div class="row my-3">
						<div class="input-group my-3">
							<span class="input-group-text">이름</span>
						  	<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="row my-3">
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
						<div class="row mb-3 mt-5">				
							<div class="text-end">
								<input type="submit" value="아이디 찾기" class="btn btn-dark">
							</div>
						</div>
					</div>
				</form>
			</div>
			
			<div class="row text-center my-5 d-none" id="findPassFrm">
				<form action="findPassResult" name="findPassForm" method="post" id="findPassForm">
					<h3>비밀번호 찾기</h3>
					<div class="row my-3">
						<div class="input-group my-3">
							<span class="input-group-text">아이디</span>
							  	<input type="text" class="form-control" name="id" id="id">
						</div>
					</div>
					<div class="row my-3">
						<div class="input-group mb-3">
							<span class="input-group-text">이메일</span>
							<input type="text" class="form-control" name="emailId2" id="emailId2">
						  	<span class="input-group-text">@</span>
						  	<input type="text" class="form-control" name="emailDomain2" id="emailDomain2">
						  	<select class="form-select" name="selectDomain2" id="selectDomain2">
									<option>직접입력</option>
									<option>네이버</option>
									<option>다음</option>
									<option>한메일</option>
									<option>구글</option>
							</select>
						</div>
						<div class="row mb-3 mt-5">				
							<div class="text-end">
								<input type="submit" value="비밀번호 찾기" class="btn btn-dark">
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	<div class="col-3"></div>
</div>
<script src="resources/js/member.js"></script>