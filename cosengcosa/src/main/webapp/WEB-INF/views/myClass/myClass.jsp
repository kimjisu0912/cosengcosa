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
			    <a class="navbar-brand fw-bold">${userId} 님의 강의</a>
			  </div>
			</nav>
		</div>
		<!-- 분류 및 검색  -->
		<div class="row mt-3">
			<div class="col-2">
				<label for="keyword" class="ms-1 mb-1">정렬</label>
				<select name="keyword" id="keyword" class="form-select">
					<option value="" <c:if test="${keyword eq ''}">selected="selected"</c:if>>과목</option>
					<option value="JA" <c:if test="${keyword eq 'JA'}">selected="selected"</c:if>>Java</option>
					<option value="DB" <c:if test="${keyword eq 'DB'}">selected="selected"</c:if>>DB</option>
					<option value="JS" <c:if test="${keyword eq 'JS'}">selected="selected"</c:if>>JavaScript</option>
					<option value="SP" <c:if test="${keyword eq 'SP'}">selected="selected"</c:if>>Spring</option>
					<option value="BS" <c:if test="${keyword eq 'BS'}">selected="selected"</c:if>>BootStrap</option>
					<option value="KT" <c:if test="${keyword eq 'KT'}">selected="selected"</c:if>>Kotlin</option>
					<option value="HT" <c:if test="${keyword eq 'HT'}">selected="selected"</c:if>>HTML/CSS</option>
					<option value="JQ" <c:if test="${keyword eq 'JQ'}">selected="selected"</c:if>>jQuery</option>
					<option value="AJ" <c:if test="${keyword eq 'AJ'}">selected="selected"</c:if>>Ajax</option>
				</select>
			</div>
			<div class="col-2">
				<label for="done" class="ms-1 mb-1">진행률</label>
				<select name="done" id="done" class="form-select">
					<option value="N" <c:if test="${done eq 'N'}">selected="selected"</c:if>>학습중</option>
					<option value="Y" <c:if test="${done eq 'Y'}">selected="selected"</c:if>>완강</option>
					<option value="ALL" <c:if test="${done eq 'ALL'}">selected="selected"</c:if>>모두보기</option>
				</select>
			</div>
			<div class="col-8"></div>
		</div> <!-- 분류 및 검색 end -->
		<div class="row mt-3">
			
		</div>
		<!-- 강의 리스트 -->
		<div class="row my-5 ">	
			<c:if test="${not empty mList }">
				<c:forEach var="m" items="${mList}" >
					<div class="col-4 mb-5" >	
						<div class="text-center">
							<div class="row"><a href="classSubList?cmcode=${m.mymCode}"><img width="260px"  height="170px" src="http://img.youtube.com/vi/${m.image }/mqdefault.jpg"></a></div>
							<div class="row mt-3"><a href="classSubList?cmcode=${m.mymCode}" class="fbk px-4">${m.mymTitle }</a></div>
							<div class="row my-1"><a class="color-black dnone px-4">수강기간 : ${m.sdate} ~ ${m.edate}</a></div>
							<div class="row my-1"><p>학습률 : <fmt:formatNumber value="${m.progress}" pattern="0"/>%</p></div>
							
						</div>	
					</div>
				</c:forEach>	
			</c:if>
			<c:if test="${empty mList }">
				<div class="text-center fs-4">
					<p>강의가 존재하지 않습니다.</p>				
				</div>
			</c:if>
		</div>
	</div>
</div>
<script src="resources/js/myClass.js"></script>
