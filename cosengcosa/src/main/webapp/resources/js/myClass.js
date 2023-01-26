/**
 *  myPage 
 */
 $(function() {
 
 	$("#keyword").change(function(){
 		var keyword = $("#keyword").val();
 		var done = $("#done").val();
 		location.href = "/cosengcosa/myClass?keyword="+keyword+"&done="+done;
 		
 	});
 	
 	$("#done").change(function(){
 		var done = $("#done").val();
 		var keyword = $("#keyword").val();
 		location.href = "/cosengcosa/myClass?keyword="+keyword+"&done="+done;
 		
 	});
});