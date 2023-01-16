<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 	<!-- content -->
 <div class="row" id="global-content">
 	<div class="row my-5 text-center">
 		<div class="col">
 			<h2 class="fs-3 fw-bold">${sessionScope.member.id }님의 강의보기 리스트</h2>
 		</div>
 	</div>
 	<%-- <c:if test="${not searchOption }" > --%>
	 	<div class="row">
	 		<div class="col text-end">
	 			<c:if test="${sessionScope.member.id == 'admin' }">
	 				<a href="classSubAddFrom?cmcode=${cmcode}" class="btn btn-outline-success">강의등록</a>
	 			</c:if>
	 		</div>
	 	</div>
 	<%-- </c:if> --%>
 	<div class="row">
 		<div class="col">
 			<table class="table my-3  table-hover">
 				<thead>
 					<tr class="table-dark">
						<th>NO</th>
						<th>강의제목</th>
						<th>강의시간</th>
					</tr>
 				</thead>
 				<tbody>
 				<c:if test="${not empty csList }">
				<c:forEach var="c" items="${csList }" varStatus="status">
					<tr class="table-light">
						<td>${status.count }</td>
						<td><a href="#" data-bs-toggle="modal" data-bs-target="#myModal${status.count }" onclick="myModalkey('${status.count }')">${c.csTitle }</a></td>
						<td>${c.csRuntime }</td>
					</tr>
				</c:forEach>
				</c:if>
				<!-- 일반요청에서 게시 글이 없는 경우 -->
				<c:if test="${empty csList }">
					<tr>
						<td colspan="3">강의가 존재하지 않습니다.</td>
					</tr>
				</c:if>
 				</tbody>
 			</table>
 		</div>
 	</div>
 </div><!-- end global content -->
 <input type="hidden" id="reserveCount" value="${fn:length(csList)}" />
 <!-- model -->
 <c:forEach var="c" items="${csList }" varStatus="status">
	 <div class="modal fade" id="myModal${status.count }" data-bs-backdrop="static" data-bs-keyboard="false">
	    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header bg-dark text-white">
	          <h4 class="modal-title">${status.count }강 ${c.csTitle }</h4>
	          <button type="button" class="close" data-bs-dismiss="modal" onclick="onPlayerClose()">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body text-center">
	        	<div class="row">
	        		<div class="col">
	         			<iframe id="viewiframe${status.count }" width="720" height="480" src="https://www.youtube.com/embed/${c.csVideo }?enablejsapi=1" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
	        		</div>
	        	</div>
	        	<div class="row">
	        		<div class="col p-3">
	        			${c.csContent}
	        		</div>
	        	</div>
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" onclick="onPlayerClose()">Close</button>
	        </div>
	        
	      </div>
	    </div>
	</div> 
</c:forEach>
<script src="resources/js/iframeApi.js"></script>