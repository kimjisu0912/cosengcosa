<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>cosengcosa</title>
    <link href="resources/bootstrap/bootstrap.min.css" rel="stylesheet">
    <link href="resources/css/main.css" rel="stylesheet">
    <link href="resources/css/chart.css" rel="stylesheet">
    <link href="resources/css/w3.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"><!-- 부트스트랩 아이콘 -->
    <style type="text/css">
    </style>
    <script src="resources/js/jquery-3.6.1.min.js"></script>
	<script src="resources/js/formcheck.js"></script>
	<script src="resources/js/member.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> <!-- sweatalert -->
	
  </head>
  <body>
  	<div class="container-fluid">
		<%@ include file="template/header.jsp" %>
  	</div>
	 <div class="container">
		<jsp:include page="${ param.body }" />
	</div>
	<div class="container-fluid">
		<%@ include file="template/footer.jsp" %>
	</div>
	 <script src="resources/bootstrap/bootstrap.bundle.min.js"></script>
	<!-- 로그인 모달 창 -->
	<div class="modal fade" id="lgoinModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	    <form action="login" id="loginForm" method="post">
	      <div class="modal-header mainBk text-white">
	        <h1 class="modal-title fs-5 fw-bold" id="exampleModalLabel">회원 로그인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	          <div class="mb-3">
	            <label for="userId" class="col-form-label">아 이 디 :</label>
	            <input type="text" class="form-control" id="userId" name="userId">
	          </div>
	          <div class="mb-3">
	            <label for="userPass" class="col-form-label">비밀번호 :</label>
	            <input type="password" class="form-control" id="userPass" name="userPass">
	          </div>
	          <div><a href="findForm">아이디 / 비밀번호 찾기</a></div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button type="submit" class="btn btn-dark">로그인</button>
	      </div>
	     </form>
	    </div>
	  </div>
	</div>

</body>
</html>