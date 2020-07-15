<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>MYpage</title>

<!-- Bootstrap core CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css"
	integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk"
	crossorigin="anonymous">

<!-- Custom styles for this template -->
<link href="css/shop-homepage.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/carousel.css" />
</head>
<style>
	.container{
		border:1px solid tomato;
		
	}
</style>
<body>

	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container my-4">
		<!-- 상단로우 -->
		<div class="row">
			<!--제목 -->
			<h1 class="mx-3 my-3">MY PAGE</h1>
			<!-- 관심사 carousel 영역-->
			<div class="col-lg-12">
				<h4 class="my-4 ml-5">최근 관심사</h4>
				<jsp:include page="../include/carousel.jsp"></jsp:include>
			<div>
			<!--내가 쓴 리뷰,내가 쓴 댓글 row-->
				<div class="row">
					<div class="col-lg-6 col-md-6 mb-6">
						<div class="card h-100">
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">내가 쓴 리뷰</a>
								</h4>
								<ul>
									<li>하나</li>
									<li>둘</li>
									<li>셋</li>

								</ul>
							</div>
							<div class="card-footer">
								<small class="text-muted float-right"><a href="">더보기</a></small>
							</div>
						</div>
					</div>

					<div class="col-lg-6 col-md-6 mb-6">
						<div class="card h-100">
							<div class="card-body">
								<h4 class="card-title">
									<a href="#">내가 쓴 댓글</a>
								</h4>
								<ul>
									<li>하나</li>
									<li>둘</li>
									<li>셋</li>
								</ul>
							</div>
							<div class="card-footer">
								<small class="text-muted float-right"><a href="">더보기</a></small>
							</div>
						</div>
					</div>
			
					<div class="col-10 my-5 border boder-secondary" style="margin: 0 auto;">
						<form class="w-50 mb-2 mt-2" style="margin: 0 auto;">
							<h4 class="my-3">회원정보수정</h4>
							<div class="form-group">
								<label for="exampleInputEmail1">Email address</label> 
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp"> 
							</div>
							<div class="form-group">
								<label for="exampleInputPassword1">Password</label> 
								<input type="password" class="form-control" id="exampleInputPassword1">
							</div>
							<button type="submit" class="btn btn-primary float-right mb-5">Submit</button>
						</form>
					</div>

				</div>
				<!-- 내가 쓴 리뷰,내가 쓴 댓글 row -->

				</div>
			
			</div>
		
	   </div>
	   <!-- /상단로우 -->
	</div>
	<!-- /.container -->

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js"></script>

</body>

</html>