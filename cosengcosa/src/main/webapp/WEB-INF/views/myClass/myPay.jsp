<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row my-3 py-2 subBk">
	<h2 class="ms-5 fw-bold">신청내역</h2>
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
			    <a class="navbar-brand fw-bold" >${userId}님의 결제내역</a>
			  </div>
			</nav>
		</div>
	</div>
</div>
    