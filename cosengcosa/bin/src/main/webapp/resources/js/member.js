// DOM이 준비되면 실행될 콜백 함수 
$(function() {	
	
	$("#memberUpdateForm").on("submit", function() {
		// 비밀번호 확인을 했는지 체크 - 비밀번호 확인버튼이 비활성화 유무로 확인한다
		if(! $("#btnPassCheck").prop("disabled")) {
			alert("비밀번호 확인을 해주세요");
			return false;
		}
		
		return joinFormCheck(false); 
	});
	
	// 기존 비밀번호 다시 입력시 비활성화
	$("#oldPass").change(function(){
		$("#btnPassCheck").prop("disabled", false); // 버튼 활성화
	});
	
	// 비밀번호 확인
	$("#btnPassCheck").on("click",function(){
		var oldId = $("#userId").val();
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0){
			alert("기본 비밀번호를 입력해주세요");
			return false;
		}
		// 쿼리스트링 데이터 작업
		var data = "id=" + oldId + "&pass=" + oldPass; 
		console.log("data: \n" + data);
		console.log(data); 
		
		$.ajax({
			"url" : "passCheck.ajax",
			"type" : "get",
			"data" : data,
			"dataType" : "json",
			"success" : function(d){
				// 비밀번호가 맞는 경우 - 새로운 비밀번호 입력 안내(비밀번호 확인 버튼 비활성화)
				// data -- > {"result" : "true"}
				console.log("d: \n");
				console.log(d); // 이렇게 순수하게 그 자체로 찍으면 객체처럼 보인다. 
				if(d.result){
					alert("비밀번호가 확인되었습니다. \n새로운 비밀번호로 수정해주세요.");
					$("#btnPassCheck").prop("disabled", true); // 버튼 비활성화
					$("#pass1").focus();
				}else{
				// 비밀번호가 틀린 경우 - 비밀번호가 틀림을 알림
					alert("비밀번호가 맞지 않습니다.");
					$("#oldPass").val("").focus();
				}			
			},
			"error" : function(xhr, status){
				console.log("error : " + status);
			}
			
		});
		
	});
	
	// 회원가입 버튼 이벤트 처리
	$("#joinForm").on("submit",function(){
		return joinFormCheck(true);
	});
	
	// 아이디 중복검사 새창에서 아이디 사용버튼 이벤트 처리
	$("#btnIdCheckClose").on("click",function(){
		var id = $(this).attr("data-id-value"); // attr()은 해당 태그의 속성이다
		
		// 부모창에 도큐먼트에 해당폼의 아이디의 값에 id값을 넣어준다
		opener.document.joinForm.id.value = id;
		// 아이디 체크 상태를 변경해준다.
		opener.document.joinForm.isIdCheck.value = true;
		// 팝업창 닫자
		window.close();
	});
	
	// 아이디 중복검사
	$("#btnOverlapId").on("click",function(){
		var id = $("#userId").val();
		var url = "overlapIdCheck?id="+id;
		
		if(id.length<=0){
			alert("아이디를 입력해 주세요");
			return false;
		}
		if(id.length < 5){
			alert("아이디는 5자 이상 입력해야 합니다.");
			return false;
		}
		// toolbar 이후 부터 옵션임
		window.open(url, "idChedk", "toolbar=no, location=no, status=no, menubar=no, width=500, height=400");
	});
	
	// 우편번호 찾기 이벤트 처리
	$("#btnZipcode").click(findZipcode); // findZipcode 호출
	
	// 정규식(https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions 참조)
	// 회원가입 유효성 검사
	$("#userId").on("keyup", inputCharReplace); // inputCharReplace 호출
	$("#pass1").on("keyup", inputCharReplace); 
	$("#pass2").on("keyup", inputCharReplace); 
	$("#emailId").on("keyup", inputCharReplace); 
	$("#emailDomain").on("keyup", inputEmailDomainReplace); // inputCharReplace 호출
	
	// 이메일 직접입력 선택입력 여부 체크
	$("#selectDomain").on("change",function(){
		// jquery는 이벤트 핸들러인 function() 안의 this는 주체를 가린다
		//console.log($(this).val() + " : " + $(this).text());
		
		var str = $(this).val();
		
		if(str == "직접입력"){
			$("#emailDomain").val(""); // 직접입력이므로 비워주고
			$("#emailDomain").prop("readonly", false) // prop()2.0버전 이상, attr() 3.0대 > checked, selected, readonly등 한개짜리 줄 수 있다 
		}else if(str == "네이버"){
			$("#emailDomain").val("naver.com"); // 해당 이메일 주소 입력하고 readonly로 설정
			$("#emailDomain").prop("readonly", true) 
		}else if(str == "다음"){
			$("#emailDomain").val("daum.net"); // 해당 이메일 주소 입력하고 readonly로 설정
			$("#emailDomain").prop("readonly", true) 
		}else if(str == "한메일"){
			$("#emailDomain").val("hanmail.net"); // 해당 이메일 주소 입력하고 readonly로 설정
			$("#emailDomain").prop("readonly", true) 
		}else if(str == "구글"){
			$("#emailDomain").val("gmail.com"); // 해당 이메일 주소 입력하고 readonly로 설정
			$("#emailDomain").prop("readonly", true) 
		}
		
	});

	// 회원 로그인 폼이 submit 될 때 폼 유효성 검사를 위한 이벤트 처리
	$("#loginForm").submit(function() {
		var id = $("#userId").val();
		var pass = $("#userPass").val();
		
		if(id.length <= 0) {
			alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
			$("#userId").focus();
			return false;
		}
		if(pass.length <= 0) {
			alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
			$("#userPass").focus();
			return false;
		}
	});
	
	
});

