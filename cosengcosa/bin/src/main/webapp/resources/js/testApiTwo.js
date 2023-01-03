/**
 * 
 */
 $("#apibutton2").on("click", function() {
 	let key = "AIzaSyDFyNAy8OkLEMb4y5vNIG8LZubxW0IqAYA";
 	let channelName = $("#inputname2").val();
 	getChannelId(channelName,key)
 	console.log($("#inputname2").val());
});

function getChannelId(channelName, key){
$.ajax({
            type: "GET",
            dataType: "json",
            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=1&q="+channelName+"&type=video&key="+key,
            contentType : "application/json",
            success : function(data) {
                console.log(data.items[0].snippet.channelId);
                let channelId = data.items[0].snippet.channelId;
                getView(channelId, key);
            },
            complete : function(data) {
            },
            error : function(xhr, status, error) {
                console.log("유튜브 요청 에러: "+error);
            }
        });

}


function getView(channelId, key){
$.ajax({
            type: "GET",
            dataType: "json",
            url: "https://www.googleapis.com/youtube/v3/search?part=snippet&maxResults=25&order=date&channelId="+channelId+"&type=video&key="+key,
            contentType : "application/json",
            success : function(data) {
                data.items.forEach(function(element, index) {
                    $('#view').append('<iframe width="560" height="315" src="https://www.youtube.com/embed/'+element.id.videoId+'" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>');
                });
            },
            complete : function(data) {
            },
            error : function(xhr, status, error) {
                console.log("유튜브 요청 에러: "+error);
            }
        });
}