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
    $('#data-copy').click(function() {

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
    
    $("#recommend").on("click", function(){
    	// sessionScope.member.id, cmCode
	    	$.ajax({
			"url" : "cmRecommend.ajax",
			"type" : "post",
			"data" :{"saNum" : saNum, "saAnswerid" : saAnswerid, "saAnswer" : saAnswer},
			"dataType" : "json",
			"success" : function(d){
				console.log(d); // 이렇게 순수하게 그 자체로 찍으면 객체처럼 보인다.
			},
			"error" : function(xhr, status){
				console.log("error : " + status);
			}
		});
    	
    });
    
    