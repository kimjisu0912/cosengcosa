/**
 * pay 관련 스트립트
 */
 
 $(document).on("submit", "#classPayAddForm", function() {

	$("#classPayAddForm").attr("action", "classPayAdd");
	$("#classPayAddForm").attr("method", "post");
	$("#classPayAddForm").submit();
	
});



 
 