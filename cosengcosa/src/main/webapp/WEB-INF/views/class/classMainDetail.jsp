<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- 왼 -->
<div class="row">
	<div class="col">
		<div class="row p-2">
			<div class="col-md ">
				<div class="row position-relative bg-primary bg-opacity-50" >
					<div class="col-3">
						<svg class="bd-placeholder-img" width="200" height="200" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><title>Placeholder</title><rect width="100%" height="100%" fill="#55595c"/><text x="50%" y="50%" fill="#eceeef" dy=".3em">Thumbnail</text></svg>
					</div>
					
					<div class="col p-3 d-flex flex-column position-static">
						<h3 class="fs-bold text-start ">${cmTitle }</h3>
					
						<div class="text-wrap">별점</div>
						<div class="text-start">${cmName }</div>
						<div class="text-start">#자바</div>
					</div>
				</div>
				<div class="row">
					<div class="col shadow p-3 mb-5 bg-body rounded">
						<ul class="nav nav-pills justify-content-start">
							<li class="nav-item">
								<a class="nav-link fbk " href="#">강의소개</a>
							</li>
							<li class="nav-item">
								<a class="nav-link fbk" href="#">커리큐럼</a>
							</li>
							<li class="nav-item">
								<a class="nav-link fbk" href="#">수강평</a>
							</li>
							<li class="nav-item">
								<a class="nav-link fbk" href="#">커뮤니티</a>
							</li>
							<li class="nav-item">
								<a class="nav-link fbk" href="#">새소식</a>
							</li>
						</ul>
			 		</div>
		 		</div>
			</div>
		</div>
		
		<div class="row">
			<div class="col-8">
				<strong><span class="fs-3">${csContent}</span></strong>
			</div>

			<div class="col-md-4 col-lg-3 order-md-last">
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm">
						<div class="row">
							<div class="col">
								<div>
									<small class="my-0">${cmPrice }</small>
									<p class="text-muted fs-4">${cmPrice }/5</p>
								</div>
								<!-- 구매가 되었을 경우 -->
								<c:if test="${chk }">
								<div class="d-grid gap-3">
									<button name ="payList" id="payList" class="btn btn-outline-success bg-opacity-50" type="button" href="classSubList">수강하기</button>
								</div>
								<div class="button-group-center">
									<button type="button" class="btn btn-link"><i class="bi bi-heart"></i> </button>
									<button type="button" class="btn btn-default bi bi-share"><span class="glyphicon glyphicon-share-alt"></span></button>
								</div>
								</c:if>
								
								<!-- 구매가 되지 않았을경우 -->
								<c:if test="${not chk }">
								<div class="d-grid gap-3">
									<button name ="payList" id="payList" class="btn btn-outline-success bg-opacity-50" type="button" href="./payList">수강신청 하기</button>
									<button name = "pocketList" id="pocketList" class="btn btn-outline-secondary bg-opacity-50" type="button" href="pocketList">바구니에 담기</button>
								</div>
								<div class="button-group-center">
									<button type="button" class="btn btn-link"><i class="bi bi-heart"></i> </button>
									<button type="button" class="btn btn-default bi bi-share"><span class="glyphicon glyphicon-share-alt"></span></button>
								</div>
								</c:if>
							</div>
						</div>
					</li>
					
					<li class="list-group-item d-flex justify-content-between lh-sm bg-info bg-opacity-10">
						<div>
							<p>지식공유자 : ${cmTitle }<p>
							<p>총${csNo }개 수업</p>
							<p>수강기간: ${cmPeriod}</p>
						</div>
					</li>

			</div>
		
	</div>
</div>



