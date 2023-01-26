/**
 *  게시판 수정 삭제 자바 스크립트
 */
 
 $(function() {

	/* 게시 글 상세보기에서 게시 글 수정 폼 요청 처리
	 * 아래와 같이 hidden 폼을 통해 post 방식으로 처리 할 수 있다.
	 **/
	$("#detailUpdate1").on("click", function() {
		
		$("#checkForm").attr("action", "studyUpdate");
		$("#checkForm").submit();
	});
	
	$("#detailUpdate2").on("click", function() {
		
		$("#checkForm").attr("action", "boardUpdate");
		$("#checkForm").submit();
	});
	
	$("#detailUpdate3").on("click", function() {
		
		$("#checkForm").attr("action", "freeBoardUpdate");
		$("#checkForm").submit();
	});
	
	/* 게시 글 상세보기에서 게시 글 삭제 요청 처리
	 * 아래와 같이 hidden 폼을 통해 post 방식으로 처리 할 수 있다.
	 **/
	$("#detailDelete1").on("click", function() {
		
		$("#checkForm").attr("action", "studyDelete");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	
	$("#detailDelete2").on("click", function() {
		
		$("#checkForm").attr("action", "boardDelete");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	
	$("#detailDelete3").on("click", function() {
		
		$("#checkForm").attr("action", "freeBoardDelete");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	
	$("#detailAnswer").on("click", function() {
		
		var answer = $("#answertext").val();
		
		
		$("#answerInput").attr("value", answer);		
		$("#checkForm").attr("action", "boardAnswer");
		$("#checkForm").attr("method", "post");
		$("#checkForm").submit();
	});
	
	// 게시 글쓰기 폼 유효성 검사
	$("#studyWriteForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			swal("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요", "warning");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			swal("제목이 입력되지 않았습니다.\n제목을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#error").val().length <= 0) {
			swal("오류코드가 입력되지 않았습니다.\n오류코드을 입력해주세요", "warning");
			$("#error").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#content").focus();
			return false;
		}
		if($("#title").val().length <= 5 && $("#title").val().length >= 1) {
			swal("제목을 5자 이상 작성해 주세요!!", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 5 && $("#content").val().length >= 1) {
			swal("내용을 5자 이상 작성해 주세요!!", "warning");
			$("#content").focus();
			return false;
		}
	});
	// 지식공유
	// 게시 글 수정 폼 유효성 검사
	$("#studyupdateForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			swal("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요", "warning");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			swal("제목이 입력되지 않았습니다.\n제목을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#error").val().length <= 0) {
			swal("오류코드가 입력되지 않았습니다.\n오류코드을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#content").focus();
			return false;
		}
		if($("#title").val().length <= 5 && $("#title").val().length >= 1) {
			swal("제목을 5자 이상 작성해 주세요!!", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 5 && $("#content").val().length >= 1) {
			swal("내용을 5자 이상 작성해 주세요!!", "warning");
			$("#content").focus();
			return false;
		}
	});
	// 요청사항
	$("#requestWriteForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			swal("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요", "warning");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			swal("제목이 입력되지 않았습니다.\n제목을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#content").focus();
			return false;
		}
		if($("#title").val().length <= 5 && $("#title").val().length >= 1) {
			swal("제목을 5자 이상 작성해 주세요!!", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 5 && $("#content").val().length >= 1) {
			swal("내용을 5자 이상 작성해 주세요!!", "warning");
			$("#content").focus();
			return false;
		}
	});

	// 게시 글 수정 폼 유효성 검사
	$("#requestUpdateForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			swal("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요", "warning");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			swal("제목이 입력되지 않았습니다.\n제목을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#content").focus();
			return false;
		}
		if($("#title").val().length <= 5 && $("#title").val().length >= 1) {
			swal("제목을 5자 이상 작성해 주세요!!", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 5 && $("#content").val().length >= 1) {
			swal("내용을 5자 이상 작성해 주세요!!", "warning");
			$("#content").focus();
			return false;
		}
	});
	$("#freeWriteForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			swal("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요", "warning");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			swal("제목이 입력되지 않았습니다.\n제목을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#content").focus();
			return false;
		}
		if($("#title").val().length <= 5 && $("#title").val().length >= 1) {
			swal("제목을 5자 이상 작성해 주세요!!", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 5 && $("#content").val().length >= 1) {
			swal("내용을 5자 이상 작성해 주세요!!", "warning");
			$("#content").focus();
			return false;
		}
	});

	// 게시 글 수정 폼 유효성 검사
	$("#freeUpdateForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			swal("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요", "warning");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			swal("제목이 입력되지 않았습니다.\n제목을 입력해주세요", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#content").focus();
			return false;
		}
		if($("#title").val().length <= 5 && $("#title").val().length >= 1) {
			swal("제목을 5자 이상 작성해 주세요!!", "warning");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 5 && $("#content").val().length >= 1) {
			swal("내용을 5자 이상 작성해 주세요!!", "warning");
			$("#content").focus();
			return false;
		}
	});
	/*
	$("#searchForm").on("submit", function(){
		if($("#keyword").val().length <= 0) {
			swal("내용이 입력되지 않았습니다.\n내용을 입력해주세요", "warning");
			$("#keyword").focus();
			return false;
		}
	});
	*/
	$("#answertext").on("click", function(){
		var grant = $("#grant").val();
		
		if(grant == "A"){
			$("#answertext").removeAttr("readonly", " ");
			return false;
		}
	}); 
	
	$("#java").on("click", function(){
		$("#keyword").attr("value", "java");
	});
	
	$("#spring").on("click", function(){
		$("#keyword").attr("value", "spring");
	});
	
	$("#javas").on("click", function(){
		$("#keyword").attr("value", "javascript");
	});
	
	$("#python").on("click", function(){
		$("#keyword").attr("value", "python");
	});
	
});