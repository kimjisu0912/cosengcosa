/**
 * 메인강의 관련 스크립트
 */
var cmCode = $("#cmCode");
cmCode.blur(function(){
 	// Ajax
 	var aCmCode = $("#cmCode").val();
 	var data = "cmCode="+aCmCode;
 	$("#codeCk").empty(); 		
 	$.ajax({
		"url" : "cmCodeChk.ajax",
		"type" : "get",
		"data" : data,
		"dataType" : "json",
		"success" : function(d){
			console.log("d: \n");
			console.log(d); // 이렇게 순수하게 그 자체로 찍으면 객체처럼 보인다.
			var ck = d;
			var result ="";
			$("#hCmCode").val(ck);
			if(ck > 0){
				result = "<div class='text-danger' style=''background-color : >사용할 수 없는 코드 입니다. 다른 코드를 입력 해주세요.</div>"
			}else{
				result = "<div class='text-info'>사용 가능한 코드 입니다.</div>"
			}
		    $('#codeCk').append(result);

		},
		"error" : function(xhr, status){
			console.log("error : " + status);
		}
	});
	
 });



 // 메인강의 등록 이벤트
 $(document).on("submit", "#classMainAddForm", function() {
 
 	// 입력값 체크를 위한 값 변수에 담기
 	var cmTitle = $("#cmTitle").val();
 	var cmCode = $("#cmCode").val();
 	var hCmCode = $("#hCmCode").val();
 	var cmName = $("#cmName").val();
 	var cmPrice = $("#cmPrice").val();
 	var cmPeriod = $("#cmPeriod").val();
 	var cmContent = $("#cmContent").val();
	
	var codeCheck = RegExp(/^[A-Z0-9_]$/);
	var payCheck = RegExp(/^[0-9]$/);
	
	
	
	
	if(codeCheck.test($("#cmCode").val())){
        alert("대문자, 숫자, 아래바(_)만 입력하실수 있습니다.");
        $("#cmCode").val("");
        $("#cmCode").focus();
        return false;
      }
      
	if(payCheck.test($("#cmPrice").val())){
        alert("숫자만 입력하실수 있습니다.");
        $("#cmPrice").val("");
        $("#cmPrice").focus();
        return false;
      }
      
	if(payCheck.test($("#cmPrice").val())){
        alert("숫자만 입력하실수 있습니다.");
        $("#cmPrice").val("");
        $("#cmPrice").focus();
        return false;
      }
	
//
	
	// 입력 유무 체크
	if(cmTitle.length <=0){
		alert("강의 명을 입력해주세요");
		return false;
	}
	
	if(cmCode.length <=0){
		alert("코드 명을 입력해주세요");
		return false;
	}
	if(hCmCode == 1){
		alert("중복된 코드입니다 확인해 주세요");
		return false;
	}
	if(cmName.length <=0){
		alert("강의제공자를 입력해주세요");
		return false;
	}
	if(cmPrice.length <=0){
		alert("가격을 입력해주세요");
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

