<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="resources/css/index.css" rel="stylesheet">
<div class="row" id="global-content">
	<div class="row my-5 text-center">
		<div class="col">
			<h2 class="fs-3 fw-bold">api 스터디 페이지</h2>
		</div>
	</div>
	<div class="row">
		<div class="col text-center">
			<h1 class="display-4 text-center">Youtube Channel</h1>
			<!-- <button class="btn">숏박스</button> -->
			 <input type="text" name="inputname" id="inputname"><button id="apibutton">api</button><br>
			 <!-- <input type="text" name="inputname2" id="inputname2"><button id="apibutton2">api2</button> -->
			   <div class="container">
			   	<!-- 
			   	<iframe width="560" height="315" src="https://www.youtube.com/embed/wST9cYLYO7o" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			    -->

			   </div>
			<div class="row my-5" id="video-channel"></div>
			<br><hr><br>
			<h1 class="display-4 text-center">Youtube videos</h1>	
			<div class="row my-5" id="video-container">
				<!-- <iframe id="ytplayer" type="text/html" width="720" height="405" src="https://www.youtube.com/embed/wST9cYLYO7o" frameborder="0" allowfullscreen></iframe> -->
				<div id="view">
				</div>
				<div id="player"></div><!-- https://www.youtube.com/playlist?list=PLrSOSlasEemWLdyBXfdbVElXBcr5enJIr -->
			</div>
		</div>
	</div>
</div>

<div>
	<span id="sec">0</span>
	<input type="hidden" id="hid_sec" value="0"/>
	<a href="javascript:;" onclick="startTimer();">시작</a> 
	<a href="javascript:;" onclick="stopTimer();">스톱</a> 
	<a href="javascript:;" onclick="resetTimer();">리셋</a> 
</div>


<div>
	<p id="testhover">테스트</p>
</div>
<div id="star">
<span class="fa fa-star " ></span>
<span class="fa fa-star " ></span>
<span class="fa fa-star " ></span>
<span class="fa fa-star " ></span>
<span class="fa fa-star " ></span>
</div>
<script>

$('#testhover').hover(function(){
	$(this).css("color", "red");
}, function(){
	$(this).css("color", "blue");
});


$('.fa fa-star').hover(function(){
	$(this).addClass("checked");
}, function(){
	$(this).removeClass("checked");
});

</script>

<script src="resources/js/testApiTwo.js"></script>
<!-- <script src="resources/js/youtobeApi.js"></script> -->