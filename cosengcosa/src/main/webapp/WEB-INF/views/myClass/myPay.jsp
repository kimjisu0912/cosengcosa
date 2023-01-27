<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<div class="row my-3 py-2 subBk">
	<h3 class="ms-5 fw-bold">신청내역</h3>
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
			    <a class="navbar-brand fw-bold" >${userId} 님의 결제내역</a>
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
				    <th scope="col" class="fs-5">가격</th>
				    <th scope="col" class="fs-5">결제일</th>
				  </tr>
				</thead>
				<c:if test="${not empty pList  }">
					<c:forEach var="p" items="${pList}" varStatus="status">
						<tbody class="table-group-divider">
						  <tr>
						    <th scope="row">${p.num}</th>
						    <td>${p.pCname}</td>
						    <td>${p.pPrice}</td>
						    <td><fmt:formatDate type="date" pattern="yyyy-MM-dd" value="${p.pCdate}" /></td>
						  </tr>
						</tbody>
					</c:forEach>
				</c:if>
				<c:if test="${empty pList }">
					<tbody class="table-group-divider">
						<tr>
						    <td colspan="3" class="text-center fs-3">
						    	결제하신 강의가 없습니다
						    </td>
					    </tr>
					 </tbody>
				</c:if>	  
				</table>
			</div>
		</div>
		<div class="row">
			<nav aria-label="Page navigation">
			  <ul class="pagination justify-content-center">
			  <!-- 이전 페이지 그룹이 존재 -->
			  	<c:if test="${startPage > pageGroup }">
				    <li class="page-item">
				     	<a class="page-link" href="myPayt?pageNum=${startPage - pageGroup}">Prev</a>
				    </li>
			    </c:if>
			    <!-- 페이지네이션 -->
			    <c:forEach var="i" begin="${startPage}" end="${endPage}">
			     	<!-- 현재 페이지인 경우 -->
 					<c:if test="${i == currentPage}">
 						<li class="page-item active">
				    		<span class="page-link" >${i}</span>
				    	</li>
 					</c:if>
 					<!-- 현재 페이지가 아닌 경우 -->
 					<c:if test="${i != currentPage}">
				    	<li class="page-item">
				    		<a class="page-link" href="myPay?pageNum=${i}">${i}</a>
				    	</li>
			    	</c:if>
				</c:forEach>
			    <!-- 다음 페이지 그룹이 존재 -->
			    <c:if test="${pageCount > endPage}">
				    <li class="page-item">
				     	<a class="page-link" href="myPay?pageNum=${startPage + pageGroup}">Next</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</div>	
	</div>
</div>
    