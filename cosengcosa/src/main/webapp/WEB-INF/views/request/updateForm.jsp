<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">요청사항 수정하기</h2>
			</div>
		</div>  
		<form name="requestUpdateForm" action="boardUp" id="requestUpdateForm" 
			class="row g-3 border-primary" method="post" enctype="multipart/form-data">
			<input type="hidden" name="no"  value="${board.no}" >
		  	<div class="col-4 offset-md-2">
			    <label for="writer" class="form-label">작성자</label>
			    <input type="text" class="form-control" name="writer"  id="writer" readonly
			    	placeholder="작성자를 입력해 주세요" value="${ board.writer}">
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="title" class="form-label">제 목</label>
			    <input type="text" class="form-control" name="title"  id="title" value="${board.title }">
	  		</div>
			<div class="col-8 offset-md-2">
			    <label for="content" class="form-label">내 용</label>
			    <textarea class="form-control" name="content" id="content" rows="10" >${ board.content }</textarea>
	  		</div>
	  		<div class="col-8 offset-md-2 text-center mt-5">
			   <input type="submit" value="수정하기" class="btn btn-primary"/>
					&nbsp;&nbsp;<input type="button" value="목록보기" 
						onclick="location.href='requestBoardList'" class="btn btn-primary"/>
	  		</div>	
		</form>
	</div>
</div>    
    
<script src="resources/js/boardCheck.js"></script>    