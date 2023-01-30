<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- content -->
<div class="row my-5 " id="global-content">
	<div class="col">
		<form name="checkForm" id="checkForm">
			<input type="hidden" name="sno" id="sno" value="${study.sNo }"/>
			<input type="hidden" name="pageNum" value="${ pageNum }" />
			<input type="hidden" name="memberId" id="memberId" value="${ member.id }" />
			<input type="hidden" name="sAskimg" id="sAskimg" value="${ study.sAskimg }" />
			<input type="hidden" name="sFile" id="sFile" value="${ study.sFile }" />

			<%-- 
				검색 리스트에서 들어온 요청일 경우 다시 keyword에 해당하는 
				검색 리스트로 돌려보내기 위해서 아래의 파라미터가 필요하다.
			 --%>
			<c:if test="${ searchOption }">
				<input type="hidden" name="type" value="${ type }" />
				<input type="hidden" name="keyword" value="${ keyword }" />
			</c:if>			
		</form>
		
		<div class="row justify-content-center">
			<div class="col"></div>
			
			<div class="col-8">
				<div class="border-bottom border-info">
					<div class="fs-3">${ study.sTitle }</div>
					<div class="my-2 ">${ study.sAskid }</div>
					<div class="my-2 ">작성일 <fmt:formatDate value="${ study.sCdate }" pattern="yyyy-MM-dd"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${ study.sCount } 
					&nbsp;&nbsp; 추천수 ${ study.sRecommend }</div>
				</div>
				<div style="height: 500px;">
					<div class="mt-4">오류코드 : ${ study.sError }</div>
					<div class="mt-3"><pre class="text-wrap">${ study.sAskcontent }</pre></div>
				</div>
				<div class="border-bottom border-info"></div>
				<!-- 수정, 삭제, 목록 버튼  -->
				<div class="row my-3">
					<div class="col text-center">			
						<c:if test='${ study.sAskid == sessionScope.member.id || member.grant == "A"}'>
							<input class="btn btn-warning" type="button" id="detailUpdate1" value="수정하기"/>
							&nbsp;&nbsp;<input class="btn btn-danger"  type="button" id="detailDelete1" value="삭제하기" />				
						</c:if>
						<%-- 
							일반 게시 글 리스트에서 온 요청이면 일반 게시 글 리스트로 돌려 보낸다. 
						--%>
						<c:if test="${ not searchOption }">	
						&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
								onclick="location.href='studyList?pageNum=${pageNum}'"/>
						</c:if>
						<%-- 
							검색 리스트에서 온 요청이면 검색 리스트의 동일한 페이지로 돌려보낸다. 
						--%>
						<c:if test="${ searchOption }">	
						&nbsp;&nbsp;<input class="btn btn-primary" type="button" value="목록보기" 
								onclick="location.href='studyList?pageNum=${pageNum}&type=${ type }&keyword=${ keyword }'"/>
						</c:if>
						
					</div>
				</div>
			
			
			<!-- 댓글 -->
			<c:if test='${ member.grant == "T" || member.grant == "A" }'>
			
			
			<div class="row  justify-content-center">
				<div class="replyHeader">
				<div id="recommend" class="col text-center">
					<span id="replyWrite" class="fs-5 fw-bold">
						&nbsp;댓글쓰기
					</span>	
					
					<div id="replyForm" >
						<form name="replyWriteForm" id="replyWriteForm" >				
							<input type="hidden" name="saNum" id="saNum" value="${ study.sNo }"/>
							<input type="hidden" name="saAnswerid" id="saAnswerid"
								value="${ member.id }" />			
							<div id="replyWriteTable">
								<div class="row  justify-content-center">
									<div id="replyWriteContent" class="col text-center">
										<textarea name="saAnswer" id="saAnswer" rows="4" cols="65"></textarea>
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
			
			</c:if>
			
			<div class="bg-light rounded my-4" >
			<div id="replyTitle"><span class="fw-bold fs-4">댓글</span></div>
			<c:if test="${ empty answerList }" >
			<div id="replyList">
				<div>
				<div id="notReply">
					이 게시 글에 대한 댓글이 존재하지 않습니다.  
				</div>			
				</div>
			</div>
			</c:if>
			<c:if test="${ not empty answerList }" >
			<div id="replyList">
				<div>		
				<div id="replyTable">
					<c:forEach var="answer" items="${ answerList }" >
					<div id="reply_${ answer.saNo }">
						<div>									
						<div class="replyUser">						
							<span class="member fs-5" id="member">${ answer.saAnswerid }</span>	
						</div>
						<div class="replyModify">
							<span class="reply_date">
								<fmt:formatDate value="${ answer.saCdate}" 
									pattern="yyyy-MM-dd HH:mm:ss" /></span>
							<c:if test='${ (member.id == answer.saAnswerid && member.grant == "T") || member.grant == "A" }'>
								<a href="#" class="modifyReply" data-no="${ answer.saNo }">
									<img src="resources/images/reply_btn_modify.gif" alt="댓글 수정하기"/></a>
								<a href="#" class=deleteReply data-no="${ answer.saNo }">
									<img src="resources/images/reply_btn_delete.gif" alt="댓글 삭제하기"/></a>
							</c:if>
						</div>	
						<div class="replyContent" id="div_${ answer.saNo }">
							<pre><span class="fs-5">${ answer.saAnswer }</span></pre>
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
			
			
			
			
			
			
			
			
			<!-- 추천, 이미지, 파일 버튼 -->
			<div class="col">
				<button type="button" class="btn btn-danger"  id="Commend" ><i class="bi bi-suit-heart"></i></button>
				<c:if test="${ not empty study.sAskimg }">
					
					<!-- Button trigger modal -->
				<input type="button" class="btn  btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal" value="이미지">
				
				<!-- Modal -->
				<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
				  <div class="modal-dialog modal-lg ">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h1 class="modal-title fs-5" id="exampleModalLabel">오류 이미지</h1>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        <img src="resources/upload/${ study.sAskimg }" style="width: 766px; height: auto;">
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				      </div>
				    </div>
				  </div>
				</div>
				</c:if>
				<c:if test="${ not empty study.sFile }">
					<input type="button" class="btn btn-primary" value="파일" 
					onclick="location.href='resources/upload/${ study.sFile }'" />
				</c:if>
			</div>
		</div>
		
	</div>	
</div>
<script src="resources/js/reply.js"></script>
<script src="resources/js/boardCheck.js"></script>