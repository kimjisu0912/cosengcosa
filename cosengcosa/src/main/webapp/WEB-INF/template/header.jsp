<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!-- header row는 최대수치가 12분할이다-->
 	<div class="row border-bottom border-primary" id="global-header">
 		<div class="col-1">
 			<p><img src="https://via.placeholder.com/140x65"></p>
 		</div>
 		<div class="col-11">
 			<div class="row">
 				<div class="col text-end">
 					<ul class="nav nav-pills justify-content-end">
 						<li class="nav-item">
 							<a class="nav-link" href='${sessionScope.isLogin ? "logout" : "loginForm" }'>
 								${sessionScope.isLogin ? "로그아웃" : "로그인-폼" }
 							</a>
 						</li>
 						<li class="nav-item"><!-- 클래스로 이용해서 사용 -->
 							<a class="nav-link" 
 							${not sessionScope.isLogin ? "href='#' data-bs-toggle='modal' data-bs-target='#lgoinModal'" : "href='logout'"}><!-- 로그인상태값에 따라 모달창 출력유무 -->
 								${sessionScope.isLogin ? "로그아웃" : "로그인-모달" }
 							</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="classMainList">강의</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">지식공유</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">자유게시판</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">요청사항</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">회원관리</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">내 강의실</a>
 						</li>
 						<li class="nav-item">
 							<c:if test="${not sessionScope.isLogin }">
 								<a class="nav-link" href="joinForm">회원가입</a>
 							</c:if>
 							<c:if test="${sessionScope.isLogin }">
 								<a class="nav-link" href="memberUpdateForm">정보수정</a>
 							</c:if>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">주문/배송조회</a>
 						</li>
 						<li class="nav-item">
 							<a class="nav-link" href="#">고객센터</a>
 						</li>
 					</ul>
 				</div>
 			</div>
 			<div class="row">
 				<div class="col text-end">&nbsp;</div>
 			</div>
 			<div class="row">
 				<div class="col text-end pe-4">
				<c:if test="${sessionScope.isLogin }">
					안녕하세요 ${sessionScope.member.name }님!
				</c:if>
 				</div>
 			</div>
 		</div>
 	</div>