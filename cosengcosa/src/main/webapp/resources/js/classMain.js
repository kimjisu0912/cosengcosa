/**
 * 메인강의 관련 스크립트
 */
 
 // 메인강의 등록 이벤트
 $(document).on("submit", "#classMainAddForm", function() {
 
 	// 입력값 체크를 위한 값 변수에 담기
 	var cmTitle = $("#cmTitle").val();
 	var cmCode = $("#cmCode").val();
 	var cmName = $("#cmName").val();
 	var cmPrice = $("#cmPrice").val();
 	var cmPeriod = $("#cmPeriod").val();
 	var cmContent = $("#cmContent").val();
	
	
	// 입력 유무 체크
	if(cmTitle.length <=0){
		alert("강의 명을 입력해주세요");
		return false;
	}
	if(cmCode.length <=0){
		alert("코드 명을 입력해주세요");
		return false;
	}
	if(cmName.length <=0){
		alert("강의제공자를 입력해주세요");
		return false;
	}
	if(cmPrice.length <=0){
		alert("영상 시간을 입력해주세요");
		return false;
	}
	if(cmPeriod.length <=0){
		alert("기간을 입력해주세요. ");
		return false;
	}
	if(cmContent.length <=0){
		alert("강의 설명에 대해서 입력해주세요");
		return false;
	}

	$("#classMainAddForm").attr("action", "classMainAdd");
	$("#classMainAddForm").attr("method", "post");
	$("#classMainAddForm").submit();
	
});

// 메인강의 수정 이벤트
 $(document).on("submit", "#classMainModForm", function() {
 
 	// 입력값 체크를 위한 값 변수에 담기
 	var cmTitle = $("#cmTitle").val();
 	var cmCode = $("#cmCode").val();
 	var cmName = $("#cmName").val();
 	var cmPrice = $("#cmPrice").val();
 	var cmPeriod = $("#cmPeriod").val();
 	var cmContent = $("#cmContent").val();
	
	
	// 입력 유무 체크
	if(cmTitle.length <=0){
		alert("강의 명을 입력해주세요");
		return false;
	}
	if(cmCode.length <=0){
		alert("코드 명을 입력해주세요");
		return false;
	}
	if(cmName.length <=0){
		alert("강의제공자를 입력해주세요");
		return false;
	}
	if(cmPrice.length <=0){
		alert("영상 시간을 입력해주세요");
		return false;
	}
	if(cmPeriod.length <=0){
		alert("기간을 입력해주세요. ");
		return false;
	}
	if(cmContent.length <=0){
		alert("강의 설명에 대해서 입력해주세요");
		return false;
	}

	$("#classMainModForm").attr("action", "classMainUpdate");
	$("#classMainModForm").attr("method", "post");
	$("#classMainModForm").submit();
	
});


		