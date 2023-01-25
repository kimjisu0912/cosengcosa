<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- content -->
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">지식공유 질문하기</h2>
			</div>
		</div>  
		<form name="writeFormBoard" action="writeProcessBoard" id="writeFormBoard" 
			class="row g-3 border-primary" method="post" enctype="multipart/form-data">
		  	<div class="col-4 offset-md-2">
			    <label for="writer" class="form-label">작성자</label>
			    <input type="text" class="form-control" name="writer"  id="writer" 
			    	placeholder="작성자를 입력해 주세요" value="${ member.id }" readonly>
	  		</div>
	  		<div class="col-4 ">
			    <label for="code" class="form-label">문의 유형</label>
	  			<select class="form-select" name="code" id="code">
					<option selected value="강의">강의</option>
					<option value="회원">회원</option>
					<option value="결제">결제</option>
					<option value="피드백">피드백</option>
				</select>
	  		</div>
	  		<div class="col-8 offset-md-2">
			    <label for="title" class="form-label">제 목</label>
			    <input type="text" class="form-control" name="title"  id="title" >
	  		</div>
			<div class="col-8 offset-md-2">
			    <label for="content" class="form-label">내 용</label>
			    <textarea class="form-control" name="content" id="content" rows="10"></textarea>
	  		</div>
	  		<div class="col-8 offset-md-2 text-center mt-5">
			   <input type="submit" value="등록하기" class="btn btn-primary"/>
					&nbsp;&nbsp;<input type="button" value="목록보기" 
						onclick="location.href='requestBoardList'" class="btn btn-primary"/>
	  		</div>	
		</form>
	</div>
</div>    
    
    