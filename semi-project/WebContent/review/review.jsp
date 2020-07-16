<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
<style>
.modal-content {
	height: 700px;
	float: left;
}

#review_img {
	height: 600px;
	width: 340px;
}

#review_content {
	line-height: 30px;
}
</style>
</head>
<body>
	<button type="button" class="btn btn-primary" data-toggle="modal"
		data-target="#exampleModal" data-whatever="@mdo">Open modal
		for @mdo</button>

	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-xl" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<span><strong>홍길동님의 리뷰</strong></span>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="row">
						<div id="carouselExampleIndicators"
							class="carousel slide col-xl-5 border-right ml-3 px-5"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carouselExampleIndicators" data-slide-to="0"
									class="active"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
								<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner mr-3">
								<div class="carousel-item active">
									<img id="review_img"
										src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img id="review_img"
										src="http://image.kyobobook.co.kr/mimages/nowbook/202006/20200628091354478.jpg"
										class="d-block w-100" alt="...">
								</div>
								<div class="carousel-item">
									<img id="review_img"
										src="http://image.kyobobook.co.kr/upload/SimpleReview/62016301559_202006100949442.jpg"
										class="d-block w-100" alt="...">
								</div>
							</div>
							<a class="carousel-control-prev"
								href="#carouselExampleIndicators" role="button"
								data-slide="prev"> <span class="carousel-control-prev-icon"
								aria-hidden="true"></span> <span class="sr-only">Previous</span>
							</a> <a class="carousel-control-next"
								href="#carouselExampleIndicators" role="button"
								data-slide="next"> <span class="carousel-control-next-icon"
								aria-hidden="true"></span> <span class="sr-only">Next</span>
							</a>
						</div>

						<div class="col-xl-6 mx-4">

							<br>
							<h3 class="border-bottom border-success">이것이 자바다</h3>

							<p class="small my-1">
								글쓴이 : 홍길동 <span class="ml-5">평점 : ★★★★★</span><span
									class="float-right">작성일 : 0000.00.00</span>
							</p>
							<!-- review_menu -->
							<ul class="nav nav-tabs mt-lg-5" id="myTab" role="tablist">
								<li class="nav-item" role="presentation"><a
									class="nav-link active" id="home-tab" data-toggle="tab"
									href="#home" role="tab" aria-controls="home"
									aria-selected="true">책 소개</a></li>
								<li class="nav-item" role="presentation"><a
									class="nav-link" id="profile-tab" data-toggle="tab"
									href="#profile" role="tab" aria-controls="profile"
									aria-selected="false">댓글</a></li>
							</ul>
							<div class="tab-content" id="myTabContent">
								<div class="tab-pane fade show active" id="home" role="tabpanel"
									aria-labelledby="home-tab">
									<p id="review_content" class="my-lg-5">택배로 온 책을 보고 두꺼워서 조금
										놀랐는데, 1/2권 분책이 가능한 형태였다. 두께로만 봐도 내용이 정말 많겠다는 생각이 들었고, 읽어보니 정말
										많은 내용을 넣으려는 노력을 했음을 알 수 있었다. 1권은 자바의 기본 문법과 간단한 oop에 해당하는 부분이라
										읽고 넘어갔는데, 일단 읽으면서 받은 첫 인상은 소스코드가 자세히 나와있어 좋았고, 설명도 비교적 세부적인
										부분까지 기술한 듯해서 괜찮았다. 장점 소스코드와 설명이 자세하다. api에 대해 사용방법을 바로알고 싶을 때
										매우 유용하다 단점 초급대상이지만 간단하게라도 설명이 있으면 좋을 중요한 부분들이 빠진경우가 있다.</p>
										
									<p class="float-right" >저자 : 홍길동,&nbsp;&nbsp;출판사 : 길벗,&nbsp;&nbsp; 출간일 : 0000.00.00</p>	
								</div>
								<div class="tab-pane fade" id="profile" role="tabpanel"
									aria-labelledby="profile-tab">
									<table class = "table table-light my-lg-3 border-bottom border-success">
										<thead class ="table">
											<tr class="">
												<th class = "text-center border-bottom border-success">추천</th>
												<th class = "text-center border-bottom border-success">아이디</th>
												<th class = "text-center border-bottom border-success">댓글 내용</th>
												<th class = "text-center border-bottom border-success">날짜</th>	
											</tr>
										</thead>
										<tbody>
											<tr>
												<td class = "text-center">1</td>
												<td class = "text-center">kimgura</td>
												<td class = "text-center">가나다라마바사아자차카타파하</td>
												<td class = "text-center">0000.00.00</td>
											</tr>
											<tr>
												<td class = "text-center">2</td>
												<td class = "text-center">hdh</td>
												<td class = "text-center">리뷰잘읽었어요</td>
												<td class = "text-center">0000.00.00</td>
											</tr>
											<tr>
												<td class = "text-center">2</td>
												<td class = "text-center">asd</td>
												<td class = "text-center">리뷰잘읽었어요</td>
												<td class = "text-center">0000.00.00</td>
											</tr>
											
										</tbody>
										
									</table>
									<div class="mb-lg-5 w-100">
										<textarea class="form-control mt-lg-5 mb-lg-2"  name="review_comment" id=""></textarea>
										<button class = "btn btn-primary float-right mt-3">작성</button>
										<button class = "btn btn-primary float-right mt-3 mr-2">지우기</button>
									</div>
									
								</div>						
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
		integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"
		integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI"
		crossorigin="anonymous"></script>
		
	<script src="${pageContext.request.contextPath}/js/review.js"></script>
</body>
</html>