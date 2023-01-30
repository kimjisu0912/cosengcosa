// DOM이 준비되면 실행될 콜백 함수 
$(function() {	
	
	// 비밀번호 확인
	$("#btnPassCheck").on("click",function(){
		var oldId = $("#id").val();
		console.log(oldId);
		var oldPass = $("#oldPass").val();
		
		if($.trim(oldPass).length == 0){
			swal("입력오류", "현재 비밀번호를 입력해주세요", 'warning');
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
					swal("확인완료", "비밀번호가 확인되었습니다. \n새로운 비밀번호로 수정해주세요.", 'success');
					$("#btnPassCheck").prop("disabled", true); // 버튼 비활성화
					$("#pass1").focus();
				}else{
				// 비밀번호가 틀린 경우 - 비밀번호가 틀림을 알림
					swal("확인실패","비밀번호가 맞지 않습니다.",'warning');
					$("#oldPass").val("").focus();
				}			
			},
			"error" : function(xhr, status){
				console.log("error : " + status);
			}
			
		});
		
	});
	
	// 기존 비밀번호 다시 입력시 비활성화
	$("#oldPass").change(function(){
		$("#btnPassCheck").prop("disabled", false); // 버튼 활성화
	});
	
	// 비밀번호 변경버튼 클릭시 확인후 전달
	$("#passChange").on("submit", function() {
	// 비밀번호 확인을 했는지 체크 - 비밀번호 확인버튼이 비활성화 유무로 확인한다
		
		var pass1 = $("#pass1").val();
		var pass2 = $("#pass2").val();
		
		if(! $("#btnPassCheck").prop("disabled")) {
			swal("","현재 비밀번호를 확인해주세요", 'warning');
			return false;
		}
		
		if(pass1.length == 0) {		
		swal("입력오류","새 비밀번호를 입력해주세요",'warning');
		return false;
		}
	
		if(pass2.length == 0) {		
			swal("입력오류","새 비밀번호 확인을 입력해주세요",'warning');
			return false;
		}
		
		if(pass1 != pass2) {
			swal("입력오류","새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.",'warning');
			return false;
		}	
		
		swal("변경완료", "비밀번호가 변경되었습니다", 'success');
	});
	
	
	// 회원가입 버튼 이벤트 처리
	$("#joinForm").on("submit",function(){
		return joinFormCheck(true);
		
		swal("회원가입을 축하합니다!", "로그인 해주세요", 'success').then(function(){
		location.href="main";                   
		});
	});
	
	// 아이디 중복검사
	$("#btnOverlapId").on("click",function(){
		var id = $("#id").val();
		var url = "overlapIdCheck?id="+id;
		
		if(id.length<=0){
			swal("입력오류", "아이디를 입력해 주세요",'warning');
			return false;
		}
		if(id.length < 5){
			swal("","아이디는 5자 이상 입력해야 합니다.",'warning');
			return false;
		}
		window.open(url, "idChedk", "toolbar=no, location=no, status=no, menubar=no, width=500, height=400, top=200, left=500");
	});
	
	// 아이디 중복검사 새창에서 아이디 사용버튼 이벤트 처리
	$("#btnIdCheckClose").on("click",function(){
		var id = $(this).attr("data-id-value"); 
		
		opener.document.joinForm.id.value = id;
		opener.document.joinForm.isIdCheck.value = true;
		window.close();
	});
	
	
	
	// 회원가입시 닉네임 중복검사 새창으로 확인하기
	$("#btnOverlapNickName").on("click",function(){
		var nickname = $("#nickname").val();
		var url = "overlapNickNameCheck?nickname="+nickname;
		
		if(nickname.length<=0){
			swal("입력오류", "닉네임을 입력해 주세요",'warning');
			return false;
		}
		if(nickname.length < 5){
			swal("","닉네임은 5자 이상 입력해야 합니다.",'warning');
			return false;
		}
		// toolbar 이후 부터 옵션임
		window.open(url, "nicknameCheck", "toolbar=no, location=no, status=no, menubar=no, width=500, height=400, top=200, left=500 ");
	});
	
	// 회원가입시 닉네임 중복검사 새창에서 이벤트 처리
	$("#btnNickNameCheckClose").on("click",function(){
		var nickname = $(this).attr("data-id-value");
		
		opener.document.joinForm.nickname.value = nickname;
		opener.document.joinForm.isNickNameCheck.value = true;
		window.close();
	});
	
	// 회원정보 수정시 닉네임 중복검사 새창으로 확인하기
	$("#btnOverlapNickName2").on("click",function(){
		var nickname = $("#nickname").val();
		var url = "overlapNickNameCheck2?nickname="+nickname;
		
		if(nickname.length<=0){
			swal("입력오류", "닉네임을 입력해 주세요",'warning');
			return false;
		}
		if(nickname.length < 5){
			swal("","닉네임은 5자 이상 입력해야 합니다.",'warning');
			return false;
		}
		// toolbar 이후 부터 옵션임
		window.open(url, "nicknameCheck", "toolbar=no, location=no, status=no, menubar=no, width=500, height=400, top=200, left=500");
	});
	
	// 회원정보 수정시 닉네임 중복검사 새창에서 이벤트 처리
	$("#btnNickNameCheckClose2").on("click",function(){
		var nickname = $(this).attr("data-id-value"); 
		
		// 부모창에 도큐먼트에 해당폼의 닉네임의 값에 nickname값을 넣어준다
		opener.document.memberUpdateForm.nickname.value = nickname;
		// 닉네임 체크 상태를 변경해준다.
		opener.document.memberUpdateForm.isNickNameCheck.value = true;
		// 팝업창 닫자
		window.close();
	});
	
	// 아이디 비밀번호 찾기
	// 아이디 찾기 라디오버튼이 선택되면 아이디 찾기 폼 보여주기
	$("input[type='radio'][id='findId']").on('click', function(){
	
			$("#findIdFrm").removeClass('d-none');
			$("#findPassFrm").addClass('d-none');
	
	});
	// 비밀번호 찾기 라디오버튼이 선택되면 비밀번호 찾기 폼 보여주기
	$("input[type='radio'][id='findPass']").on('click', function(){
		
			$("#findPassFrm").removeClass('d-none');
			$("#findIdFrm").addClass('d-none');
			
	});
		
	// 아이디 찾기 폼 입력검사
	$("#findIdForm").on("submit", function(){
		var name = $("#name").val();
		var emailId = $("#emailId").val(); 
		var emailDomain = $("#emailDomain").val(); 
		
		if(name.length == 0) {		
			swal("입력오류","이름을 입력해주세요",'warning');
			return false;
		}	
		
		if(emailId.length == 0) {		
			swal("입력오류","이메일 아이디를 입력해주세요",'warning');
			return false;
		}	
		
		if(emailDomain.length == 0) {		
			swal("입력오류","이메일 도메인을 입력해주세요",'warning');
			return false;
		}		
	
	});
	
	// 비밀번호 찾기 입력검사
	$("#findPassForm").on("submit", function(){
	
		var id = $("#id").val();
		var emailId = $("#emailId2").val(); 
		var emailDomain = $("#emailDomain2").val(); 
		
		if(id.length == 0) {		
			swal("입력오류","아이디를 입력해주세요",'warning');
			return false;
		}
		
		if(emailId.length == 0) {		
		swal("입력오류","이메일 아이디를 입력해주세요",'warning');
		return false;
		}	
		
		if(emailDomain.length == 0) {		
			swal("입력오류","이메일 도메인을 입력해주세요",'warning');
			return false;
		}			
	});
	
	// 우편번호 찾기 이벤트 처리
	$("#btnZipcode").click(findZipcode); // findZipcode 호출
	
	// 정규식(https://developer.mozilla.org/ko/docs/Web/JavaScript/Guide/Regular_Expressions 참조)
	// 회원가입 유효성 검사
	$("#id").on("keyup", inputCharReplace); 
	$("#pass1").on("keyup", inputCharReplace); 
	$("#pass2").on("keyup", inputCharReplace); 
	$("#emailId").on("keyup", inputCharReplace); 
	$("#emailId2").on("keyup", inputCharReplace); 
	$("#emailDomain").on("keyup", inputEmailDomainReplace); 
	$("#emailDomain2").on("keyup", inputEmailDomainReplace); 
	$("#birthY").on("keyup", inputNumberReplace);
	$("#birthD").on("keyup", inputNumberReplace);
	$("#tel2").on("keyup", inputNumberReplace);
	$("#tel3").on("keyup", inputNumberReplace);
	
	// 회원가입 및 아이디 찾기 이메일 도메인 선택
	$("#selectDomain").on("change",function(){
		
		var str = $(this).val();
		
		if(str == "직접입력"){
			$("#emailDomain").val(""); 
			$("#emailDomain").prop("readonly", false) 
		}else if(str == "네이버"){
			$("#emailDomain").val("naver.com"); 
			$("#emailDomain").prop("readonly", true) 
		}else if(str == "다음"){
			$("#emailDomain").val("daum.net"); 
			$("#emailDomain").prop("readonly", true) 
		}else if(str == "한메일"){
			$("#emailDomain").val("hanmail.net"); 
			$("#emailDomain").prop("readonly", true) 
		}else if(str == "구글"){
			$("#emailDomain").val("gmail.com"); 
			$("#emailDomain").prop("readonly", true) 
		}
		
	});
	
	// 비밀번호 찾기 이메일 도메인 선택
	$("#selectDomain2").on("change",function(){
		
		var str = $(this).val();
		
		if(str == "직접입력"){
			$("#emailDomain2").val(""); 
			$("#emailDomain2").prop("readonly", false) 
		}else if(str == "네이버"){
			$("#emailDomain2").val("naver.com"); 
			$("#emailDomain2").prop("readonly", true) 
		}else if(str == "다음"){
			$("#emailDomain2").val("daum.net"); 
			$("#emailDomain2").prop("readonly", true) 
		}else if(str == "한메일"){
			$("#emailDomain2").val("hanmail.net"); 
			$("#emailDomain2").prop("readonly", true) 
		}else if(str == "구글"){
			$("#emailDomain2").val("gmail.com"); 
			$("#emailDomain2").prop("readonly", true) 
		}
	});
	
	// 로그인 아이디 입력될때 한글 입력하면 지우기
	$("#userId").on("keyup", loginCharReplace);
	
	// 회원 로그인 폼이 submit 될 때 폼 유효성 검사를 위한 이벤트 처리
	$("#loginForm").submit(function() {
		var id = $("#userId").val();
		var pass = $("#userPass").val();
		
		if(id.length <= 0) {
			swal("","아이디가 입력되지 않았습니다.\n아이디를 입력해주세요", 'warning');
			$("#id").focus();
			return false;
		}
		if(pass.length <= 0) {
			swal("","비밀번호가 입력되지 않았습니다.\n비밀번호를 입력해주세요", 'warning');
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
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            $("#zipcode").val(data.zonecode);
            $("#address1").val(addr);
             // 커서를 상세주소 필드로 이동한다.
            $("#address2").focus();
        }
    }).open();
}

