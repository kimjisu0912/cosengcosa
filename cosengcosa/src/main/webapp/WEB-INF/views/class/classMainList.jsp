<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 	<!-- content -->
 <div class="row" id="global-content">
 	<div class="row my-5 text-center">
 		<div class="col">
 			<h2 class="fs-3 fw-bold">강의 리스트</h2>
 		</div>
 	</div>
 	
	 		<form name="searchForm" id="searchForm" class="row justify-content-center"><!-- text-center 않되서 수직정렬로 가운데 정렬함 -->
	 			<div class="col-auto">
					<select name="type" class="form-select">
						<option value="cmname">강의제목</option>
						<!-- <option value="cmcode">과목</option> -->
						<!-- <option value="content">내용</option> -->
					</select>
				</div>
				<div class="col-4">
					<input type="text" name="keyword" class="form-control" />
				</div>
				<div class="col-auto">
					<input type="submit" value="검색" class="btn btn-primary" />
				</div>
			</form>
			<!-- 검색 요청일때만 출력 -->
			<c:if test="${searchOption}">
				<div class="row my-3">
					<div	class="col text-center">
					" ${keyword } " 검색결과
					</div>
				</div>
			</c:if>

 	<!-- 검색 요청인 경우 출력 -->
 	<c:if test="${searchOption }" >
 	<div class="row">
 		<div class="col-6 text-start">
 			<a href="classMainList" class="btn btn-outline-success">강의 리스트</a>
 		</div>
 		<div class="col-6 text-end">
 			<a href="writeForm" class="btn btn-outline-success">글쓰기</a>
 		</div>
 	</div>
 	</c:if>
 	
 	<!-- 일반 요청인 경우 -->
 	<c:if test="${not searchOption }" >
	 	<div class="row">
	 		<div class="col text-end">
	 			<a href="writeForm" class="btn btn-outline-success">글쓰기</a>
	 		</div>
	 	</div>
 	</c:if>
 	
 	<div class="row">
 		<div class="col">
 			<table class="table my-3  table-hover">
 				<thead>
 					<tr class="table-dark">
						<th>NO</th>
						<th>강의제목</th>
						<th>가격</th>
						<th>별점</th>
					</tr>
 				</thead>
 				<tbody>
 					<!-- 검색 요청에서 게시 글이 있는 경우 -->
 					<c:if test="${searchOption and not empty classMainList }">
 						<c:forEach var="c" items="${classMainList }">
 							<tr class="table-light">
 								<td>${c.cmNo }</td>
 								<td><a href="classMainDetail?cmNo=${c.cmNo }&pageNum=${currentPage}&type=${type}&keyword=${keyword}">${c.cmTitle }</a></td>
 								<td>${c.cmPrice }</td>
 								<td>${c.cmStar }</td>
 							</tr>
 						</c:forEach>
 					</c:if>
 					
 					<!-- 일반 요청에서 게시 글이 있는 경우 -->
 					<c:if test="${not searchOption and not empty classMainList }">
 						<c:forEach var="c" items="${classMainList }">
 							<tr class="table-light">
 								<td>${c.cmNo }</td>
 								<td><a href="classMainDetail?cmNo=${c.cmNo }&pageNum=${currentPage}">${c.cmTitle }</a></td>
 								<td>${c.cmPrice }</td>
 								<td>${c.cmStar }</td>
 							</tr>
 						</c:forEach>
 					</c:if>
 					<!-- 검색요청에서 게시 글이 없는 경우 (검색요청이면서 게시글이 없는경우) -->
 					<c:if test="${searchOption and empty classMainList }">
 						<tr>
 							<td colspan="5">${keyword }가 포함된 게시 글이 존재하지 않습니다.</td>
 						</tr>
 					</c:if>
 					
 					<!-- 일반요청에서 게시 글이 없는 경우 -->
 					<c:if test="${not searchOption and empty classMainList }">
 						<tr>
 							<td colspan="5">게시 글이 존재하지 않습니다.</td>
 						</tr>
 					</c:if>
 				</tbody>
 			</table>
 		</div>
 	</div>
 	<!-- pageing -->
 	<div class="row mt-3">
 		<div class="col">
 		
 		<!-- 검색 요청인 경우 -->
 		<c:if test="${searchOption and not empty classMainList }">
 		<nav aria-label="Page navigation">
			  <ul class="pagination justify-content-center">
			  <!-- 이전 페이지 그룹이 존재 -->
			  	<c:if test="${startPage > pageGroup }">
				    <li class="page-item">
				     	<a class="page-link" href="classMainList?pageNum=${startPage - pageGroup}&type=${type}&keyword=${keyword}">Prev</a>
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
				    		<a class="page-link" href="classMainList?pageNum=${i}&type=${type}&keyword=${keyword}">${i}</a>
				    	</li>
			    	</c:if>
				</c:forEach>
			    <!-- 다음 페이지 그룹이 존재 -->
			    <c:if test="${pageCount > endPage}">
				    <li class="page-item">
				     	<a class="page-link" href="classMainList?pageNum=${startPage+pageGroup}&type=${type}&keyword=${keyword}">Next</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
 		</c:if>
 		
 		<!-- 일반 요청인 경우 -->
 		<c:if test="${not searchOption and not empty classMainList }">
	 		<nav aria-label="Page navigation">
			  <ul class="pagination justify-content-center">
			  <!-- 이전 페이지 그룹이 존재 -->
			  	<c:if test="${startPage > pageGroup }">
				    <li class="page-item">
				     	<a class="page-link" href="classMainList?pageNum=${startPage - pageGroup}">Prev</a>
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
				    		<a class="page-link" href="classMainList?pageNum=${i}">${i}</a>
				    	</li>
			    	</c:if>
				</c:forEach>
			    <!-- 다음 페이지 그룹이 존재 -->
			    <c:if test="${pageCount > endPage}">
				    <li class="page-item">
				     	<a class="page-link" href="classMainList?pageNum=${startPage+pageGroup}">Next</a>
				    </li>
			    </c:if>
			  </ul>
			</nav>
		</c:if>
 		</div>
 	</div>
 </div><!-- end global content -->