// 카카오 우편번호 서비스를 이용해 도로명 주소 검색으로 우편번호 찾는 함수
function findZipcode(){
	new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수
            
            addr = data.roadAddress;
            
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }
            // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
            if(extraAddr !== ''){
                extraAddr = ' (' + extraAddr + ')';
            }
            // 주소에 참고항목을 포함시켜라
            addr += extraAddr;
 /*           
            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J) > 근데 어차피 도로명 주소로 할거라 일단 주석처리 하고 변경
                // addr = data.jibunAddress;
                addr = data.roadAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 주소에 참고항목을 포함시켜라
                addr += extraAddr;
                
            }
*/
            /*
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("address1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("address2").focus();
            */
            // 우편번호와 주소 정보를 해당 필드에 넣는다. - jquery 버전
            $("#zipcode").val(data.zonecode);
            $("#address1").val(addr);
             // 커서를 상세주소 필드로 이동한다.
            $("#address2").focus();
        }
    }).open();
}

// 회원 아이디, 비밀번호, 이메일 아이디 폼 컨트롤에서
// 사용자 입력값이 영문 대소문자, 숫자 범위에 있는지 체크
function inputCharReplace(){
	var regExp = /[^A-Za-z0-9]/gi; //// 키보드 키가 눌릴 떄 - 영문 대소문자, 숫자만 입력되도록 체크
	// .test() > 모질라에서 만든 검증 함수
	if(regExp.test($(this).val())) {
		// [a-zA-Z0-9]
		alert("영문 대소문자, 숫자만 입력 할 수 있습니다.");
		$(this).val($(this).val().replace(regExp,"")); //잘몬된 부분만 지워라 replace()함수 사용
		return;
	}
} 

// 이메일 도메인 폼 컨트롤에서
// 사용자 입력값이 영문 소문자, 숫자, 닷(.) 범위에 있는지 체크
function inputEmailDomainReplace(){
	var regExp = /[^a-z0-9\.]/g; //// 키보드 키가 눌릴 떄 - 영문 소문자, 숫자만 입력되도록 체크  .은 \. 해야 된다
	// .test() > 모질라에서 만든 검증 함수
	if(regExp.test($(this).val())) {
		// [a-zA-Z0-9]
		alert("이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력 할 수 있습니다.");
		$(this).val($(this).val().replace(regExp,"")); //잘몬된 부분만 지워라 replace()함수 사용
		return;
	}
} 


/* 회원 가입 폼과 회원정보 수정 폼의 유효성 검사를 하는 함수
 * 두 페이지에서 처리하는 코드가 중복되어 하나의 함수로 정의하였다. 
 **/
function joinFormCheck(isJoinForm) {
	var name = $("#name").val();
	var id = $("#userId").val();
	var pass1 = $("#pass1").val();
	var pass2 = $("#pass2").val();
	var zipcode = $("#zipcode").val();
	var address1 = $("#address1").val();
	var emailId = $("#emailId").val();
	var emailDomain = $("#emailDomain").val();
	var mobile2 = $("#mobile2").val();
	var mobile3 = $("#mobile2").val();
	var isIdCheck = $("#isIdCheck").val();
	
	if(name.length == 0) {		
		alert("이름이 입력되지 않았습니다.\n이름을 입력해주세요");
		return false;
	}	
	if(id.length == 0) {		
		alert("아이디가 입력되지 않았습니다.\n아이디를 입력해주세요");
		return false;
	}		
	if(isJoinForm && isIdCheck == 'false') {		
		alert("아이디 중복 체크를 하지 않았습니다.\n아이디 중복 체크를 해주세요");
		return false;
	}	
	if(pass1.length == 0) {		
		alert("비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요");
		return false;
	}
	
	if(pass2.length == 0) {		
		alert("비밀번호 확인이 입력되지 않았습니다.\n비밀번호 확인을 입력해주세요");
		return false;
	}
	if(pass1 != pass2) {
		alert("비밀번호와 비밀번호 확인이 일치하지 않습니다.");
		return false;
	}	
	if(zipcode.length == 0) {		
		alert("우편번호가 입력되지 않았습니다.\n우편번호를 입력해주세요");
		return false;
	}	
	if(address1.length == 0) {		
		alert("주소가 입력되지 않았습니다.\n주소를 입력해주세요");
		return false;
	}	
	if(emailId.length == 0) {		
		alert("이메일 아이디가 입력되지 않았습니다.\n이메일 아이디를 입력해주세요");
		return false;
	}	
	if(emailDomain.length == 0) {		
		alert("이메일 도메인이 입력되지 않았습니다.\n이메일 도메인을 입력해주세요");
		return false;
	}	
	if(mobile2.length == 0 || mobile3.length == 0) {		
		alert("휴대폰 번호가 입력되지 않았습니다.\n휴대폰 번호를 입력해주세요");
		return false;
	}
}