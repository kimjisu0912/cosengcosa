<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	var data = ${result};
	console.log(data);
</script>
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
						<div>
						<h1>${count.JA}</h1>
						<h1>${count.DB}</h1>
						<h1>${count.JS}</h1>
						<h1>${count.SP}</h1>
						</div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="row text-center">
					<h4>${userName}님의 기술스택</h4>
				</div>
				<div class="row">
					<div id="chart" style="width: 100%; height:500px;"></div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="row">
				<h2>나의 학습열정</h2>
			</div>
			<div class="row"">
				<div class="myCal" style="width: 100% height:500px;"></div>
			</div>
		</div>
	</div>
</div>
	<script src="resources/js/chart.js"></script><!-- echart  -->
	<!-- <script src="resources/js/myCal.js"></script>echart  -->
	<script src="resources/js/echarts.min.js"></script><!-- echart  -->