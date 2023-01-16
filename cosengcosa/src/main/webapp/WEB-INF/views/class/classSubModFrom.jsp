<%-- 회원가입 폼 요청 처리 결과를 출력할 View 페이지 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row my-5" id="global-content">
	<div class="col">
		<div class="row my-3 text-center">
			<div class="col">
				<h2 class="fs-3 fw-bold">서브강의 정보 수정</h2>
			</div>
		</div>
		
			<div class="row mt-5 mb-3">
				<div class="col-8 offset-2">				
					<label for="csTitle" class="form-label">* 강의 이름(sub) : </label>
					<input type="text" class="form-control" name="csTitle" id="csTitle" value="${classSub.csTitle }">
				</div>				
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<div class="row">
						<div class="col-auto">
							<label for="id" class="form-label">* 강의코드 : </label>
						</div>
						<div class="col-auto">
							<input type="text" class="form-control text-bg-secondary " name="csCode" id="csCode" value="${classSub.csCode }" readonly>
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
							<input type="text" class="form-control text-bg-secondary" name="csGroup" id="csGroup" value="${classSub.csGroup }" readonly>
						</div>
					</div>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="address1" class="form-label">* 강의설명 : </label>
					<textarea class="form-control" name="csContent" id="csContent" rows="3">${classSub.csContent }</textarea>
				</div>	
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="address2" class="form-label">* 등록 된 강의영상 : </label>
					<iframe width="720" height="480" src="https://www.youtube.com/embed/${classSub.csVideo }" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
				</div>
			</div>
			<div class="row my-3">
				<div class="col-8 offset-2">
					<label for="address2" class="form-label">* 수정 할 강의영상 : </label>
					<input type="text" name="inputname" id="inputname"><button id="apibutton">api</button>
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
							<input type="text" class="form-control" name="csRuntime" id="csRuntime" value="${classSub.csRuntime }">
						</div>
					</div>
				</div>	
			</div>	
		<form name="classSubForm" id="classSubForm">
			<!-- hidden input joinResult -->
			<input type="hidden" name="hcsTitle" id="hcsTitle" value=""/>
			<input type="hidden" name="hcsCode" id="hcsCode" value=""/>
			<input type="hidden" name="hcsGroup" id="hcsGroup" value=""/>
			<input type="hidden" name="hcsContent" id="hcsContent" value=""/>
			<input type="hidden" name="hcsVideo" id="hcsVideo" value=""/>
			<input type="hidden" name="hcsRuntime" id="hcsRuntime" value=""/>
			<div class="row mb-3 mt-3">				
				<div class="col-8 offset-2">
					<input type="submit" value="수정하기" class="btn btn-outline-primary">
					<input type="button" value="삭제하기" class="btn btn-outline-danger" data-bs-toggle="modal" data-bs-target="#myModal">
					<input class="btn btn-outline-success" type="button" value="목록보기" onclick="location.href='classSubList?cmcode=${classSub.csGroup }'"/>
				</div>
			</div>
		</form>
	</div>
</div>


	 <div class="modal fade" id="myModal" data-bs-backdrop="static" data-bs-keyboard="false" aria-hidden="true" role="dialog" tabindex="-1">
	    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-dialog-centered">
	      <div class="modal-content">
	      
	        <!-- Modal Header -->
	        <div class="modal-header bg-dark text-white">
	          <h4 class="modal-title">강의 삭제</h4>
	          <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">&times;</button>
	        </div>
	        
	        <!-- Modal body -->
	        <div class="modal-body text-center">
	        	' ${classSub.csTitle } ' 을(를) 삭제 하시겠습니까?
	        </div>
	        
	        <!-- Modal footer -->
	        <div class="modal-footer">
	        	<a href="classSubDel?csCode=${classSub.csCode }&csGroup=${classSub.csGroup }" class="btn btn-primary">삭제하기</a>
	         	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
	        </div>
	        
	      </div>
	    </div>
	</div> 

<script src="resources/js/youtobeApi.js"></script>
