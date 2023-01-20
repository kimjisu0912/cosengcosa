<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- header row는 최대수치가 12분할이다-->
 	<div class="row border-bottom" id="global-header">
 		<div class="row">
	 		<div class="col-10">
	 			<p><a href="main"><img src="resources/images/logo.jpg" class="mt-1"></a></p>
	 		</div>
	 		<div class="col-2">
	 		
	 		</div>
 		</div>
 		<!-- nav 왼쪽 -->
 		<nav class="navbar navbar-expand-lg mainBk" >
 			<div class="col-6 container-fluid">
 				<div class="col">
 					<ul class="nav nav-pills justify-content-start">
 						<li class="nav-item">
 							<a class="nav-link fwh fs-4" href="classMainList">강의</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link fwh fs-4" href="studyList">지식공유</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link fwh fs-4" href="freeBoardList">자유게시판</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link fwh fs-4" href="requestBoardList">요청사항</a>
 						</li>
 					</ul>
 				</div>
 			</div>
 		<!-- nav 오른쪽 -->
	 		<div class="col-6 container-fluid">
	 			<div class="col text-end">
 					<ul class="nav nav-pills justify-content-end">
					    <!-- 
 						<li class="nav-item">
 							<a class="nav-link" href='${sessionScope.isLogin ? "logout" : "loginForm" }'>
 								${sessionScope.isLogin ? "로그아웃" : "로그인-폼" }
 							</a>
 						</li>
					     -->
 						<li class="nav-item"><!-- 클래스로 이용해서 사용 -->
 							<a class="nav-link fwh fs-4"  
 							${not sessionScope.isLogin ? "href='#' data-bs-toggle='modal' data-bs-target='#lgoinModal'" : "href='logout'"}><!-- 로그인상태값에 따라 모달창 출력유무 -->
 								${sessionScope.isLogin ? "로그아웃" : "로그인" }
 							</a>
 						</li>
	 					<c:if test="${sessionScope.isLogin }">	
	 						<li class="nav-item">
	 							<a class="nav-link fwh fs-4" href="myClassMain"><i class="bi bi-person-lines-fill"></i> MY</a>
	 						</li>
	 					</c:if>	
	 					<c:if test="${not sessionScope.isLogin }">
	 						<li class="nav-item">
	 							<a class="nav-link fwh fs-4" href="join">회원가입</a>
	 						</li>
	 					</c:if>
 					</ul>
	 			</div>
	 		</div>
		</nav>
 	</div>