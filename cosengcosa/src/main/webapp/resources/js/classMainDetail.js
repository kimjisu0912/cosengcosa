/**
 * 메인강의 상세페이지 관련 js
 */
 
 window.onload = function(){
        //전체주소
        console.log("url : "+$(location).attr('href'));
        var url = $(location).attr('href');
        $("#data-area").val(url);
    }
    
 // 복사하기 버튼 클릭
    $('#data-copy1').click(function() {

        // 화면에서 hidden 처리한 input box type을 text로 일시 변환
        $('#data-area').attr('type', 'text');     
        // input에 담긴 데이터를 선택
        $('#data-area').select();
        
        //  clipboard에 데이터 복사
        var copy = document.execCommand('copy');        
        // input box를 다시 hidden 처리
        $('#data-area').attr('type', 'hidden');
        // 사용자 알림
        if(copy) {
        	swal("경로복사", "해당 주소 URL을 복사했습니다",'info');
        }
	});
	 $('#data-copy2').click(function() {

        // 화면에서 hidden 처리한 input box type을 text로 일시 변환
        $('#data-area').attr('type', 'text');     
        // input에 담긴 데이터를 선택
        $('#data-area').select();
        
        //  clipboard에 데이터 복사
        var copy = document.execCommand('copy');        
        // input box를 다시 hidden 처리
        $('#data-area').attr('type', 'hidden');
        // 사용자 알림
        if(copy) {
        	swal("경로복사", "해당 주소 URL을 복사했습니다",'info');
        }
	});
    
    $("#recommend1").on("click", function(){
    		// sessionScope.member.id, cmCode
	    	var cmcode = $("#recommendCode").val();
	    	console.log(cmcode);
	    	$.ajax({
			"url" : "addRecommend.ajax",
			"type" : "POST",
			"data" :{"cmcode" : cmcode},
			"dataType" : "text",
			"success" : function(d){
				console.log(d); // 이렇게 순수하게 그 자체로 찍으면 객체처럼 보인다.
				var userCk = d;
				if(userCk == "U"){
					swal("경고", "로그인이 필요한 서비스 입니다.",'warning');
					return;
				}else if(userCk == "F"){
					swal("에러", "추천 시 문제가 발생했습니다. 다음에 이용해 주세요",'error');
					return;
				}else if(userCk == "N"){
					swal("경고", "이미 추천 하였습니다.",'warning');
					return;
				}else{
					$("#biHeart1").removeClass("bi-heart");
					$("#biHeart1").addClass("bi-suit-heart-fill");
					swal("추천", "해당 강의에 대해서 추천 하였습니다.",'success');
				}
			},
			"error" : function(xhr, status){
				console.log("error : " + status);
			}
		});
    	
   });
   
   
   $("#recommend2").on("click", function(){
    		// sessionScope.member.id, cmCode
	    	var cmcode = $("#recommendCode").val();
	    	console.log(cmcode);
	    	$.ajax({
			"url" : "addRecommend.ajax",
			"type" : "POST",
			"data" :{"cmcode" : cmcode},
			"dataType" : "text",
			"success" : function(d){
				console.log(d); // 이렇게 순수하게 그 자체로 찍으면 객체처럼 보인다.
				var userCk = d;
				if(userCk == "U"){
					swal("경고", "로그인이 필요한 서비스 입니다.",'warning');
					return;
				}else if(userCk == "F"){
					swal("에러", "추천 시 문제가 발생했습니다. 다음에 이용해 주세요",'error');
					return;
				}else if(userCk == "N"){
					swal("경고", "이미 추천 하였습니다.",'warning');
					return;
				}else{
					$("#biHeart2").removeClass("bi-heart");
					$("#biHeart2").addClass("bi-suit-heart-fill");
					swal("추천", "해당 강의에 대해서 추천 하였습니다.",'success');
				}
			},
			"error" : function(xhr, status){
				console.log("error : " + status);
			}
		});
    	
   });
    
    