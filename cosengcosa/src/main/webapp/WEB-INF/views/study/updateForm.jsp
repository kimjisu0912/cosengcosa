<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">지식공유 수정하기</h2>
			</div>
		</div>  
		<form name="updateForm" action="studyUp" id="updateForm" 
			class="row g-3 border-primary" method="post" enctype="multipart/form-data">
			<input type="hidden" name="sNo"  value="${study.sNo}" >
		  	<div class="col-4 offset-md-2">
			    <label for="writer" class="form-label">작성자</label>
			    <input type="text" class="form-control" name="sAskid"  id="writer" readonly
			    	placeholder="작성자를 입력해 주세요" value="${ study.sAskid }">
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="title" class="form-label">제 목</label>
			    <input type="text" class="form-control" name="sTitle"  id="title" value="${study.sTitle }">
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="error" class="form-label">오류코드</label>
			    <input type="text" class="form-control" name="sError"  id="error" value="${ study.sError }">
	  		</div>
			<div class="col-8 offset-md-2">
			    <label for="content" class="form-label">내 용</label>
			    <textarea class="form-control" name="sAskcontent" id="content" rows="10" >${ study.sAskcontent }</textarea>
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="sFile" class="form-label">이미지</label>
			    <input type="file" class="form-control" name="qImg"  id="sFile" value="${ study.sFile }">
	  		</div>	
	  		<div class="col-8 offset-md-2 text-center mt-5">
			   <input type="submit" value="수정하기" class="btn btn-primary"/>
					&nbsp;&nbsp;<input type="button" value="목록보기" 
						onclick="location.href='studyList'" class="btn btn-primary"/>
	  		</div>	
		</form>
	</div>
</div>    
    
    