<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row my-3 py-2 subBk">
	<h2 class="ms-5 fw-bold">MyPage</h2>
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
			    <a class="navbar-brand fw-bold" >${userId}님 환영합니다</a>
			  </div>
			</nav>
		</div>
		<div class="row mt-3">
			<div class="col-6">
				<div class="row text-center">
					<h4>최근 본 강의</h4>
				</div>
				<div class="row mt-3">
					<div class="col">
						<table class="table">
							<thead>
								<tr class="table">
									<th>강의명</th>
									<th>강사</th>
									<th>수강기간</th>
								</tr>		
							</thead>
						</table>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row text-center">
					<h4>${userName}님의 기술스택</h4>
				</div>
				<div class="zc-body">
					<div id="myChart" class="chart--container">
				      <a href="https://www.zingchart.com/" rel="noopener" class="zc-ref">Powered by ZingChart</a>
				    </div>
				</div>
			</div>
		</div>
		<div class="row"></div>
	</div>
</div>
