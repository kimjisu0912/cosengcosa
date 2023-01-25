// DOM(Document Object Model)이 준비 되었다면
$(document).ready(function() {

	
	$(document).on("click", "#replyWriteButton", function() {
	
		if($("#fcContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		// var params = $("#replyWriteForm").serialize();
		
		
		var fcNum = $("#fcNum").val();
		var fcWriter = $("#fcWriter").val();
		var fcContent = $("#fcContent").val();
		
		alert(fcNum + fcWriter + fcContent);
		
		$.ajax({
			url: "replyWrite2.ajax",
			type: "post",
			data: {"fcNum" : fcNum, "fcWriter" : fcWriter, "fcContent" : fcContent},
			dataType: "json",
			success: function(resultData, status, xhr) {
			
				$("#replyTable").empty();
				console.log(resultData);
				$.each(resultData, function(index, value) {					
					// 날짜 데이터를 출력 포맷에 맞게 수정
					var date = new Date(value.fcCdate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());				
										
					var result = 
						"<tr class='reply_" + value.fcNo + "'>" 
						+ "<td>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.fcWriter + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.fcNo + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.fcNo + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href='javascript:reportReply('div_" + value.fcNo + "');'>"
						+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.fcNo + "'>"
						+ "		<pre><span>" + value.fcContent + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					
					$("#replyTable").append(result);								
				});				
				// 댓글 쓰기가 완료되면 댓글 쓰기 폼을 숨긴다.
				$("#replyForm").slideUp(300).add("#fcContent").val("");
				
				console.log("write : " + $("#replyForm").length);
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});
		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
	
	$(document).on("click", ".modifyReply", function() {	
		
		// 현재 수정하기가 클릭된 부모 요소의 다음 형제 요소를 구한다.
		var $next = $(this).parent().next();
		
		if($($next.children()[1]).attr("id") == undefined) {
		
			console.log(".modifyReply click : visible - " 
					+ $("#replyForm").is(":visible")
					+ ", hidden - " + $("#replyForm").is(":hidden")
					+ ", length - " + $("#replyForm").length);
			
			var reply = $next.first().text();			
			
			if($("#replyForm").css("display") == 'block') {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function() {				
				$("#replyContent").val($.trim(reply));
				$("#replyForm").appendTo($next)
					.slideDown(300);
			}, 300);
			
			$("#replyForm").find("form")
				.attr({"id": "replyUpdateForm", "data-no": $(this).attr("data-no") });
		}		
		// 앵커 태그의 기본 기능인 링크로 연결되는 것을 취소한다.
		
		return false;
	});
		
	$(document).on("click", "#replyUpdateButton", function() {	
		
		if($("#fcContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		// var params = $(this).serialize() + "&no=" + $(this).attr("data-no");
		
		var fcNum = $("#fcNum").val();
		var fcContent = $("#fcContent").val();
		var fcNo = $(".modifyReply").attr("data-no");
		
		var params = "fcNum=" + fcNum  + "&fcContent=" + fcContent + "&fcNo=" + fcNo;
		
		alert(params);
		var updateForm;
		
		$.ajax({
			url: "replyUpdate2.ajax",
			type: "post",
			data: {"fcNum": fcNum, "fcContent" : fcContent, "fcNo" : fcNo},
			dataType: "json",
			success: function(resultData, status, xhr) {								
	
				$updateForm = $("#replyForm");
				
				console.log("update - before empty() : " + $updateForm.length);
				
				// 기존에 화면에 출력되었던 댓글을 비운다.
				$("#replyTable").empty();
				
				$.each(resultData, function(index, value) {
					// 날짜 데이터를 출력 포맷에 맞게 수정
					var date = new Date(value.fcCdate);
					var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
							? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
							+ date.getDate() + "-" + ((date.getHours() < 10) 
							? "0" + date.getHours() : date.getHours()) + ":" 
							+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
							: date.getMinutes()) + ":" + (date.getSeconds() < 10 
							? "0" + date.getSeconds() : date.getSeconds());			
										
					var result = 
						"<tr class='reply_" + value.fcNo + "'>" 
						+ "<td>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.fcWriter + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.fcNo + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.fcNo + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href='javascript:reportReply('div_" + value.fcNo + "');'>"
						+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.fcNo + "'>"
						+ "		<pre><span>" + value.fcContent + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					
					// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
					$("#replyTable").append(result);					
				});				
				
				console.log("update after empty() : #replyForm - " 
						+ $("#replyForm").length 
						+ ", $updateFrom : " + $updateForm.length);
				
				$updateForm.find("form")
					.attr("id", "replyUpdateForm").removeAttr("data-no")
					.end().css("display", "none").appendTo("article")
					.find("#fcContent").val("");
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
	$(document).on("click", ".deleteReply", function() {	
		
		var fcNo = $(this).attr("data-no");
		var fcWriter= $(this).parent().prev().find(".member").text();
		var fcNum = $("#replyForm input[name=fcNum]").val();
		var result = confirm(fcWriter + "님이 작성한 " + fcNo +"번 댓글을 삭제하시겠습니까?");
		
		var params = "fcNo=" + fcNo + "&fcNum=" + fcNum;	
		if(result) {
			$.ajax({
				url: "replyDelete2.ajax",
				type: "post",
				data: params,
				dataType: "json",
				success: function(resultData, status, xhr) {			
					
					$("#replyForm").find("form")
						.attr("id", "replyWriteForm").removeAttr("data-no")
						.end().css("display", "none").appendTo("article")
						.find("#replyContent").val("");
					
					// 기존에 화면에 출력되었던 댓글을 비운다.
					$("#replyTable").empty();
					
					$.each(resultData, function(index, value) {
						// 날짜 데이터를 출력 포맷에 맞게 수정
						var date = new Date(value.cdate);
						var strDate = date.getFullYear() + "-" + ((date.getMonth() + 1 < 10) 
								? "0" + (date.getMonth() + 1) : (date.getMonth() + 1)) + "-"  
								+ date.getDate() + "-" + ((date.getHours() < 10) 
								? "0" + date.getHours() : date.getHours()) + ":" 
								+ (date.getMinutes() < 10 ? "0" + date.getMinutes() 
								: date.getMinutes()) + ":" + (date.getSeconds() < 10 
								? "0" + date.getSeconds() : date.getSeconds());
											
						var result = 
							"<tr class='reply_" + value.fcno + "'>" 
							+ "<td>"
							+ "	<div class='replyUser'>"
							+ "		<span class='member'>" + value.fcWriter + "</span>"
							+ "	</div>"
							+ "	<div class='replyModify'>"
							+ "		<span class='replyDate'>" + strDate + "</span>"
							+ "		<a href='#' class='modifyReply' data-no='" + value.fcNo + "'>"
							+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
							+ "		</a>"
							+ "		<a href='#' class='deleteReply' data-no='" + value.fcNo + "'>"
							+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
							+ "		</a>"
							+ "		<a href='javascript:reportReply('div_" + value.fcNo + "');'>"
							+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
							+ "		</a>"
							+ "	</div>"
							+ "	<div class='replyContent' id='div_" + value.fcNo + "'>"
							+ "		<pre><span>" + value.fcContent + "</span></pre>"
							+ "	</div>"
							+ "</td>"
						+ "</tr>";
						
						// 댓글 테이블의 기존 내용을 삭제하고 다시 추가한다.
						$("#replyTable").append(result);					
					});
				},
				error: function(xhr, status, error) {
					alert("ajax 실패 : " + status + " - " + xhr.status);
				}
			});
		}
		// 앵커 태그에 의해 페이지가 이동되는 것을 취소한다.
		return false;
	});	
});