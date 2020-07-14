<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
</head>
<body>
	<jsp:include page="/include/header.jsp"></jsp:include>

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
				<li class="media my-4"><img
					src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img" alt="...">
					<div class="media-body">
						<h5 class="mt-0 mb-1">List-based media object</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div></li>
				<br>
				<li class="media my-4"><img
					src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img" alt="...">
					<div class="media-body">
						<h3 class="mt-0 mb-1">돈의속성</h3>
						<span class="small my-1"><span class="small">저자 :
								홍길동 , 출판사 : 길벗 , 출간일 : 0000.00.00</span>
					</div></li>
				<br>
				<li class="media my-4"><img
					src="http://image.kyobobook.co.kr/images/book/xlarge/796/x9791188331796.jpg"
					class="mr-5 list_img" alt="...">
					<div class="media-body">
						<h5 class="mt-0 mb-1">List-based media object</h5>
						Cras sit amet nibh libero, in gravida nulla. Nulla vel metus
						scelerisque ante sollicitudin. Cras purus odio, vestibulum in
						vulputate at, tempus viverra turpis. Fusce condimentum nunc ac
						nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
					</div></li>
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
</body>
</html>