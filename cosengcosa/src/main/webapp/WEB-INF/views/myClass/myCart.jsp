<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row my-3 py-2 subBk">
	<h2 class="ms-5 fw-bold">장바구니</h2>
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
			    <a class="navbar-brand fw-bold" >${userId} 님이 수강하고싶은 강의</a>
			  </div>
			</nav>
		</div>
		<div class="row">
			<div class="col ms-5 mt-3">
			<table class="table table-borderless">
				<thead>
				  <tr>
				    <th scope="col"></th>
				    <th scope="col" class="fs-5">강의명</th>
				    <th scope="col" class="fs-5">강사명</th>
				    <th scope="col" class="fs-5">가격</th>
				  </tr>
				</thead>
				<c:if test="${not empty bList  }">
					<c:forEach var="b" items="${bList}" varStatus="status">
						<tbody class="table-group-divider">
						  <tr>
						    <th scope="row">${status.count}</th>
						    <td><a href="classMainDetail?cmNo=${b.cmNo }&cmCode=${b.baCmcode}">${b.baCname }</a></td>
						    <td>${b.cmName}</td>
						    <td>${b.baPrice}</td>
						  </tr>
						</tbody>
					</c:forEach>
				</c:if>
				<c:if test="${empty bList }">
					<tbody class="table-group-divider">
						<tr>
						    <td colspan="2" class="text-center fs-3">
						    	장바구니에 담은 강의가 없습니다
						    </td>
					    </tr>
					 </tbody>
				</c:if>	  
				</table>
			</div>
		</div>		
	</div>
</div>
    