// 로그인 
function loginCharReplace(){
	var regExp = /[^A-Za-z0-9]/gi; //// 키보드 키가 눌릴 떄 - 영문 대소문자, 숫자만 입력되도록 체크
	if(regExp.test($(this).val())) {
		// [a-zA-Z0-9]
		$(this).val($(this).val().replace(regExp,"")); //잘몬된 부분만 지워라 replace()함수 사용
		return;
	}
} 

// 회원 아이디, 비밀번호, 이메일 아이디 폼 컨트롤에서
// 사용자 입력값이 영문 대소문자, 숫자 범위에 있는지 체크
function inputCharReplace(){
	var regExp = /[^A-Za-z0-9]/gi; //// 키보드 키가 눌릴 떄 - 영문 대소문자, 숫자만 입력되도록 체크
	// .test() > 모질라에서 만든 검증 함수
	if(regExp.test($(this).val())) {
		// [a-zA-Z0-9]
		swal("","영문 대소문자, 숫자만 입력 할 수 있습니다.", 'warning');
		$(this).val($(this).val().replace(regExp,"")); //잘몬된 부분만 지워라 replace()함수 사용
		return;
	}
} 

// 이메일 도메인 폼 컨트롤에서
// 사용자 입력값이 영문 소문자, 숫자, 닷(.) 범위에 있는지 체크
function inputEmailDomainReplace(){
	var regExp = /[^a-z0-9\.]/g; //// 키보드 키가 눌릴 떄 - 영문 소문자, 숫자만 입력되도록 체크  .은 \. 해야 된다
	if(regExp.test($(this).val())) {
		// [a-zA-Z0-9]
		swal("","이메일 도메인은 영문 소문자, 숫자, 점(.)만 입력 할 수 있습니다.", 'warning');
		$(this).val($(this).val().replace(regExp,"")); //잘몬된 부분만 지워라 replace()함수 사용
		return;
	}
} 

