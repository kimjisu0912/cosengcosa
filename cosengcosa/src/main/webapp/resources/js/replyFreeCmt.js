// DOM(Document Object Model)이 준비 되었다면
$(document).ready(function() {

	
	$("#Commend").click(function() {
		
		
		$.ajax({			
			url: "recommend2.ajax",
			
			// type을 지정하지 않으면 get 방식 요청이다.
			type: "post",
			
			// 파라미터로 보낼 데이터를 객체 리터럴로 지정하고 있다.
			data : { fNo : $("#fNo").val()},

			dataType: "json",
			success: function(data) {
				location.reload();
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
	
		if($("#fcContent").val().length <= 5) {
			alert("댓글은 5자 이상 입력해야 합니다.");
			// Ajax 요청을 취소한다.
			return false;
		}
		
		// var params = $("#replyWriteForm").serialize();
		
		
		var fcNum = $("#fcNum").val();
		var fcWriter = $("#fcWriter").val();
		var fcContent = $("#fcContent").val();
		
		
		$.ajax({
			url: "replyWrite2.ajax",
			type: "post",
			data: {"fcNum" : fcNum, "fcWriter" : fcWriter, "fcContent" : fcContent},
			dataType: "json",
			success: function(resultData, status, xhr) {
			location.reload();
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
					
					 "<div class='reply_" + value.fcNo + "'>" 
						+ "<div>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.fcWriter + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.fcNo + "'>"
						+ "		<pre><span>" + value.fcContent + "</span></pre>"
						+ "	</div>"
						+ "</div>"
					+ "</div>";
					
					$("#replyTable").append(result);								
				});				
				// 댓글 쓰기가 완료되면 댓글 쓰기 폼을 숨긴다.
				$("#replyForm").slideUp(300).add("#fcContent").val("");
				
				console.log("write : " + $("#replyForm").length);
			},
			error: function(xhr, status, error) {
				alert("로그인을 해주세요!!");
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
		
		var updateForm;
		
		$.ajax({
			url: "replyUpdate2.ajax",
			type: "post",
			data: {"fcNum": fcNum, "fcContent" : fcContent, "fcNo" : fcNo},
			dataType: "json",
			success: function(resultData, status, xhr) {								
				location.reload();
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
						"<div class='reply_" + value.fcNo + "'>" 
						+ "<div>"
						+ "	<div class='replyUser'>"
						+ "		<span class='member'>" + value.fcWriter + "</span>"
						+ "	</div>"
						+ "	<div class='replyModify'>"
						+ "		<span class='replyDate'>" + strDate + "</span>"
						+ "	</div>"
						+ "	<div class='replyContent' id='div_" + value.fcNo + "'>"
						+ "		<pre><span>" + value.fcContent + "</span></pre>"
						+ "	</div>"
						+ "</div>"
					+ "</div>";
					
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
					location.reload();
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
							"<div class='reply_" + value.fcno + "'>" 
							+ "<div>"
							+ "	<div class='replyUser'>"
							+ "		<span class='member'>" + value.fcWriter + "</span>"
							+ "	</div>"
							+ "	<div class='replyModify'>"
							+ "		<span class='replyDate'>" + strDate + "</span>"
							+ "	</div>"
							+ "	<div class='replyContent' id='div_" + value.fcNo + "'>"
							+ "		<pre><span>" + value.fcContent + "</span></pre>"
							+ "	</div>"
							+ "</div>"
						+ "</div>";
						
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