<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">서브강의 정보 입력</h2>
			</div>
		</div>
		
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">				
					<label for="csTitle" class="form-label">* 강의 이름(sub) : </label>
					<input type="text" class="form-control" name="csTitle" id="csTitle">
				</div>				
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<div class="row">
						<div class="col-auto">
							<label for="id" class="form-label">* 강의코드 : </label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control text-bg-secondary " name="csCode" id="csCode" value="${cscode }" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<div class="row">
						<div class="col-auto">
							<label for="id" class="form-label">* 강의그룹 : </label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control text-bg-secondary" name="csGroup" id="csGroup" value="${cmcode }" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="address1" class="form-label">* 강의설명 : </label>
					<textarea class="form-control" name="csContent" id="csContent" rows="3"></textarea>
				</div>	
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<div class="row">
						<div class="col-auto">
							<label for="address2" class="form-label">* 강의영상 : </label>
						</div>
						<div class="col-auto">
							<div class="input-group mb-3">
								<input type="text" class="form-control" name="inputname" id="inputname">
								<button class="btn btn-dark" id="apibutton">강의검색</button>
							</div>
						</div>
					</div>
					<div style="width: 100%; height: 350px; overflow: scroll;">
						<div class="row" id="view">
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<div class="row">
						<div class="col-auto">
							<label for="emailId" class="form-label">* 강의시간 : </label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control text-bg-secondary" name="csRuntime" id="csRuntime" readonly>
						</div>
					</div>
				</div>	
			</div>	
		<form name="classSubAddForm" id="classSubAddForm">
			<!-- hidden input joinResult -->
			<input type="hidden" name="hcsTitle" id="hcsTitle" value=""/>
			<input type="hidden" name="hcsCode" id="hcsCode" value=""/>
			<input type="hidden" name="hcsGroup" id="hcsGroup" value=""/>
			<input type="hidden" name="hcsContent" id="hcsContent" value=""/>
			<input type="hidden" name="hcsVideo" id="hcsVideo" value=""/>
			<input type="hidden" name="hcsRuntime" id="hcsRuntime" value=""/>
			<div class="row mb-3 mt-3">				
				<div class="col-8 offset-2">
					<input type="submit" value="등록하기" class="btn btn-dark">
					<input class="btn btn-primary" type="button" value="목록보기" onclick="location.href='classSubList?cmcode=${cmcode }'"/>
				</div>
			</div>
		</form>
	</div>
</div>
<script src="resources/js/youtobeApi.js"></script>
