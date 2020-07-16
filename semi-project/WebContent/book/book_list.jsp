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

#story{
		width:100%;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap:break-word; 
		line-height: 1.5em;
		height: 4.5em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
	}
	
	.media-body>p {
		font-size: 0.8rem;
	}

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookList.css" />
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	
	<div class="container">
		<div class="container card my-4">
			<div class="row mt-5 mb-4" id="article">
				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/867/867746.svg" alt="" />
							<p class="mt-3 text-dark">컴퓨터/IT</p>
					</button>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/3164/3164118.svg"
							alt="" />
							<p class="mt-3 text-dark">경제/경영</p>
					</button>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/2970/2970729.svg"
							alt="" />
							<p class="mt-3 text-dark">예술</p>
					</button>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/841/841988.svg" alt="" />
							<p class="mt-3 text-dark">과학</p>
					</button>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://cdn3.iconfinder.com/data/icons/eldorado-stroke-buildings/40/church-512.png"
							alt="" />
							<p class="mt-3 text-dark">종교</p>
					</button>
				</div>

				<div class="col-2">
					<button class="btn btn-link">
						<img class="menu_icon"
							src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-time-17.png"
							alt="" />
							<p class="mt-3 text-dark">역사</p>
					</button>
				</div>

			</div>
		</div>
		<div class="container my-5 card">
			<ul class="list-unstyled">
				
				<li class="media my-4 border list_info">
				<img src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
					 	<h5 class="mt-0 my-2"><Strong>돈의 속성</Strong></h5>
					 	<small>저자 : 홍길동 , 출판사 : 길벗 , 출간일 : 0000.00.00</small> <br /><br />
						<p id="story">유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판『돈의 속성』. 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대 후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다. ‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.</p>
					</div>
				</li>
				<br>
				<li class="media my-4 border list_info">
				<img src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
					 	<h5 class="mt-0 my-2"><Strong>돈의 속성</Strong></h5>
					 	<small>저자 : 홍길동 , 출판사 : 길벗 , 출간일 : 0000.00.00</small> <br /><br />
						<p id="story">유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판『돈의 속성』. 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대 후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다. ‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.</p>
					</div>
				</li>
				<br>
				<li class="media my-4 border list_info">
				<img src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
					 	<h5 class="mt-0 my-2"><Strong>돈의 속성</Strong></h5>
					 	<small>저자 : 홍길동 , 출판사 : 길벗 , 출간일 : 0000.00.00</small> <br /><br />
						<p id="story">유튜브 1,100만 명이 시청한 〈돈의 속성〉 완결판『돈의 속성』. 맨손에서 만들어낸 종잣돈으로 돈 버는 방법을 알려준다. 부모에게 받은 유산은커녕, 30대 후반까지 낡은 자동차에 그날 판매할 과일을 싣고 다니던 어느 가난한 이민 가장이 이룬 진짜 부에 대한 모든 방법이 담겼다. 종잣돈 천만 원을 만들고 그 돈을 1억 원, 10억 원, 100억 원, 수천억 원이 될 때까지 돈을 관리하며 터득한 ‘돈’이 가진 속성을 정리한 안내서다. ‘진짜 부자’가 된 실제 인물이 말해주는 ‘진짜 돈’만들기에 대한 책이다.</p>
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