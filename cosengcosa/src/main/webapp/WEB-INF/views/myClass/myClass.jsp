<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row my-3 py-2 subBk">
	<h2 class="ms-5 fw-bold">내 강의실</h2>
</div>
<div class="row">
	<div class="col-2 ps-0 pe-3">
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
		<!-- 타이틀 -->
		<div class="row">
			<nav class="navbar bg-light">
			  <div class="container-fluid">
			    <a class="navbar-brand fw-bold">${userId}님의 강의</a>
			  </div>
			</nav>
		</div>
		<!-- 분류 및 검색  -->
		<div class="row mt-3">
			<div class="col-2">
				<label class="ms-1 mb-1">정렬</label>
				<select class="form-select">
					<option value="">최근 공부</option>
					<option value="">최근 수강신청</option>
					<option value="">제목순</option>
				</select>
			</div>
			<div class="col-2">
				<label class="ms-1 mb-1">진행률</label>
				<select class="form-select">
					<option value="">학습중</option>
					<option value="">완강</option>
					<option value="">모두보기</option>
				</select>
			</div>
			<div class="col-4"></div>
			<div class="col-4 mt-3">
				<form class="d-flex" role="search">
		        	<input class="form-control form-control-sm me-2" type="search" placeholder="강의명 또는 강사명" aria-label="Search">
		       		<button class="btn btn-outline-success" type="submit"><i class="bi bi-search"></i></button>
		      	</form>
			</div>
		</div> <!-- 분류 및 검색 end -->
		<!-- 강의 리스트 -->
		<div class="row my-5 ">	
			<c:if test="${not empty mList }">
				<c:forEach var="m" items="${mList}" >
					<div class="col-4 mb-5" >	
						<div class="text-center">
							<div class="row"><a><img width="260px"  height="170px" src="http://img.youtube.com/vi/${m.image }/mqdefault.jpg"></a></div>
							<div class="row mt-3"><a class="fbk px-4">${m.mymTitle }</a></div>
							<div class="row my-1"><a class="color-black dnone px-4">수강기간 : ${m.sdate} ~ ${m.edate}</a></div>
							<div class="row my-1"><p>학습률</p></div>
						</div>	
					</div>
				</c:forEach>	
			</c:if>
			<c:if test="${empty mList }">
				<tr>
					<td colspan="3">수강중인 강의가 존재하지 않습니다.</td>
				</tr>
			</c:if>
		</div>	
	</div>
</div>
