<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="row">
	<div class="col ">
		<div class="container ">
		   	<div class="shadow-lg p-3 mb-5  bg-warning text-dark bg-opacity-25 text-start">
		     	<h2>수강페이지 등록 관리자</h2>
		   	</div>
		   	<form name="classMainAddForm" id="classMainAddForm" >
		   	<div class="col-11 d-md-flex justify-content-md-end">
		   		<input type="submit" class=" btn btn-outline-success m-2" value="등록">
		   	</div>
		   	
			<div class="row justify-content-md-center">
				<div class="col-10 shadow py-1 mb-4 ">
					<div class="row justify-content-md-center ">
						<div class="col-8">
							<label for="text1" class="form-label">강의 이름 : </label>
							<input type="text" class="form-control" id="cmTitle" name="cmTitle" >
						</div>

						<div class="col-8">
							<label for="text1" class="form-label">강의코드 : </label>
							<input type="text" class="form-control" id="cmCode" name="cmCode" >
							<div id="codeCk"></div>
							<input type="hidden" id="hCmCode" name="hCmCode" value="">
						</div>
						<div class="col-8">
							<label for="text1" class="form-label">강의제공자 : </label>
							<input type="text" class="form-control" id="cmName" name="cmName" >
						</div>
						<div class="col-8">
							<label for="text1" class="form-label">강의가격 : </label>
							<input type="text" class="form-control" id="cmPrice" name="codeCheck" >
							<div id="cmPrice"></div>
							<input type="hidden" id="cmPrice" name="cmPrice" value="">
						</div>
						<div class="col-8">
							<label for="text1" class="form-label">강의기간 : </label>
							<input type="text" class="form-control" id="cmPeriod" name="cmPeriod" >
						</div>
						<div class="col-8 m-2">
							<label for="text1" class="form-label"> 내 용 : </label>
							<textarea class="form-control" id="cmContent" name="cmContent" rows="3"></textarea>
						</div>
					</div>
				</div>
			</div>
			</form>
		</div>
	</div>
</div>

<script src="resources/js/classMain.js"></script>  
<script src="resources/js/classMainScript.js"></script>