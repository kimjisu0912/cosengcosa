<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">결재 하기</h2>
			</div>
		</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<div class="row">
						<div class="h3 pb-2 mb-4 text-dark border-bottom border-dark fw-bold">
						  * 구매자 정보
						</div>					
						<div class="p-3 bg-info bg-light border border-dark border fw-semibold">
							<div class="row">
								<div class="col-2">
									 구매자ID : 
								</div>
								<div class="col-2">
									${sessionScope.member.id }
								</div>
							</div>
							<div class="row mt-3">
								<div class="col-2">
									 구매자이름 : 
								</div>
								<div class="col-2">
									${sessionScope.member.name }
								</div>
							</div>
						</div>						
					</div>
				</div>
			</div>
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">
					<div class="h3 pb-2 mb-4 text-dark border-bottom border-dark fw-bold">
					  * 구매한 강의
					</div>					
					<div class="p-3 bg-light border border-dark border fw-semibold">
					  ${classmain.cmTitle }
					</div>
				</div>				
			</div>
			<div class="row mt-5 mb-4">
				<div class="col-8 offset-2">
					<div class="h3 pb-2 mb-4 text-dark border-bottom border-dark fw-bold">
					  * 구매한 강의 정보
					</div>					
					<div class="p-3 bg-light border border-dark border fw-semibold">
						<div class="row">
							<div class="col-auto">
					  			강의 제공자 :
					  		</div>
					  		<div class="col-auto text-start">
					  			${classmain.cmName }
					  		</div>
					  		<div class="col-auto">
					  			가 격 :
					  		</div>
					  		<div class="col-auto text-start">
					  			<fmt:formatNumber type="number" maxFractionDigits="3" value="${classmain.cmPrice }"/>원
					  		</div>
					  	</div>
					  	<div class="row mt-4">
					  		<div class="col-auto">
					  			수강 기간 :
					  		</div>
					  		<div class="col-auto text-start">
					  			${classmain.cmPeriod } 개월
					  		</div>
					  		<div class="col-auto">
					  			별 점 :
					  		</div>
					  		<div class="col-auto text-start">
					  		<c:if test="${classmain.cmStar eq '5'}">
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  		</c:if>
					  		<c:if test="${classmain.cmStar eq '4'}">
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star "></span>
					  		</c:if>	
					  		<c:if test="${classmain.cmStar eq '3'}">
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star "></span>
					  			<span class="fa fa-star "></span>
					  		</c:if>	
					  		<c:if test="${classmain.cmStar eq '2'}">
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star "></span>
					  			<span class="fa fa-star "></span>
					  			<span class="fa fa-star "></span>
					  		</c:if>	
					  		<c:if test="${classmain.cmStar eq '1'}">
					  			<span class="fa fa-star checked"></span>
					  			<span class="fa fa-star "></span>
					  			<span class="fa fa-star "></span>
					  			<span class="fa fa-star "></span>
					  			<span class="fa fa-star "></span>
					  		</c:if>				
					  			/${classmain.cmStar }점
					  		</div>
					  	</div>
						<div class="row mt-4">
							<div class="col-auto">
					  			강의 내용 :
					  		</div>
						</div>
						<div class="row mt-2">
							<div class="col-auto">
					  			${classmain.cmContent }
					  		</div>
						</div>
					</div>
				</div>				
			</div>
			
		<form name="classPayAddForm" id="classPayAddForm">
			<!-- hidden input joinResult -->
			<input type="hidden" name="cmNo" id="cmNo" value="${classmain.cmNo }"/>
			
			<input type="hidden" name="pMid" id="pMid" value="${sessionScope.member.id }"/>
			<input type="hidden" name="pName" id="pName" value="${sessionScope.member.name }"/>
			<input type="hidden" name="pCmcode" id="pCmcode" value="${classmain.cmCode }"/>
			<input type="hidden" name="pCname" id="pCname" value="${classmain.cmTitle }"/>
			<input type="hidden" name="pPrice" id="pPrice" value="${classmain.cmPrice }"/>
			<div class="row mb-3 mt-3">				
				<div class="col-8 offset-2">
					<input type="submit" value="결재하기" class="btn btn-dark">
					<a href="javascript:window.history.back();" class="btn btn-secondary">취소</a>
				</div>
			</div>
		</form>
	</div>
</div>

<script src="resources/js/pay.js"></script>
