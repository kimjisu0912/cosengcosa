/**
 * 
 */
 var i = 0;
 $(document).on("click","#apibutton", function() {
 	let key = "AIzaSyDFyNAy8OkLEMb4y5vNIG8LZubxW0IqAYA";
 	let channelName = $("#inputname").val();
 	getChannelId(channelName,key)
 	$('#view').children().remove();
 	i = 0;
});


function getChannelId(channelName, key){
$.ajax({
            type: "GET",
            dataType: "json",
            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=30&regionCode=KR&q="+channelName+"&type=video&order=date&videoEmbeddable=true&key="+key,
            contentType : "application/json",
            success : function(data) {

	             console.log(data);    
	             data.items.forEach(function(element, index) {
	             	
	          
	             	
	             	getView(element.id.videoId, key, element.snippet.title)
	             	
                    //$('#view').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
                });
                
            },
            complete : function(data) {
            },
            error : function(xhr, status, error) {
                console.log("유튜브 요청 에러: "+error);
            }
        });
}

function getView(vid, key, title){
$.ajax({
            type: "GET",
            dataType: "json",
            url: "https://www.googleapis.com/youtube/v3/videos?part=contentDetails&id="+vid+"&key="+key,
            contentType : "application/json",
            success : function(data) {
                data.items.forEach(function(element, index) {
	                  //API시간 -->HH:MM:SS형태로 변환
					  var hourRegex = new RegExp("[0-9]{1,2}H", "gi");
					  var minRegex = new RegExp("[0-9]{1,2}M", "gi");
					  var secRegex = new RegExp("[0-9]{1,2}S", "gi");
					 
					  var hour = hourRegex.exec(element.contentDetails.duration);
					  var min = minRegex.exec(element.contentDetails.duration);
					  var sec = secRegex.exec(element.contentDetails.duration);
					  
					  if(hour!==null){
					      hour = hour.toString().split("H")[0] + ":";
					  }else{
					      hour = "";
					  }
					  if(min !==null){
					      min = min.toString().split("M")[0];
					      if(min.length<2){
					       min = "0"+min;
						}
					  }else{
					      min = "00";
					  }
					  if(sec !==null){
					      sec = sec.toString().split("S")[0];
					      if(sec.length<2){
					       sec = "0"+sec;
						}
					  }else{
					      sec = "00";
					  }
					  var duration = hour+min+":"+sec;
					  //console.log(duration);
					  //console.log(vid);
					  //console.log(title);
					  var result = 
	             		'<div class="col-4">'
		             	+		'<div class="card border-dark shadow" style="width: 13rem; height: 25rem;" >'
		             	+			'<img src="https://img.youtube.com/vi/'+vid+'/0.jpg" class="card-img-top img-thumbnail">'
			            + 			'<div class="card-body text-bg-secondary">'
			            + 				'<p class="card-text">'+title+'</p>'
			            + 				'<p class="card-text">'+duration+'</p>'
			            + 			'</div>'
			            + 		'</div>'
			            +		'<div class="text-center mb-4 text-bg-light shadow" style="width: 13rem;">'
			            + 			'<input class="form-check-input border-dark" type="radio" name="flexRadioDefault" id="flexRadioDefault'+i+'" value="'+vid+'">'
			            +		'</div>'
			            +'</div>'
			            i++;
		             	 $('#view').append(result);
					
                });
                 
            },
            complete : function(data) {

            },
            error : function(xhr, status, error) {
                console.log("유튜브 요청 에러: "+error);
            }
        });
}

$(document).on("click", ".form-check-input", function() {
	$("#hcsVideo").val($(this).val());
	$("#csRuntime").val($(this).parent().parent().children().children().children().next().html());
});


$(document).on("submit", "#classSubAddForm", function() {

	$("#hcsTitle").val($("#csTitle").val());
	$("#hcsCode").val($("#csCode").val());
	$("#hcsGroup").val($("#csGroup").val());
	$("#hcsContent").val($("#csContent").val());
	$("#hcsRuntime").val($("#csRuntime").val());
	
	var title = $("#hcsTitle").val();
	var cscontent = $("#hcsContent").val();
	var video = $("#hcsVideo").val();
	var csruntime = $("#hcsRuntime").val();
	
	if(title.length <=0){
		swal("입력오류", "강의 이름을 입력해주세요",'warning');
		return false;
	}
	if(cscontent.length <=0){
		swal("입력오류", "강의 설명을 입력해주세요",'warning');
		return false;
	}
	if(video.length <=0){
		swal("입력오류", "강의 영상을 검색 후 선택해주세요",'warning');
		return false;
	}
	if(csruntime.length <=0){
		swal("입력오류", "강의 영상 시간을 입력해주세요",'warning');
		return false;
	}
	$("#classSubAddForm").attr("action", "classSubAdd");
	$("#classSubAddForm").attr("method", "post");
	$("#classSubAddForm").submit();
	
});


$(document).on("submit", "#classSubForm", function() {

	$("#hcsTitle").val($("#csTitle").val());
	$("#hcsCode").val($("#csCode").val());
	$("#hcsGroup").val($("#csGroup").val());
	$("#hcsContent").val($("#csContent").val());
	$("#hcsRuntime").val($("#csRuntime").val());
	
	var title = $("#hcsTitle").val();
	var cscontent = $("#hcsContent").val();
	var video = $("#hcsVideo").val();
	var csruntime = $("#hcsRuntime").val();
	
	if(title.length <=0){
		swal("입력오류", "강의 이름을 입력해주세요",'warning');
		return false;
	}
	if(cscontent.length <=0){
		swal("입력오류", "강의 설명을 입력해주세요",'warning');
		return false;
	}
	if(video.length <=0){
		swal("입력오류", "강의 영상을 검색 후 선택해주세요",'warning');
		return false;
	}
	if(csruntime.length <=0){
		swal("입력오류", "강의 영상 시간을 입력해주세요",'warning');
		return false;
	}

	$("#classSubForm").attr("action", "classSubMod");
	$("#classSubForm").attr("method", "post");
	$("#classSubForm").submit();
	
});

