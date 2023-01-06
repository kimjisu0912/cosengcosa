<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- header row는 최대수치가 12분할이다-->
 	<div class="row border-bottom" id="global-header">
 		<div class="col-2">
 			<p><img src="https://via.placeholder.com/200x65"></p>
 		</div>
 		<!-- nav 왼쪽 -->
 		<nav class="navbar navbar-expand-lg mainBk" >
 			<div class="col-6 container-fluid">
 				<div class="col">
 					<ul class="nav nav-pills justify-content-start">
 						<li class="nav-item">
 							<a class="nav-link fbk" href="classMainList">강의</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link fbk" href="#">지식공유</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link fbk" href="#">자유게시판</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link fbk" href="#">요청사항</a>
 						</li>
 					</ul>
 				</div>
 			</div>
 		<!-- nav 오른쪽 -->
	 		<div class="col-6 container-fluid">
	 				<div class="col text-end">
	 					<ul class="nav nav-pills justify-content-end">
		 					<li class="nav-item">
		 						<form class="d-flex" role="search">
						        	<input class="form-control-sm me-1 mt-1" type="search" placeholder="" aria-label="Search">
						        	<button class="btn btn-light btn-xs" type="submit" ><i class="bi bi-search-heart-fill"></i></button>
						        </form>
						    </li>
						    <!-- 
	 						<li class="nav-item">
	 							<a class="nav-link" href='${sessionScope.isLogin ? "logout" : "loginForm" }'>
	 								${sessionScope.isLogin ? "로그아웃" : "로그인-폼" }
	 							</a>
	 						</li>
						     -->
	 						<li class="nav-item fbk"><!-- 클래스로 이용해서 사용 -->
	 							<a class="nav-link fbk"  
	 							${not sessionScope.isLogin ? "href='#' data-bs-toggle='modal' data-bs-target='#lgoinModal'" : "href='logout'"}><!-- 로그인상태값에 따라 모달창 출력유무 -->
	 								${sessionScope.isLogin ? "로그아웃" : "로그인-모달" }
	 							</a>
	 						</li>
		 					<c:if test="${sessionScope.isLogin }">	
		 						<li class="nav-item">
		 							<a class="nav-link fbk" href="#">내 강의실</a>
		 						</li>
		 					</c:if>	
		 					<c:if test="${not sessionScope.isLogin }">
		 						<li class="nav-item">
		 							<a class="nav-link fbk" href="join">회원가입</a>
		 						</li>
		 					</c:if>
	 					</ul>
	 				</div>
	 			</div>
			</nav>
 			<div class="row">
 				<div class="col text-end pe-4">
				<c:if test="${sessionScope.isLogin }">
					안녕하세요 ${sessionScope.member.name }님!
				</c:if>
 				</div>
 			</div>
 	</div>