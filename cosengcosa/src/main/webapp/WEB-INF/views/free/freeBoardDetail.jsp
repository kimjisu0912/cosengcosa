<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="fno" id="fno" value="${ freeBoard.fNo }"/>
			<input type="hidden" name="grant" id="grant" value="${ member.grant }" />
			<input type="hidden" name="pageNum" value="${ pageNum }" />
			<input type="hidden" name="answerInput" id="answerInput"  />

			<%-- 
				검색 리스트에서 들어온 요청일 경우 다시 keyword에 해당하는 
				검색 리스트로 돌려보내기 위해서 아래의 파라미터가 필요하다.
			 --%>
			<c:if test="${ searchOption }">
				<input type="hidden" name="type" value="${ type }" />
				<input type="hidden" name="keyword" value="${ keyword }" />
			</c:if>			
		</form>
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">게시 글 상세보기</h2>
			</div>
		</div> 
		<div class="row my-3">
			<div class="col">
				<table class="table table-bordered" >
					<tbody>					
						<tr>
							<th class="table-secondary">제 목</th>
							<td colspan="5">${ freeBoard.fTitle }</td>		
						</tr>
						<tr>
							<th>글쓴이</th>
							<td>${ freeBoard.fWriter }</td>
							<th>작성일</th>
							<td><fmt:formatDate value="${ freeBoard.fCdate }" 
								pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
						<tr>		
							<td colspan="6">
								<div style="height: 500px;"><pre>${ freeBoard.fContent }</pre></div>
							</td>
						</tr>	
					</tbody>
				</table>
			</div>
		</div>
		<div class="row my-3">
			<div class="col text-center">	
			<c:if test="${ not empty member.id }">
				<c:if test='${ freeBoard.fWriter == member.id || member.grant == "A"}'>			
					<input class="btn btn-warning" type="button" id="detailUpdate3" value="수정하기"/>
					&nbsp;&nbsp;<input class="btn btn-danger"  type="button" id="detailDelete3" value="삭제하기" />
				</c:if>
			</c:if>
				<%-- 
					일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. 
				--%>
				<c:if test="${ not searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href='freeBoardList?pageNum=${pageNum}'"/>
				</c:if>
				<%-- 
					검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. 
				--%>
				<c:if test="${ searchOption }">	
				&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
						onclick="location.href='freeBoardList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'"/>
				</c:if>
			</div>
		</div>
		
		
	</div>	
</div>
<script src="resources/js/boardCheck.js"></script>