<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'Arita-buri-SemiBold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-buri-SemiBold.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

.menu_icon {
	height: 50px;
}

.list_img {
	height: 200px;
}

.container {
	font-family: 'Arita-buri-SemiBold';
}

</style>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">
	
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/carousel.css" />
<script src="${pageContext.request.contextPath}/js/carousel.js"></script>
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	
	
	<jsp:include page="../include/carousel.jsp"></jsp:include>
	<div class="container">
		<div class="container card my-4">
			<div class="row mt-4 mb-4 ml-4">
				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/867/867746.svg" alt="" />
					</button>
					<br> <span>컴퓨터/IT</span>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/3164/3164118.svg"
							alt="" />
					</button>
					<br> <span>경제/경영</span>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/2970/2970729.svg"
							alt="" />
					</button>
					<br> <span>예술</span>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/841/841988.svg" alt="" />
					</button>
					<br> <span>과학</span>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://cdn3.iconfinder.com/data/icons/eldorado-stroke-buildings/40/church-512.png"
							alt="" />
					</button>
					<br> <span>종교</span>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-time-17.png"
							alt="" />
					</button>
					<br> <span>역사</span>
				</div>

			</div>
		</div>
		<div class="container my-5 card">
			<ul class="list-unstyled">
				
				<li class="media my-4 border list_info"><img
					src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
						<h4 class="mt-0 mb-1 mx-3 mt-4"><a href="#" class="text-dark">돈의속성</a></h4>
						<span class="small ml-3 font-weight-light">저자 : 홍길동 , 출판사 :
							길벗 , 출간일 : 0000.00.00</span>
						<div class="row">
							<div class="col-3 text-truncate mx-2 my-4">
								유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판『돈의 속성』. 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대 후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다. ‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.
							</div>
						</div>
					</div>
				</li>
				<br>
				
				<li class="media my-4 border list_info"><img
					src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
						<h4 class="mt-0 mb-1 mx-3 mt-4"><a href="#" class="text-dark">돈의속성</a></h4>
						<span class="small ml-3 font-weight-light">저자 : 홍길동 , 출판사 :
							길벗 , 출간일 : 0000.00.00</span>
						<div class="row">
							<div class="col-3 text-truncate mx-2 my-4">
								유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판『돈의 속성』. 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대 후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다. ‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.
							</div>
						</div>
					</div>
				</li>
				<br><li class="media my-4 border list_info"><img
					src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
						<h4 class="mt-0 mb-1 mx-3 mt-4"><a href="#" class="text-dark">돈의속성</a></h4>
						<span class="small ml-3 font-weight-light">저자 : 홍길동 , 출판사 :
							길벗 , 출간일 : 0000.00.00</span>
						<div class="row">
							<div class="col-3 text-truncate mx-2 my-4">
								유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판『돈의 속성』. 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대 후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다. ‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.
							</div>
						</div>
					</div>
				</li>
				<br>
			</ul>
			<div class="">
				<nav aria-label="책 리스트 페이지네이션">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#">Previous</a></li>
						<!-- for문으로 페이지네이션 -->
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<!--  -->
						<li class="page-item"><a class="page-link" href="#">Next</a></li>
					</ul>
				</nav>
			</div>

		</div>
		
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>