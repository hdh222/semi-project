<%@page import="review.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	request.setCharacterEncoding("utf-8");

	String id=(String)session.getAttribute("id");
	
	List<ReviewDto> list = ReviewDao.getInstance().getReviewList(id);
	
	ReviewDto data = null;
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
					<div class="card-body"  style="overflow-y: scroll; height : 300px;">
						<h4 class="card-title">
							<a href="#">내가 쓴 리뷰</a>
						</h4>
						<div class="table-responsiv">
							<table class="table table-light">
						<thead>
							<tr>
								<th class="text-center">평점</th>
								<th class="text-center">제목</th>
								<th class="text-center">작성일</th>
							</tr>
						</thead>
						<%for(ReviewDto tmp : list){ %>
							<tr>
								<td class="text-center"><%=tmp.getRscore() %></td>
								<td><a id="reviewBtn" type="button" data-toggle="modal" data-target="#ReviewModal" data-whatever="@mdo"><%=tmp.getRname()%></a>
								
								</td>
								<td class="text-center"><%=tmp.getRdate() %></td>
							</tr>
						<%} %>
						</table>
						</div>
						
					</div>
					
				</div>
			</div>

			<div class="col-md-6 mb-5" id="listBox">
				<div class="card">
					<div class="card-body" style="overflow-y: scroll; height : 300px;">
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
       	 
       	 <!-- 리뷰 modal -->
       	 <div class="modal fade" id="ReviewModal" tabindex="-1" role="dialog"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<span><strong><%=id%>님의 리뷰</strong></span>
						<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					
					<div class="modal-body">
					
						<h3 class="border-bottom border-success">리뷰 제목</h3>
										
							<p class="small my-1">
								글쓴이 : <%=id%>&nbsp;&nbsp; 작성일 : 0000.00.00 &nbsp;&nbsp; 평점 : ★★★★★
							</p>
																	
						<div class="modal-content" id="myTabContent">
																		
							<p id="review_content" class="my-lg-5">내용</p>
																				
							<p class="float-right" >저자 : 홍길동 ,&nbsp;&nbsp;출판사 : 길벗,&nbsp;&nbsp; 출간일 : 0000.00.00</p>	
												
						</div>
					</div>	<!-- modal body -->
				</div>	<!-- modal content -->
			</div>	<!-- modal-dialog -->
		</div> <!-- modal -->
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
				alert("비밀번호를 입력 해주세요.");
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