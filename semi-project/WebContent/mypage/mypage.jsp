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
	href="${pageContext.request.contextPath }/css/bootstrap.min.css" />
<!-- Custom styles for this template -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/carousel.css" />
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/blog.css" />
</head>

<body>

	<!-- 헤더 -->
	<jsp:include page="../include/header.jsp"></jsp:include>
	<!-- Page Content -->
	<div class="container my-4 ">
		<!-- 상단로우 -->
		<div class="row">
			<!--제목 -->
			<h1 class="mx-3 my-3">MY PAGE</h1>
			<hr />
			<!-- 관심사 carousel 영역-->
			<div class="col-lg-12 px-0">
				<h4 class="my-4 ml-5">최근 관심사</h4>
				<jsp:include page="../include/carousel.jsp"></jsp:include>
			</div>
		</div>
				<!--내가 쓴 리뷰,내가 쓴 댓글 row-->
		<div class="row my-4">
			<div class="col-md-6 mb-5" id="listBox">
				<div class="card">
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

			<div class="col-md-6 mb-5" id="listBox">
				<div class="card">
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
		</div>
		<div class="row">
			<div class="col-10 my-sm-5 border boder-secondary mx-auto">
				<form class="w-50 mb-2 mt-2 mx-auto">
					<h4 class="my-3">회원정보수정</h4>
					<div class="form-group">
						<label for="exampleInputEmail1">Email address</label>
						<input type="email" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp">
					</div>
					<div class="form-group">
						<label for="exampleInputPassword1">Password</label> 
						<input type="password" class="form-control" id="exampleInputPassword1">
					</div>
					<button type="submit" class="btn btn-primary float-right mb-5">Submit</button>
				</form>
			</div>
		</div>
	</div> <!-- .container -->

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js"></script>

</body>

</html>