<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("utf-8");

	String id=(String)session.getAttribute("id");
%>
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
		<!--제목 -->
		<h1 class="border-bottom">MY PAGE</h1>
		<div class="row">
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

		<div class="card py-3">
			<h3 class="ml-4">회원정보 수정</h3>
			<hr />
            <form action="${pageContext.request.contextPath}/login/memberShipForm.jsp" target="update" method="post" id="checkPwd">
                <div class="w-50 mx-auto my-3">
                    <div class="form-group m-0">
                        <label for="email">ID</label>
                        <input type="email" readonly class="form-control" id="email" name="email"
                            aria-describedby="emailHelp" value="<%=id %>" />
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password</label>
                        <input type="password" class="form-control" id="pwd" name="pwd" placeholder="password" />
                    </div>
                    <button type="button" class="btn btn-primary float-right" id="nextBtn">다음</button>
                </div>
             </form>
       	 </div>
	</div> <!-- .container -->

	<!-- Footer -->
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<!-- Bootstrap core JavaScript -->
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/carousel.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script>
		$("#nextBtn").on("click",function() {
			if($.trim($("#pwd").val())=="") {
				alert("비밀번호를 입력 해수세요.");
				return false;
			}
			
			var id=$("#email").val();
			var pwd=$("#pwd").val();
			
			$.ajax({
				method:"post",
				url:"${pageContext.request.contextPath}/login/checkPwd.jsp",
				data:"id="+id+"&pwd="+pwd,
				success:function(data){
					if(data.isTrue == "true") {
						window.open("", "update", 'width=700, height=570'); 
						$("#checkPwd").submit();
					}else {
						alert("현재 비밀번호가 일치하지 않습니다.");
					}
				}
			});
		});
	</script>
</body>

</html>