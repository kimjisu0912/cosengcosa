<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script>
	var data = ${result};
	console.log(data);
	
	var heatData = ${heatData};
	console.log(heatData);
</script>
<div class="row my-3 py-2 subBk">
	<h3 class="ms-5 fw-bold">MyPage</h3> 
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
			    <a class="navbar-brand fw-bold" >${userId} 님 환영합니다</a>
			  </div>
			</nav>
		</div>
		<div class="row mt-5">
			<div class="col-6 text-center">
				<div class="row"> 
					<h4 class="fw-bold me-3">최근 본 강의</h4> 
				</div>
				<div class="row mt-5 ms-5">
					<div class="card" style="width: 90%;">
					  <a href="classSubList?cmcode=${sub.mysGroup}"><img src="http://img.youtube.com/vi/${sub.mysVideo }/mqdefault.jpg" class="card-img-top" alt="..."></a>
					  <div class="card-body">
					    <h5 class="card-title"><a href="classSubList?cmcode=${sub.mysGroup}">${sub.mysTitle }</a></h5>
					  </div>
					</div>
				</div>
			</div>
			<div class="col-6">
				<div class="fw-bold row text-center">
					<h3>나의 기술스택</h3>
				</div>
				<div class="row">
					<div id="chart" style="width: 100%; height:500px;"></div> 
				</div>
			</div>
		</div>
		<div class="row">
			<div class="row">
				<div class="ms-5" id="heatchart" style="width: 100%; height:700px;"></div>
			</div>
		</div>
	</div>
</div>
	<script src="resources/js/chart.js"></script><!-- echart  -->
	<script src="resources/js/echarts.min.js"></script><!-- echart  -->