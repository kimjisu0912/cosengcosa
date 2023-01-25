<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
 <link href="resources/css/w3.css" rel="stylesheet">
 
<!-- content -->
 <div class="row" id="global-content">
 	<div class="col text-center mt-4">
		<div class="row">
			<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/images/slide1.jpg" class="d-block w-100" alt="...">
					</div>
					<div class="carousel-item">
					  	<img src="resources/images/slide2.jpg" class="d-block w-100" alt="...">
					</div>
				</div>
			</div>
		</div> 
		<div class="row my-3">
			<div class="row text-start my-3">
				<h6>수강생들이 추천하는</h6>
				<h3 class="fw-bold">코생코사 인기강의</h3>
			</div>
			<div class="row">
				<c:forEach var="r" items="${rList}" end="4" >
					<div class="col mb-5" >	
						<div class="text-start">
							<div class="row" ><a href="classMainDetail?cmNo=${r.cmNo }&cmCode=${r.cmCode }&pageNum=${currentPage}&type=${type}&keyword=${keyword}"><img class="border border-2 border-dark" width="100%"  height="170px" src="http://img.youtube.com/vi/${r.video }/mqdefault.jpg"></a></div>
							<div class="row mt-3" style="height: 50px;"><a href="classMainDetail?cmNo=${r.cmNo }&cmCode=${r.cmCode }&pageNum=${currentPage}&type=${type}&keyword=${keyword}" class="fbk">${r.cmTitle }</a></div>
							<div class="row mb-1"><a class="color-black dnone">${r.cmName}</a></div>
							<div class="row">
								<div class="col-6">
								<c:if test="${r.cmStar ne 0 }">	
									<c:forEach var="star" items="${list}" end="${r.cmStar - 1 }" >
										<span class="fa fa-star checked"></span>
									</c:forEach>
								</c:if>		
								<c:if test="${r.cmStar ne 5 }">
									<c:forEach var="star" items="${list}" end="${4 - r.cmStar }">
										<span class="fa fa-star "></span>
									</c:forEach>
								</c:if>  
								</div>
								<div class="col-6 text-end"><span><i class="bi bi-hand-thumbs-up"></i> ${r.cmRecommend }</span></div>
							</div>
						</div>	
					</div>
				</c:forEach>	
			</div>
		</div> 
		<div class="row my-3">
			<div class="row text-start my-3">
				<h6>새로운 강의 새로운 직장</h6>
				<h3 class="fw-bold">따끈따끈 신규강의</h3>
			</div>
			<div class="row">
				<c:forEach var="d" items="${dList}" end="4">
					<div class="col mb-5" >	
						<div class="text-start">
							<div class="row"><a href="classMainDetail?cmNo=${d.cmNo }&cmCode=${d.cmCode }&pageNum=${currentPage}&type=${type}&keyword=${keyword}"><img class="border border-2 border-dark" width="100%"  height="170px" src="http://img.youtube.com/vi/${d.video}/mqdefault.jpg"></a></div>
							<div class="row mt-3" style="height: 50px;"><a href="classMainDetail?cmNo=${d.cmNo }&cmCode=${d.cmCode }&pageNum=${currentPage}&type=${type}&keyword=${keyword}" class="fbk">${d.cmTitle }</a></div>
							<div class="row mb-1"><a class="color-black dnone"> ${d.cmName}</a></div>
							<div class="row">
								<div class="col-6">
									<c:forEach var="star" items="${list}" end="${d.cmStar - 1 }" >
										<span class="fa fa-star checked"></span>
									</c:forEach>	
									<c:forEach var="star" items="${list}" end="${4 - d.cmStar }">
										<span class="fa fa-star "></span>
									</c:forEach>
								</div>
								<div class="col-6 text-end"><span><i class="bi bi-hand-thumbs-up"></i> ${d.cmRecommend }</span></div>
							</div>
						</div>	
					</div>
				</c:forEach>	
			</div>
		</div> 
		
		<div class="row my-5">
			<div class="row text-start my-3">
				<h3 class="fw-bold">인기 게시글</h3>
			</div>
			<div class="row">
				<c:forEach var="s" items="${sList}" end="4">
					<div class="col">
						<div class="row">${s.sTitle }</div>
						<div class="row">${s.sAskcontent}</div>
					</div>
				</c:forEach>	
			</div>
		</div> 
		<div class="row my-5">
			<div class="row text-start my-3">
				<h3 class="fw-bold">HOT 지식공유</h3>
			</div>
			<div class="row"></div>
			<div class="row">
			</div>
		</div> 
	</div>	
	
 </div><!-- end global content -->