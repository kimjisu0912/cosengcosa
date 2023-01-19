$(function() {

	/* 게시 글 상세보기에서 게시 글 수정 폼 요청 처리
	 * 아래와 같이 hidden 폼을 통해 post 방식으로 처리 할 수 있다.
	 **/
	$("#detailUpdate").on("click", function() {
		
		$("#checkForm").attr("action", "studyUpdate");
		$("#checkForm").submit();
	});
	
	
				
	//게시글 등록시 확인창 내리기
	$(document).ready(function(){
   		 $("#classMainInsert").on('click', function() {  // 
       			 if(confirm("게시글을 등록하시겠습니까?")) {  // 확인 창이 열림
           				location.href = $(this).data('/classMainList');  // data-uri 속성값으로 URL 호출
       			 }
   		 });
});
		
	
	// 게시 글쓰기 폼 유효성 검사
	$("#writeForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			alert("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			alert("내용이 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
	});

	// 게시 글 수정 폼 유효성 검사
	$("#updateForm").on("submit", function() {
		if($("#writer").val().length <= 0) {
			alert("작성자가 입력되지 않았습니다.\n작성자를 입력해주세요");
			$("#writer").focus();			
			return false;
		}
		if($("#title").val().length <= 0) {
			alert("제목이 입력되지 않았습니다.\n제목을 입력해주세요");
			$("#title").focus();
			return false;
		}
		if($("#content").val().length <= 0) {
			alert("내용이 입력되지 않았습니다.\n내용을 입력해주세요");
			$("#content").focus();
			return false;
		}
	});
});