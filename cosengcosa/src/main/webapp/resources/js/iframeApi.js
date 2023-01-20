/**
 * Youtube API 로드
 */
 var tag = document.createElement('script');
tag.src = "https://www.youtube.com/iframe_api";
var firstScriptTag = document.getElementsByTagName('script')[0];
firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);


function myModalkey(a, b){
onYouTubeIframeAPIReady (a);
$("#hcode").val(b);

}

var player;
function onYouTubeIframeAPIReady (a) {
console.log("onYouTubeIframeAPIReady");
var playernum = 'viewiframe'+a;
console.log(playernum);
  player = new YT.Player(playernum, {
    // height: '315',            // <iframe> 태그 지정시 필요없음
    // width: '560',             // <iframe> 태그 지정시 필요없음
    // videoId: '9bZkp7q19f0',   // <iframe> 태그 지정시 필요없음
    // playerVars: {             // <iframe> 태그 지정시 필요없음
    //   controls: '2'
    //},
    events: {
      'onReady': onPlayerReady,               // 플레이어 로드가 완료되고 API 호출을 받을 준비가 될 때마다 실행
      'onStateChange': onPlayerStateChange    // 플레이어의 상태가 변경될 때마다 실행
    }
  });
}

// ===============================================

function onPlayerReady (event) {
  
 // $('#result').val($('#result').val() + 'onPlayerReady 실행\n')

  // 플레이어 자동실행 (주의: 모바일에서는 자동실행되지 않음)
  event.target.playVideo();
}
var playerState;
function onPlayerStateChange (event) {
console.log(event);
 console.log('onPlayerStateChange 실행'+event);
  playerState = event.data == 0 ? '종료됨' :
    event.data == 1 ? '재생 중' :
    event.data == 2 ? '일시중지 됨' :
    event.data == 3 ? '버퍼링 중' :
    event.data == 5 ? '재생준비 완료됨' :
    event.data == -1 ? '시작되지 않음' : '예외';
    
    if(event.data == 1){
	    var wtime = player.getCurrentTime()
	    var hcode = $("#hcode").val();
	    console.log("1111" +wtime)
	    console.log("1111" +hcode)
	    
    	console.log("*-* Player is on play mode " + event.data + ' ' + player.getCurrentTime());
    	
    	getWatchTime(hcode, wtime);
    	
    }else if(event.data == 2){
    	var wtime = player.getCurrentTime()
	    var hcode = $("#hcode").val();
	    console.log("2222" + wtime)
	    console.log("2222" + hcode)
	    
    	 console.log("*-* Player is on pause mode " + event.data+' '+player.getCurrentTime());
    	 
    	 getWatchTime(hcode, wtime);
    	 
    }else if(event.data == 0){
    	
    	var wtime = player.getCurrentTime()
	    var hcode = $("#hcode").val();
	    console.log("0000" + wtime)
	    console.log("0000" + hcode)
	    
    	console.log("*-* Player is on complet mode " + event.data+' '+player.getCurrentTime());
    	
    	getWatchTime(hcode, wtime);
    	
    }
    
  
}

function onPlayerClose () {
location.reload();
}

function getWatchTime(hcode, wtime){
	
	$.ajax({
	    	"url" :"getWatchTime.ajax",
	    	"type" : "post",
	    	"data": { "hCode": hcode, "wTime": wtime},
	    	"success" : function(data){
	    		console.log(" hcode : " + hcode);
	    		console.log(" wtime : " + wtime);
	    	
	    	}, "error": function(xhr, status, error) {
					console.log("error : " + xhr.statusText + ", " + status + ", " + error);
				}
	    	
	    });
}	
// ============================================
