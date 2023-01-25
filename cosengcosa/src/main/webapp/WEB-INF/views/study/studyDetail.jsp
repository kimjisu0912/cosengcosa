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
					<div class="my-2 ">작성일 ${ study.sCdate } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;조회수 ${ study.sCount } 
					&nbsp;&nbsp; 추천수 ${ study.sRecommend }</div>
				</div>
				<div style="height: 500px;">
					<div class="mt-4">오류코드 : ${ study.sError }</div>
					<div class="mt-3"><pre>${ study.sAskcontent }</pre></div>
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
			<table>
			<tr>
				<td colspan="4" class="replyHeader">
				<div id="recommend">
					<span id="replyWrite">
						&nbsp;댓글쓰기
					</span>	
					
					<div id="replyForm" >
						<form name="replyWriteForm" id="replyWriteForm">				
							<input type="hidden" name="saNum" id="saNum" value="${ study.sNo }"/>
							<input type="hidden" name="saAnswerid" id="saAnswerid"
								value="${ member.id }" />			
							<table id="replyWriteTable">
								<tr>
									<td id="replyWriteTitle" colspan="2">
										<span>악의적인 댓글은 예고 없이 삭제될 수 있으며 글쓰기 제한과 아이디 삭제 처리됩니다.</span>
									</td>
								</tr>
								<tr>
									<td id="replyWriteContent">
										<textarea name="saAnswer" id="saAnswer" rows="4" cols="65"></textarea>
									</td>
									<td id="replyWriteImage">						
										<input type="button" class="btn btn-info"
											id="replyWriteButton" value="댓글입력" />
									</td>
									<td id="replyUpdateImage">						
										<input type="submit" class="btn btn-info"
											id="replyUpdateButton" value="댓글수정" 0/>
									</td>
								</tr>
							</table>
						</form>	
					</div>	
			
			
				</div>
				<div id="replyTitle"><h3>댓글</h3></div>
				</td>
			</tr>
			<c:if test="${ empty answerList }" >
			<tr id="replyList">
				<td colspan="4">
				<div id="notReply">
					이 게시 글에 대한 댓글이 존재하지 않습니다.  
				</div>			
				</td>
			</tr>
			</c:if>
			<c:if test="${ not empty answerList }" >
			<tr id="replyList">
				<td colspan="4">		
				<table id="replyTable">
					<c:forEach var="answer" items="${ answerList }" >
					<tr id="reply_${ answer.saNo }">
						<td>									
						<div class="replyUser">						
							<span class="member">${ answer.saWriter  }</span>	
						</div>
						<div class="replyModify">
							<span class="reply_date">
								<fmt:formatDate value="${ answer.saCdate}" 
									pattern="yyyy-MM-dd HH:mm:ss" /></span>
							<a href="#" class="modifyReply" data-no="${ answer.saNo }">
								<img src="resources/images/reply_btn_modify.gif" alt="댓글 수정하기"/></a>
							<a href="#" class=deleteReply data-no="${ answer.saNo }">
								<img src="resources/images/reply_btn_delete.gif" alt="댓글 삭제하기"/></a>
							<a href="javascript:reportReply('${ answer.saNo }')">
								<img src="resources/images/reply_btn_notify.gif" alt="신고하기"/></a>
						</div>	
						<div class="replyContent" id="div_${ answer.saNo }">
							<pre><span>${ answer.saAnswer }</span></pre>
						</div>
						</td>
					</tr>	
					</c:forEach>
				</table>				
				</td>
			</tr>	
			</c:if>
			</table>	
			
			
			
			
			</div>	
			
			<!-- 추천, 이미지, 파일 버튼 -->
			<div class="col">
				<input type="button" class="btn btn-primary" value="추천" id="Commend" />
				<c:if test="${ not empty study.sAskimg }">
					<input type="button" class="btn btn-primary" value="이미지"
					onclick="location.href='resources/upload/${ study.sAskimg }'" />
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