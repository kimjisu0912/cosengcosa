/**
 *  myPage 
 */
 $(function() {
 
 	// 내 강의실 검색 처리
	$("#classSearchForm").on("submit", function() {
		var keyword = $("#keyword").val();
		if(keyword.length <= 0) {
			alert("검색어가 입력되지 않았습니다.\n검색어를 입력해주세요");
			return false;
		}		
		$(this).attr("method", "post");
		$(this).attr("action", "myClass");		
	});	
});