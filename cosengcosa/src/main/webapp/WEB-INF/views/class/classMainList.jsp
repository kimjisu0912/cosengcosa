<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 	<!-- content -->
<div class="row py-2">
	<div class="col">
		<div class="row">
			<div class="py-2 text-center">
				<h2><span class=" col-12 bg-light">강의 리스트</span></h2>
			</div>
	
			<!-- 검색 요청인 경우 출력 -->
			<c:if test="${searchOption }" >
				<div class="row">
					<div class="col-6 text-start">
						<a href="classMainList" class="btn btn-outline-dark">강의 리스트</a>
					</div>
					<div class="col-6 text-end">
						<c:if test="${sessionScope.member.id =='admin'}">
							<a href="classMainInsert" class="btn btn-dark">강의 등록</a>
						</c:if>
					</div>
				</div>
			</c:if>
			<!-- 일반 요청인 경우 -->
			<c:if test="${not searchOption }" >
				<div class="row">
					<div class="col text-end">
						<c:if test="${sessionScope.member.id =='admin'}">
							<a href="classMainInsert" class="btn btn-dark" >강의등록</a>
						</c:if>
					</div>
				</div>
			</c:if>
			
			<div class="py-3">
				<form name="searchForm" id="searchForm" class="row justify-content-center"><!-- text-center 않되서 수직정렬로 가운데 정렬함 -->
					<div class="col-auto">
						<select name="type" class="form-select">
							<option value="cmname">강의제목</option>
							<option value="cmcode">과목</option> 
							<option value="content">내용</option>
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
						" ${keyword }" 검색결과
						</div>
					</div>
				</c:if>
			</div>
			
			
		<table class="table my-3  table-hover">
			<!-- 검색요청에서 게시글이 있는 경우 -->
			<c:if test="${searchOption and not empty classMainList }">
				<c:forEach var="c" items="${classMainList }" varStatus="status">
					<div class="col-md-4 col-lg-3 order-md-last ">
						<div class="card shadow-sm m-2">
							<div class="card-body" style="weight:150px; height:450px;">
								<div class="row">
									<img src="http://img.youtube.com/vi/${c.csVideo }/mqdefault.jpg"></img>
								</div>
								<div class="my-3">
									<a href="classMainDetail?cmNo=${c.cmNo }&cmCode=${c.cmCode }&pageNum=${currentPage}&type=${type}&keyword=${keyword}">${c.cmTitle }</a>
									<div>영상제공자 : ${c.cmName }</div>
									<div>가격 : ${c.cmPrice }</div>
									<div>평점 : ${c.cmStar }</div>
								</div>
							</div>
			            </div>
					</div>
				</c:forEach>
			</c:if>
			
			<!-- 일반요청에서 게시글이 있는 경우 -->
			<c:if test="${not searchOption and not empty classMainList }">
				<c:forEach var="c" items="${classMainList }" varStatus="status">
					<div class="col-md-4 col-lg-3 order-md-last ">
						<div class="card shadow-sm m-2">
							<div class="card-body" style="weight:150px; height:320px;">
								<div class="row">
									<img src="http://img.youtube.com/vi/${c.csVideo }/mqdefault.jpg"></img>
								</div>
								<div class="my-3">
			 						<a href="classMainDetail?cmNo=${c.cmNo }&cmCode=${c.cmCode }&pageNum=${currentPage}">${c.cmTitle }</>
			 						<div>영상제공자 : ${c.cmName }</div>
			 						<div>가격 : <fmt:formatNumber type="number" maxFractionDigits="3" value="${c.cmPrice/5 }"/></div>
			 						<div>평점 : ${c.cmStar }</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			
	<!-- 검색요청에서 게시 글이 없는 경우 (검색요청이면서 게시글이 없는경우) -->
			<c:if test="${searchOption and empty classMainList }">
				<div>
					<a colspan="5">${keyword}가 포함된 게시 글이 존재하지 않습니다.</a>
				<div>
			</c:if>
	<!-- 일반요청에서 게시 글이 없는 경우 -->
			<c:if test="${not searchOption and empty classMainList }">
				<div>
					<a colspan="5">게시 글이 존재하지 않습니다.</a>
				</div>
			</c:if>
		</table>
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
	</div>
</div><!-- end global content -->
