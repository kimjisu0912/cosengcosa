<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 	<!-- content -->
 <div class="row" id="global-content">
 	<div class="row my-5 text-center">
 		<div class="col">
 			<h2 class="fs-3 fw-bold">강의보기 리스트</h2>
 		</div>
 	</div>
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
				<c:forEach var="c" items="${csList }">
					<tr class="table-light">
						<td>${c.csNo }</td>
						<td><a href="#" data-bs-toggle="modal" data-bs-target="#myModal${c.csNo }">${c.csTitle }</a></td>
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
 
 <!-- model -->
 <c:forEach var="c" items="${csList }">
	 <div class="modal fade" id="myModal${c.csNo}" data-bs-backdrop="static" data-bs-keyboard="false">
	    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header bg-dark text-white">
	          <h4 class="modal-title">${c.csNo}강 ${c.csTitle }</h4>
	          <button type="button" class="close" data-bs-dismiss="modal">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body text-center">
	        	<div class="row">
	        		<div class="col">
	         			<iframe width="720" height="480" src="https://www.youtube.com/embed/${c.csVideo }" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
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
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        </div>
	        
	      </div>
	    </div>
	</div> 
</c:forEach>