
// 해당 버튼에 일단 유뷰버 이름을 적어놓았고, 해당 버튼의 innerHTML가져와서 그걸로 
// 함수를 실행시켜주고 옆에 APIKey를 같이 써놨는데, 그건 먼저 const로 지정을 하셔도 되고.. 
// 저도 일단 테스트니까 막 적어놨습니다. 

$("#apibutton").on("click", function() {
 	let channelName = $("#inputname").val();
 	getChannelId(channelName,"AIzaSyDFyNAy8OkLEMb4y5vNIG8LZubxW0IqAYA")
 	console.log($("#inputname").val());
});

// 제가 사용할 url을 가져와서 붙여주면 되는데, https://developers.google.com/youtube/v3/docs
// 여기 들어가서 한번 보시고.. 저는 일단 제가 가져오고자하는 채널의 channelId 값을 얻고싶어서 
// 해당 url을 통해서 가져올건데 아마 다른 url도 가능하실겁니다. 

 var listTitle = [];
 var listId = new Array();
 var videoId=[];
function getChannelId(name, APIKey) 
{
  $.ajax({
    type: "GET",
    url: "https://www.googleapis.com/youtube/v3/search?",
    data: { part: "snippet", key: APIKey, type: "video", q: name },
    success: function (response) {
      console.log(response)
      channelId = response.items[0].snippet.channelId;
      getChannelLists(channelId, APIKey);
    },
  });
}

function getChannelLists(channelId, APIKey) {

  $.ajax({
    type: "GET",
    url: "https://www.googleapis.com/youtube/v3/playlists?",
    data: {
      part: "snippet",
      channelId: channelId,
      key: APIKey,
      type: "playlist",
      maxResults: 25,
    },
    success: function (response) {
      console.log(response);
     
      let playListLength = response.pageInfo.totalResults;
      for (let i = 0; i < playListLength; i++) {
       listTitle.push(response.items[i].snippet.title);
        listId.push(response.items[i].id);
      }
	getVideos(APIKey);
    },
  });
  console.log(listTitle);
  console.log(listId);

}


function getVideos(APIKey) {
  for (let i = 0; i < listId.length; i++) 
  {
    $.ajax({
      type: "GET",
      url: "https://www.googleapis.com/youtube/v3/playlistItems?",
      data: {
        part: "snippet",
        playlistId: listId[i],
        key: APIKey,
        maxResults: 25,
      },

      success: function (response) {
        let temp_listTitle = listTitle[i];
        console.log(temp_listTitle);     
        for (let j = 0; j < response.pageInfo.totalResults; j++) {
          videoId.push(response.items[j].snippet.resourceId.videoId);
        }
        console.log(videoId);
        console.log('')
        console.log('')
        console.log('')
        videoId=[];
        listId=[];
        listTitle=[];
        listTitle.pop();
 		listId.pop();
 		videoId.pop();
        }
    });
  };
};


