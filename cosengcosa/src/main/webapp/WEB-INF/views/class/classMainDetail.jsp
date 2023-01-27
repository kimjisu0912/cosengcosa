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
						 <img src="http://img.youtube.com/vi/${cmVideo }/mqdefault.jpg"></img>
					</div>
					
					<div class="col p-3 d-flex flex-column position-static">
						<h3 class="fs-bold text-start ">${classMain.cmTitle}</h3>
					
						<div class="text-wrap"></div>
						<span class="text-xl-start">${classMain.cmName}</span>
						<div class="text-start"></div>
					</div>
				</div>
				<div class="row my-2">
					<c:if test="${sessionScope.member.id =='admin'}">
						<div class="col ">
							<ul class="nav nav-pills justify-content-end">
								<li class="nav-item">
									<a type="button" class="btn btn-primary m-2" href="classSubList?cmcode=${classMain.cmCode }">강의영상 목록</a>
								</li>
								<li class="nav-item">
									<a type="button" class="btn btn-dark m-2" href="classSubAddForm?cmcode=${classMain.cmCode }">강의영상 등록</a>
								</li>
								<li class="nav-item">
									<a type="button" class="btn btn-warning m-2" href="classMainModForm?cmNo=${classMain.cmNo }&cmcode=${classMain.cmCode }">수정</a>
								</li>
								<li class="nav-item">
									<a type="button" class=" btn btn-danger m-2" data-bs-toggle="modal" data-bs-target="#myModal">삭제</a>
								</li>
							</ul>
				 		</div>
		 			</c:if>
			 	</div>
			</div>
		 </div> 
		<input type="hidden" id="recommendCode" value="${classMain.cmCode }"><!-- 추천 -->
		<input type="hidden" id="data-area" class="data-area" value=""><!-- url -->
		<div class="row">
			<div class="col-9">
				<iframe width="950" height="480" src="https://www.youtube.com/embed/${cmVideo }" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				<strong><div class="fs-3" >${classMain.cmContent }</div></strong>
			</div>
			<!-- 구매했을 경우  -->
			<c:if test="${payChk == 'Y'}">
			<div class=" col-lg-3 order-md-last ">
				<ul class="list-group mb-3 shadow p-3 mb-5 bg-body rounded">
					<li class="list-group-item d-flex justify-content-between lh-sm ">
						<div class="row">
							<div>
								<strong class="my-0"><h2>${classMain.cmPrice }원</h2></strong>
								<p class="text-muted fs-4">${classMain.cmPrice/5 }원/ ${classMain.cmPeriod}개월</p>
							</div>
							<div class="d-grid gap-3">
								<a class="btn btn-outline-success" type="button" href="classSubList?cmcode=${classMain.cmCode }">수강하기</a>
							</div>
							<div class="button-group-center">
								<a type="button" class="btn btn-link" id="recommend1">
									<c:if test="${rcdChk == 'Y' }">
										<i class="bi bi-suit-heart-fill" id="biHeart1"></i>
									</c:if>
									<c:if test="${rcdChk == 'N' }">
										<i class="bi bi-heart" id="biHeart1"></i>
									</c:if>
									<c:if test="${empty rcdChk }">
										<i class="bi bi-heart" id="biHeart2"></i>
									</c:if>
								 </a>
								<a type="button" class="btn btn-default bi bi-share" id="data-copy1"><span class="glyphicon glyphicon-share-alt"></span></a>
							</div>
						</div>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm bg-info bg-opacity-10">
						<div>
							<p>채널명 : ${classMain.cmName }<p>
							<p>수강기간: ${classMain.cmPeriod} 개월</p>
						</div>
					</li>
				</ul>
			</div>
		</c:if>
		
		<!--  구매하지 않았을경우 -->
		<c:if test="${payChk == 'N'}">
			<div class=" col-lg-3 order-md-last">
				<ul class="list-group mb-3">
					<li class="list-group-item d-flex justify-content-between lh-sm" >
						<div class="row">
							<div>
								<strong class="my-0"><h2>${classMain.cmPrice }원</h2></strong>
								<p class="text-muted fs-4">${classMain.cmPrice/5 }/ ${classMain.cmPeriod}개월</p>
							</div>
							<div class="d-grid gap-3">
								<a class="btn btn-outline-success bg-opacity-50" type="button" href="payAddForm?cmcode=${classMain.cmCode }">결재하기</a>
								<c:if test="${baChk == 'N' }">
								<a class="btn btn-outline-primary bg-opacity-50" type="button" href="basketAdd?cmNo=${classMain.cmNo }&cmcode=${classMain.cmCode }">장바구니</a>
								</c:if>
							</div>
							<div class="button-group-center">
								<a type="button" class="btn btn-link" id="recommend2">
									<c:if test="${rcdChk == 'Y' }">
										<i class="bi bi-suit-heart-fill" id="biHeart2"></i>
									</c:if>
									<c:if test="${rcdChk == 'N' }">
										<i class="bi bi-heart" id="biHeart2"></i>
									</c:if>
									<c:if test="${empty rcdChk }">
										<i class="bi bi-heart" id="biHeart2"></i>
									</c:if>
								</a>
								<a type="button" class="btn btn-default bi bi-share" id="data-copy2"><span class="glyphicon glyphicon-share-alt"></span></a>
							</div>
						</div>
					</li>
					<li class="list-group-item d-flex justify-content-between lh-sm bg-info bg-opacity-10">
						<div>
							<p>채널명 : ${classMain.cmName }<p>
							<p>수강기간: ${classMain.cmPeriod}개월</p>
						</div>
					</li>
				</ul>
			</div>
		</c:if>
		</div>
	</div>
</div>


<div class="modal fade" id="myModal" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true" role="dialog" tabindex="-1">
    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header bg-dark text-white">
          <h4 class="modal-title"><i class="bi bi-exclamation-circle"></i>&nbsp;&nbsp;강의 삭제</h4>
          <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
        </div>
        
        <!-- Modal body -->
        <div class="modal-body text-center">
        	<i class="bi bi-exclamation-circle-fill"></i> &nbsp;&nbsp;' ${classMain.cmTitle} ' 을(를) 삭제 하시겠습니까?
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	<a href="classMainDelete?cmNo=${classMain.cmNo }&cmcode=${classMain.cmCode }" class="btn btn-danger">삭제하기</a>
         	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
        </div>
        
      </div>
    </div>
</div>

<script src="resources/js/classMainDetail.js"></script>
