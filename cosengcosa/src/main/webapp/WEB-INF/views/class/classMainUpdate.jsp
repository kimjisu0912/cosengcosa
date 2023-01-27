<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 
	새로운 5자리 우편번호로 회원 주소를 입력 받기 위해 daum.net에서
	제공하는 우편번호 찾기 API를 사용하였다.
	참고 사이트 : http://postcode.map.daum.net/guide
-->    
<script src=
"https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<div class="row">
	<div class="col ">
		<div class="container ">
		   	<div class="shadow-lg p-3 mb-5  bg-warning text-dark bg-opacity-25 text-start">
		     	<h2>수강페이지 수정 관리자</h2>
		   	</div>
		   	<form name="classMainModForm" id="classMainModForm" >
			<div class="row justify-content-md-center">
				<div class="col-10 shadow py-1 mb-4 ">
					<div class="row justify-content-md-center ">
						<input type="hidden" name="cmNo" id="cmNo" value="${classMain.cmNo }">
						<div class="col-8 mt-3">
							<label for="text1" class="form-label">* 표시된 항목은 필수입력 사항 입니다. </label>
						</div>
						<div class="col-8 mt-3">
							<label for="text1" class="form-label">강의 이름 : </label>
							<input type="text" class="form-control" id="cmTitle" name="cmTitle" value="${classMain.cmTitle }">
						</div>

						<div class="col-8 mt-3">
							<label for="text1" class="form-label">강의코드 : </label>
							<input type="text" class="form-control text-bg-secondary" id="cmCode" name="cmCode" value="${classMain.cmCode }" readonly>
						</div>
						<div class="col-8 mt-3">
							<label for="text1" class="form-label">강의제공자 : </label>
							<input type="text" class="form-control" id="cmName" name="cmName" value="${classMain.cmName }">
						</div>
						<div class="col-8 mt-3">
							<label for="text1" class="form-label">강의가격 : </label>
							<input type="text" class="form-control" id="cmPrice" name="cmPrice" value="${classMain.cmPrice }">
						</div>
						<div class="col-8 mt-3">
							<label for="text1" class="form-label">강의기간 : </label>
							<input type="text" class="form-control" id="cmPeriod" name="cmPeriod" value="${classMain.cmPeriod }">
						</div>
						<div class="col-8 m-3">
							<label for="text1" class="form-label"> 내 용 : </label>
							<textarea class="form-control" id="cmContent" name="cmContent" rows="3">"${classMain.cmContent }"</textarea>
						</div>
					</div>
				</div>
				<div class="col-10 d-md-flex justify-content-md-start">
		   			<input type="submit" class=" btn btn-outline-success m-2" value="수정">
		   		</div>
			</div>
			</form>
		</div>
	</div>
</div>

<script src="resources/js/classMain.js"></script>