// 숫자만 입력되었는지 체크
function inputNumberReplace(){
	var regExp = /[^0-9]/g;
	
	if(regExp.test($(this).val())) {
		swal("","숫자만 입력할 수 있습니다", 'warning');
		$(this).val($(this).val().replace(regExp,"")); //잘몬된 부분만 지워라 replace()함수 사용
		return;
	}
} 
/* 회원 가입 폼과 회원정보 수정 폼의 유효성 검사를 하는 함수
 * 두 페이지에서 처리하는 코드가 중복되어 하나의 함수로 정의하였다. 
 **/
function joinFormCheck(isJoinForm) {
	var name = $("#name").val();
	var id = $("#id").val();
	var pass1 = $("#pass1").val();
	var pass2 = $("#pass2").val();
	var birthY = $("#birthY").val();
	var birthM = $("#birthM").val();
	var birthD = $("#birthD").val();
	var nickname = $("#nickname").val();
	var zipcode = $("#zipcode").val();
	var address1 = $("#address1").val();
	var emailId = $("#emailId").val();
	var emailDomain = $("#emailDomain").val();
	var tel2 = $("#tel2").val();
	var tel3 = $("#tel3").val();
	var isIdCheck = $("#isIdCheck").val();
	var isNickNameCheck = $("#isNickNameCheck").val();
	
	if(name.length == 0) {		
		swal("입력오류","이름을 입력해주세요",'warning');
		return false;
	}	
	if(id.length == 0) {		
		swal("입력오류","아이디를 입력해주세요",'warning');
		return false;
	}		
	if(pass1.length == 0) {		
		swal("입력오류","비밀번호를 입력해주세요",'warning');
		return false;
	}
	if(pass2.length == 0) {		
		swal("입력오류","비밀번호 확인을 입력해주세요",'warning');
		return false;
	}
	if(pass1 != pass2) {
		swal("입력오류","비밀번호와 비밀번호 확인이 일치하지 않습니다.",'warning');
		return false;
	}
	if(birthY.length < 4){
		swal("입력오류","년도는 4자리 입니다", 'warning');
		return false;
	};	
	if(birthD.length == 0){
		swal("입력오류","생년월일을 입력해주세요",'warning');
		return false;
	}
	if(nickname.length == 0){
		swal("입력오류","닉네임을 입력해주세요",'warning');
		return false;
	}
	if(emailId.length == 0) {		
		swal("입력오류","이메일 아이디를 입력해주세요",'warning');
		return false;
	}	
	if(emailDomain.length == 0) {		
		swal("입력오류","이메일 도메인을 입력해주세요",'warning');
		return false;
	}
	if(tel2.length == 0 || tel3.length == 0) {		
		swal("입력오류","전화번호를 입력해주세요",'warning');
		return false;
	}
	if(zipcode.length == 0) {		
		swal("입력오류","우편번호를 입력해주세요",'warning');
		return false;
	}	
	if(address1.length == 0) {		
		swal("입력오류","주소를 입력해주세요",'warning');
		return false;
	}	
	if(isJoinForm && isIdCheck == 'false') {		
		swal("확인오류","아이디 중복 체크를 해주세요",'warning');
		return false;
	}	
	if(isJoinForm && isNickNameCheck == 'false') {		
		swal("확인오류","닉네임 중복 체크를 해주세요",'warning');
		return false;
	}	
	
}