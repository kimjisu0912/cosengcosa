<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">지식공유</h2>
			</div>
		</div>  		
		<form name="searchForm" id="searchForm" action="#" 
			class="row justify-content-center my-3">
			<div class="col-auto">
				<select name="type" class="form-select">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
				</select>
			</div>
			<div class="col-4">
				<input type="text" name="keyword" class="form-control"/>
			</div>
			<div class="col-auto">
				<input type="submit" value="검 색" class="btn btn-primary"/>
			</div>
		<c:if test="${ not searchOption }">
				<div class="col-auto text-end">
					<a href="writeForm" class="btn btn-outline-success">글쓰기</a>
				</div>
		</c:if>
		</form>
			
		<!-- 검색 요청일 경우 아래를 화면에 표시 -->	
		<c:if test="${ searchOption }">			
			<div class="row my-3">
				<div class="col text-center">
					"${ keyword  }" 검색 결과
				</div>
			</div> 
			
			<%-- 검색 요청일 경우 일반 게시 글 리스트로 이동할 수 있도록 링크를 설정했다. --%>
			<div class="row my-3">
				<div class="col-6">
					<a href="studyList" class="btn btn-outline-success">리스트</a>
				</div>
				<div class="col-6 text-end">
					<a href="writeForm" class="btn btn-outline-success">글쓰기</a>
				</div>
			</div>
		</c:if>
		
		<!-- 검색 요청이 아닐 경우 아래를 화면에 표시 -->
		
		<div class="row my-3">
				
				
				
				
					<%-- 
						검색 요청 이면서 검색된 리스트가 존재할 경우
						게시 글 상세보기로 링크를 적용할 때 type과 keyword 
						파라미터를 적용해 링크를 설정한다. 
					--%>	
						<c:if test="${ searchOption and not empty studyList }">
							<c:forEach var="s" items="${studyList}" varStatus="status">
								<div class="row  justify-content-center">
										<div class="inline-block col-8 my-3  shadow border-bottom border-info" style="height: 150px;">
											<div>
												<div><a class=" text-reset text-decoration-none" href="studyDetail?no=${s.sNo}&pageNum=${currentPage}
												&type=${ type }&keyword=${ keyword }" ><span class="fw-bold fs-4">${ s.sTitle }</span></a></div>
												<div><span class="fw-bold fs-6">오류코드 : </span>${ s.sError }</div>
												<div><span class="fw-lighter fs-8">${ s.sAskid } ${ s.sCdate } ${ s.sCount } ${ s.sRecommend }</span></div>
											</div>
										</div>
								</div>
							</c:forEach>
						</c:if>
					
					
					<%-- 
						일반 게시 글 리스트 요청 이면서 게시 글 리스트가 존재할 경우
						게시 글 상세보기로 링크를 적용할 때 type과 keyword 
						파라미터는 필요 없다. 
					--%>
						<c:if test="${ not searchOption and not empty studyList }">
							<c:forEach var="s" items="${studyList}" varStatus="status">
								<div class="row  justify-content-center">
										<div class="inline-block col-8 my-3  shadow border-bottom border-info" style="height: 150px;">
											<div>
												<div><a class=" text-reset text-decoration-none" href="studyDetail?no=${s.sNo}&pageNum=${currentPage}" ><span class="fw-bold fs-4">${ s.sTitle }</span></a></div>
												<div class="mt-2"><span class="fw-bold fs-6">오류코드 : </span>${ s.sError }</div>
												<div class="mt-5"><span class="fw-lighter fs-8">${ s.sAskid } ${ s.sCdate } ${ s.sCount } ${ s.sRecommend }</span></div>
											</div>
										</div>
								</div>
								<!-- <div class="col"></div> -->
							</c:forEach>
						</c:if>
					
					<%-- 검색 요청이면서 검색된 리스트가 존재하지 않을 경우 --%>
					<c:if test="${ searchOption and empty studyList }">
						<tr>
							<td colspan="5" class="text-center">
								"${ keyword }"가 포함된 게시 글이 존재하지 않습니다.
							</td>
						</tr>
					</c:if>
					
					<%-- 일반 게시 글 리스트 요청이면서 게시 글 리스트가 존재하지 않을 경우 --%>
					<c:if test="${ not searchOption and empty studyList }">
						<tr>
							<td colspan="5" class="text-center">게시 글이 존재하지 않습니다.</td>
						</tr>
					</c:if>
		</div>
		
		<!-- 검색 안했을 때 페이징 -->
		<c:if test="${ not searchOption and not empty studyList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
						
							<c:if test="${ startPage > pageGroup }">
								<li class="page-item">
									<a class="page-link" href="studyList?pageNum=${ startPage - pageGroup }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
							
					    <c:forEach var="i" begin="${ startPage }" end="${ endPage }">
					    	<c:if test="${ i == currentPage }">
								<li class="page-item"><a class="page-link active" aria-current="page" >${i}</a></li>
					    	</c:if>
					    	<c:if test="${ i != currentPage }">
								<li class="page-item"><a class="page-link" href="studyList?pageNum=${ i }">${i}</a></li>
					    	</c:if>
					    </c:forEach>
					    	
					    	<c:if test="${ endPage < pageCount }">
								<li class="page-item">
									<a class="page-link" href="studyList?pageNum=${ startPage + pageGroup }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
					    	</c:if>
					      
					    
						</ul>
					</nav>				
				</div>
			</div>
		</c:if>
		
		<!-- 검색 했을 때 페이징 -->
		<c:if test="${ searchOption and not empty studyList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
						<ul class="pagination justify-content-center">
						
							<c:if test="${ startPage > pageGroup }">
								<li class="page-item">
									<a class="page-link" href="studyList?pageNum=${ startPage - pageGroup }&type=${ type }&keyword=${ keyword }" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
									</a>
								</li>
							</c:if>
							
					    <c:forEach var="i" begin="${ startPage }" end="${ endPage}">
					    	<c:if test="${ i == currentPage }">
								<li class="page-item"><a class="page-link active" aria-current="page" >${i}</a></li>
					    	</c:if>
					    	<c:if test="${ i != currentPage }">
								<li class="page-item"><a class="page-link" href="studyList?pageNum=${ i }&type=${ type }&keyword=${ keyword }">${i}</a></li>
					    	</c:if>
					    </c:forEach>
					    	
					    	<c:if test="${ endPage < pageCount  }">
								<li class="page-item">
									<a class="page-link" href="studyList?pageNum=${ startPage + pageGroup }&type=${ type }&keyword=${ keyword }" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
					    	</c:if>
					      
					    
						</ul>
					</nav>				
				</div>
			</div>
		</c:if>

	</div>				
</div>

