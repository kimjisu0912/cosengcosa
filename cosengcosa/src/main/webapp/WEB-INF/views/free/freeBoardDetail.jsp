<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- content -->
<div class="row my-5 justify-content-center" id="global-content">
	<div class="col-auto"></div>
	<div class="col-8">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="fNo" id="fNo" value="${ freeBoard.fNo }"/>
			<input type="hidden" name="grant" id="grant" value="${ Session.member.grant }" />
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
				<table class="table table-bordered " >
					<tbody>					
						<tr>
							<th class="table-secondary">제 목</th>
							<td colspan="7" >${ freeBoard.fTitle }</td>		
						</tr>
						<tr>
							<th>글쓴이</th>
							<td>${ freeBoard.fWriter }</td>
							<th>작성일</th>
							<td><fmt:formatDate value="${ freeBoard.fCdate }" 
								pattern="yyyy-MM-dd" /></td>
							<th>조회수</th>
							<td>${ freeBoard.fCount}</td>
							<th>추천수</th>
							<td>${ freeBoard.fRecommend }</td>
						</tr>
						<tr>		
							<td colspan="8" >
								<div style="height: 500px;" >
									<div><pre >${ freeBoard.fContent }</pre></div>
								</div>
							</td>
						</tr>	     
					</tbody>
				</table>
			</div>
		</div>
		
		<div class="row my-3">
			<div class="col text-center">	
			<c:if test="${ not empty Session.member.id }">
				<c:if test='${ freeBoard.fWriter == Session.member.id || Session.member.grant == "A"}'>			
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
		
		<!-- 댓글 -->
		<div class="col"></div>
		
		
		<!-- 댓글 -->
			
			
			<div class="row  justify-content-center">
				<div class="replyHeader">
				<div id="recommend" class="col text-center">
					<span id="replyWrite" class="fs-5 fw-bold">
						&nbsp;댓글쓰기
					</span>	
					
					<div id="replyForm" >
						<form name="replyWriteForm" id="replyWriteForm" >				
							<input type="hidden" name="fcNum" id="fcNum" value="${ freeBoard.fNo }"/>
							<input type="hidden" name="fcWriter" id="fcWriter"
								value="${ Session.member.id }" />			
							<div id="replyWriteTable">
								<div class="row  justify-content-center">
									<div id="replyWriteContent" class="col text-center">
										<textarea name="fcContent" id="fcContent" rows="4" cols="65"></textarea>
									</div>
									<div class=" row  justify-content-center">
										<div id="replyWriteImage" class=" col-auto">						
											<input type="button" class="btn btn-info"
												id="replyWriteButton" value="댓글입력" />
										</div>
										<div id="replyUpdateImage" class="col-auto">						
											<input type="submit" class="btn btn-info"
												id="replyUpdateButton" value="댓글수정" />
										</div>
									</div>
								</div>
							</div>
						</form>	
					</div>	
				</div>
				</div>
			</div>
			
			
			<div class="bg-light rounded my-4" >
			<div id="replyTitle"><span class="fw-bold fs-4">댓글</span></div>
			<c:if test="${ empty freeBoardCmtList }" >
			<div id="replyList">
				<div>
				<div id="notReply">
					이 게시 글에 대한 댓글이 존재하지 않습니다.  
				</div>			
				</div>
			</div>
			</c:if>
			<c:if test="${ not empty freeBoardCmtList }" >
			<div id="replyList">
				<div>		
				<div id="replyTable">
					<c:forEach var="freeCmt" items="${ freeBoardCmtList }" >
					<div id="reply_${ freeCmt.fcNo }">
						<div>									
						<div class="replyUser">						
							<span class="member fs-5" id="member">${  freeCmt.fcWriter }</span>	
						</div>
						<div class="replyModify">
							<span class="reply_date">
								<fmt:formatDate value="${ freeCmt.fcCdate}" 
									pattern="yyyy-MM-dd HH:mm:ss" /></span>
							<c:if test='${ Session.member.id == freeCmt.fcWriter || Session.member.grant == "A" }'>
								<a href="#" class="modifyReply" data-no="${ freeCmt.fcNo  }">
									<img src="resources/images/reply_btn_modify.gif" alt="댓글 수정하기"/></a>
								<a href="#" class=deleteReply data-no="${ freeCmt.fcNo }">
									<img src="resources/images/reply_btn_delete.gif" alt="댓글 삭제하기"/></a>
							</c:if>
						</div>	
						<div class="replyContent" id="div_${ freeCmt.fcNo }">
							<pre><span class="fs-5">${ freeCmt.fcContent }</span></pre>
						</div>
						</div>
					</div>	
					</c:forEach>
				</div>				
				</div>
			</div>	
			</c:if>
			</div>	
			
		
	</div>	
		<div class="col-auto mt-4">
			<button type="button" class="btn btn-danger"  id="Commend" ><i class="bi bi-suit-heart"></i></button>
		</div>
</div>
<script src="resources/js/boardCheck.js"></script>
<script src="resources/js/replyFreeCmt.js"></script>