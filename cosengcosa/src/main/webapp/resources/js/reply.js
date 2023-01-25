// DOM(Document Object Model)이 준비 되었다면
$(document).ready(function() {

	// 추천/땡큐 Ajax
	$("#Commend").click(function() {
		
		
		$.ajax({			
			url: "recommend.ajax",
			
			// type을 지정하지 않으면 get 방식 요청이다.
			type: "post",
			
			// 파라미터로 보낼 데이터를 객체 리터럴로 지정하고 있다.
			data : { sno : $("#sno").val()},

			dataType: "json",
			success: function(data) {
				
				var msg = "추천이";
				alert(msg + " 반영 되었습니다.");
			},
			error: function(xhr, status, error) {
				alert("error : " + xhr.statusText + ", " + status + ", " + error);
			}
		});
	}).hover(function() {
		$(this).css({cursor: "pointer"});
	});	
	
	// 댓글 쓰기 메뉴에 마우스 호버(enter, out) 이벤트 처리 - 수정됨
	$("#replyWrite").hover(function() {
		$(this).css("cursor", "pointer");
	});
	
	// 댓글 쓰기가 클릭되었을 때 이벤트 처리 - 추가됨
	$(document).on("click", "#replyWrite", function() {
		if($("#replyForm").css("display") == "block") {
			
			var $next = $(this).parent().next();
			if(! $($next).is("#replyForm")) {
				$("#replyForm").slideUp(300);
			}
			setTimeout(function(){
				$("#replyForm").insertBefore("#replyTitle").slideDown(300);
			}, 300);			
		} else {
			$("#replyForm").insertBefore("#replyTitle").slideDown(300);
		}
		
		$("#replyForm").find("form")
			.attr("id", "replyWriteForm").removeAttr("data-no");
		$("#replyContent").val("");
	});
	
	
	$(document).on("click", "#replyWriteButton", function() {
	
		if($("#saAnswer").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		// var params = $("#replyWriteForm").serialize();
		
		
		var saNum = $("#saNum").val();
		var saAnswerid = $("#saAnswerid").val();
		var saAnswer = $("#saAnswer").val();
		
		$.ajax({
			url: "replyWrite.ajax",
			type: "post",
			data: {"saNum" : saNum, "saAnswerid" : saAnswerid, "saAnswer" : saAnswer},
			dataType: "json",
			success: function(resultData, status, xhr) {
			
				$("#replyTable").empty();
				console.log(resultData);
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
						"<tr class='reply_" + value.saNo + "'>" 
						+ "<td>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.saAnswerid + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.saNo + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.saNo + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href='javascript:reportReply('div_" + value.saNo + "');'>"
						+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.saNo + "'>"
						+ "		<pre><span>" + value.saAnswer + "</span></pre>"
						+ "	</div>"
						+ "</td>"
					+ "</tr>";
					
					$("#replyTable").append(result);								
				});				
				// 댓글 쓰기가 완료되면 댓글 쓰기 폼을 숨긴다.
				$("#replyForm").slideUp(300).add("#answer").val("");
				
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
		
		if($("#saAnswer").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		// var params = $(this).serialize() + "&no=" + $(this).attr("data-no");
		
		var saNum = $("#saNum").val();
		var saAnswer = $("#saAnswer").val();
		var saNo = $(".modifyReply").attr("data-no");
		
		var params = "saNum=" + saNum  + "&saAnswer=" + saAnswer + "&saNo=" + saNo;
		
		alert(params);
		var updateForm;
		
		$.ajax({
			url: "replyUpdate.ajax",
			type: "post",
			data: {"saNum": saNum, "saAnswer" : saAnswer, "saNo" : saNo},
			dataType: "json",
			success: function(resultData, status, xhr) {								
	
				$updateForm = $("#replyForm");
				
				console.log("update - before empty() : " + $updateForm.length);
				
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
						"<tr class='reply_" + value.saNo + "'>" 
						+ "<td>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.saAnswerid + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "		<a href='#' class='modifyReply' data-no='" + value.saNo + "'>"
						+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
						+ "		</a>"
						+ "		<a href='#' class='deleteReply' data-no='" + value.saNo + "'>"
						+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
						+ "		</a>"
						+ "		<a href='javascript:reportReply('div_" + value.saNo + "');'>"
						+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
						+ "		</a>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.saNo + "'>"
						+ "		<pre><span>" + value.saAnswer + "</span></pre>"
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
					.find("#saAnswer").val("");
			},
			error: function(xhr, status, error) {
				alert("ajax 실패 : " + status + " - " + xhr.status);
			}
		});		
		// 폼이 submit 되는 것을 취소한다.
		return false;
	});
	
	$(document).on("click", ".deleteReply", function() {	
		
		var saNo = $(this).attr("data-no");
		var saAnswerid = $(this).parent().prev().find(".member").text();
		var saNum = $("#replyForm input[name=saNum]").val();
		var result = confirm(saAnswerid + "님이 작성한 " + saNo +"번 댓글을 삭제하시겠습니까?");
		
		var params = "saNo=" + saNo + "&saNum=" + saNum;	
		if(result) {
			$.ajax({
				url: "replyDelete.ajax",
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
							"<tr class='reply_" + value.no + "'>" 
							+ "<td>"
							+ "	<div class='replyUser'>"
							+ "		<span class='member'>" + value.saAnswerid + "</span>"
							+ "	</div>"
							+ "	<div class='replyModify'>"
							+ "		<span class='replyDate'>" + strDate + "</span>"
							+ "		<a href='#' class='modifyReply' data-no='" + value.saNo + "'>"
							+ "			<img src='resources/images/reply_btn_modify.gif' alt='댓글 수정하기'/>"
							+ "		</a>"
							+ "		<a href='#' class='deleteReply' data-no='" + value.saNo + "'>"
							+ "			<img src='resources/images/reply_btn_delete.gif' alt='댓글 삭제하기'/>"
							+ "		</a>"
							+ "		<a href='javascript:reportReply('div_" + value.saNo + "');'>"
							+ "			<img src='resources/images/reply_btn_notify.gif' alt='신고하기'/>"
							+ "		</a>"
							+ "	</div>"
							+ "	<div class='replyContent' id='div_" + value.saNo + "'>"
							+ "		<pre><span>" + value.saAnswer + "</span></pre>"
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

/* 아래는 신고하기 버튼을 임시로 연결한 함수 */
function reportReply(elemId) {
	var result = confirm("이 댓글을 신고하시겠습니까?");
	if(result == true) {
		alert("report - " + result);
	}	
}