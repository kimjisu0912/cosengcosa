<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>        
<div class="row">
	<div class="col-3"></div>
		<div class="col-6" >
			<div class="row text-center my-5 border">
				<div class="row mt-3 text-center">
					<h3 class="fw-bold">아이디 찾기</h3>
				</div>
				<form action="findIdResult" name="findId" method="post" id="findId">
					<div class="row my-3">
						<div class="input-group my-3">
							<span class="input-group-text">이름</span>
						  	<input type="text" class="form-control" name="name" id="name">
						</div>
					</div>
					<div class="row my-3">
						<div class="input-group my-3">
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
						<div class="row mb-3 mt-5">				
							<div class="text-end">
								<input type="submit" value="아이디 찾기" class="btn btn-dark">
							</div>
						</div>
						<div class="row mb-3 mt-5">	
							<c:if test="${ not empty id }">
								<div class="row"><span>회원님의 아이디는 <b>${id}</b> 입니다</span></div>
							</c:if>
							<c:if test="${empty id}">
								<div class="row"><span>존재하는 아이디가 없습니다</span></div>
							</c:if>
						</div>	
					</div>
				</form>
			</div>
			<div class="row text-center my-5">
				<h3>비밀번호 찾기</h3>
				<form action="findPassResult" name="findPass" method="post" id="findPass">
					<div class="row my-3">
						<div class="input-group my-3">
							<span class="input-group-text">아이디</span>
							  	<input type="text" class="form-control" name="id" id="id">
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
								<input type="submit" value="비밀번호 찾기" class="btn btn-dark">
							</div>
						</div>
						<div class="row mb-3 mt-5">	
						</div>	
					</div>
				</form>
			</div>
		</div>
	<div class="col-3"></div>
</div>
