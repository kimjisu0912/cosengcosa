<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">자유게시판</h2>
			</div>
		</div>  		
		<form name="searchForm" id="searchForm" action="#" 
			class="row justify-content-center my-3">
			<div class="col-auto">
				<select name="type" class="form-select">
					<option value="title">제목</option>
					<option value="writer">작성자</option>
					<option value="content">내용</option>
				</select>
			</div>
			<div class="col-4">
				<input type="text" name="keyword" class="form-control"/>
			</div>
			<div class="col-auto">
				<input type="submit" value="검 색" class="btn btn-primary"/>
			</div>
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
					<a href="freeBoardList" class="btn btn-outline-success">리스트</a>
				</div>
				<div class="col-6 text-end">
					<a href="writefreeBoardForm" class="btn btn-outline-success">글쓰기</a>
				</div>
			</div>
		</c:if>
		
		<!-- 검색 요청이 아닐 경우 아래를 화면에 표시 -->
		<c:if test="${ not searchOption }">
			<div class="row my-3">
				<div class="col text-end">
					<a href="writefreeBoardForm" class="btn btn-outline-success">글쓰기</a>
				</div>
			</div>
		</c:if>
		
		<div class="row my-3">
			<div class="col">
				<table class="table table-hover">
					<thead>
						<tr class="table-dark">
					<th>NO</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>		
					</thead>
					<tbody class="text-secondary">
					<%-- 
						검색 요청 이면서 검색된 리스트가 존재할 경우
						게시 글 상세보기로 링크를 적용할 때 type과 keyword 
						파라미터를 적용해 링크를 설정한다. 
					--%>	
					<c:if test="${ searchOption and not empty freeBoardList }">
						<c:forEach var="f" items="${freeBoardList}" varStatus="status">
						<tr>
							<td>${ f.fNo }</td>
							<td>
								<a href="freeBoardDetail?fno=${f.fNo}&pageNum=${currentPage}
								&type=${ type }&keyword=${ keyword }" 
								class="text-decoration-none link-secondary">${ f.fTitle }</a>
							</td>
							<td>${ f.fWriter }</td>
							<td>${ f.fCdate }</td>
						</tr>
						</c:forEach>
					</c:if>
					
					<%-- 
						일반 게시 글 리스트 요청 이면서 게시 글 리스트가 존재할 경우
						게시 글 상세보기로 링크를 적용할 때 type과 keyword 
						파라미터는 필요 없다. 
					--%>
					<c:if test="${ not searchOption and not empty freeBoardList }">
						<c:forEach var="f" items="${freeBoardList}" varStatus="status">
						<tr>
							<td>${ f.fNo }</td>
							<td>
								<a href="freeBoardDetail?fno=${f.fNo}&pageNum=${currentPage}
								&type=${ type }&keyword=${ keyword }" 
								class="text-decoration-none link-secondary">${ f.fTitle }</a>
							</td>
							<td>${ f.fWriter }</td>
							<td>${ f.fCdate }</td>
						</tr>
						</c:forEach>
					</c:if>
					
					<%-- 일반 게시 글 리스트 요청이면서 게시 글 리스트가 존재하지 않을 경우 --%>
					<c:if test="${ not searchOption and empty freeBoardList }">
						<tr>
							<td colspan="5" class="text-center">게시 글이 존재하지 않습니다.</td>
						</tr>
					</c:if>
					</tbody>					
				</table>
			</div>			
		</div>
		
		<!-- 검색 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
		<c:if test="${ searchOption and not empty freeBoardList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					  	<%--
						/* 현재 페이지 그룹의 시작 페이지가 pageGroup보다 크다는 것은
						 * 이전 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
						 * pageGroup을 마이너스 하여 링크를 설정하면 이전 페이지 그룹의
						 * startPage로 이동할 수 있다.
					 	 **/
					 	 --%>
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="freeBoardList?pageNum=${ startPage - pageGroup }
						      &type=${ type }&keyword=${ keyword }">Pre</a>
						    </li>
					    </c:if>
					    
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					    	<c:if test="${i == currentPage }">
					    	<li class="page-item active" aria-current="page">
					    		<span class="page-link">${i}</span>
					    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item">
						    		<a class="page-link" href="freeBoardList?pageNum=${ i }&type=${ type }&keyword=${ keyword }">${i}</a>
						    	</li>
						    </c:if>					    
					    </c:forEach>
					    
					    <%-- 
						/* 현재 페이지 그룹의 마지막 페이지가 전체 페이지 보다 작다는 것은
						 * 다음 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
						 * pageGroup을 플러스 하여 링크를 설정하면 다음 페이지 그룹의
						 * startPage로 이동할 수 있다.
					 	 **/
					 	 --%>
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="freeBoardList?pageNum=${ startPage + pageGroup }
						      &type=${ type }&keyword=${ keyword }">Next</a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</c:if>
		
		<!-- 일반 게시글 요청이면서 검색된 리스트가 존재할 경우 페이지네이션  -->
		<c:if test="${ not searchOption and not empty freeBoardList }">
			<div class="row">
				<div class="col">
					<nav aria-label="Page navigation">
					  <ul class="pagination justify-content-center">
					  	<%--
						/* 현재 페이지 그룹의 시작 페이지가 pageGroup보다 크다는 것은
						 * 이전 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
						 * pageGroup을 마이너스 하여 링크를 설정하면 이전 페이지 그룹의
						 * startPage로 이동할 수 있다.
					 	 **/
					 	 --%>
					  	<c:if test="${ startPage > pageGroup }">
						    <li class="page-item">
						      <a class="page-link" href="freeBoardList?pageNum=${ startPage - pageGroup }">Pre</a>
						    </li>
					    </c:if>
					    
					    <c:forEach var="i" begin="${startPage}" end="${endPage}">
					    	<c:if test="${i == currentPage }">
					    	<li class="page-item active" aria-current="page">
					    		<span class="page-link">${i}</span>
					    	</li>
					    	</c:if>
					    	<c:if test="${i != currentPage }">
						    	<li class="page-item"><a class="page-link" href="freeBoardList?pageNum=${ i }">${i}</a></li>
						    </c:if>					    
					    </c:forEach>
					    
					    <%-- 
						/* 현재 페이지 그룹의 마지막 페이지가 전체 페이지 보다 작다는 것은
						 * 다음 페이지 그룹이 존재한다는 것으로 현재 페이지 그룹의 시작 페이지에
						 * pageGroup을 플러스 하여 링크를 설정하면 다음 페이지 그룹의
						 * startPage로 이동할 수 있다.
					 	 **/
					 	 --%>
						<c:if test="${ endPage < pageCount }">
						    <li class="page-item">
						      <a class="page-link" href="freeBoardList?pageNum=${ startPage + pageGroup }">Next</a>
						    </li>
					  	</c:if>
					  </ul>
					</nav>
				</div>
			</div>
		</c:if>
		
	</div>
</div>
