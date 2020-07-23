<%@page import="review.dto.ReviewDto"%>
<%@page import="java.util.List"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="book.dto.BookDto"%>
<%@page import="book.dao.BookDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link rel="stylesheet" href="../css/blog.css" />
<link rel="stylesheet" href="../css/book_info.css" />
</head>
<!-- modal style -->
<style>
.modal-content {
	width:800px;
	height:  autopx;
	margin:0 auto;
}
.modal-content img{
	width:400px;
	height:300px;
	text-align: center;
}


#review_content {
	line-height: 30px;
}

</style>

<%
	request.setCharacterEncoding("UTF-8");
	int num = Integer.parseInt(request.getParameter("bnum"));
	List<ReviewDto> list=ReviewDao.getInstance().getList(num);
	BookDao dao=BookDao.getInstance();
	BookDto dto=dao.getData(num);
	int rnum=1;
	System.out.println(rnum);
%>
<body>
		<!-- 헤더 -->
		<header>
			<jsp:include page="../include/header.jsp"></jsp:include>
		</header>
		<div id="container">
				<!-- 메뉴바 -->
			    <div class="nav-scroller py-1 mb-2">
				</div>	
		</div>
			<!--이미지 col-6 -->		
			<div class="container card">
				<div class="row">
					<div class="col-lg-6 ">
						 <img src="<%=dto.getBimg() %>" alt="bookimg" class="my-5 ml-xl-5 border border-success"/>
					</div>
			<!-- 책정보 col-6 -->
					<div class="col-lg-6 ">
						<div class="right mt-5">
							<h2><strong><%=dto.getBname() %></strong></h2>
							<p class="border-bottom border-success" ><%=dto.getBcompany()%>, <%=dto.getBdate()%></p>
							<h3 >줄거리</h3>
							<p class="font-weight-light" style="font-size:12px" id="story"><%=dto.getBstory() %></p>
							<h3 class="border-bottom border-success">리뷰<a href="../review/review_write.jsp?bnum=<%=num%>"
							 class="float-right font-weight-bold" style="font-size:12px">리뷰작성</a></h3>
							<div style=" width:480px; height:286px;">
								<table class="table border-bottom" style="font-size:10px" >
									<thead class="thead border-bottom">
									 	<tr>
									 		<th>번호</th>
									 		<th>아이디</th>
									 		<th>제목</th>
									 		<th>별점</th>
									 		<th>작성일</th>
									 	</tr>
									</thead>
									<%for(ReviewDto tmp:list){ %>
										<tr>
											<td id="rnum"><%=tmp.getRnum() %></td>
											<td><%=tmp.getUser_id() %></td>
											<td>
												<a id="reviewBtn" type="button" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><%=tmp.getRname() %></a>
											<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
												aria-labelledby="exampleModalLabel" aria-hidden="true">
												<div class="modal-dialog modal-xl" role="document">
													<div class="modal-content">
														<div class="modal-header">
															<span><strong><%=tmp.getUser_id()%>님의 리뷰</strong></span>
															<button type="button" class="close" data-dismiss="modal"
																aria-label="Close">
																<span aria-hidden="true">&times;</span>
															</button>
														</div>
														<div class="modal-body">
					
																	<h3 class="border-bottom border-success"><%=dto.getBname() %></h3>
										
																	<p class="small my-1">
																		글쓴이 : <%=tmp.getUser_id()%> <span class="ml-5">get</span><span
																			class="float-right"><%=tmp.getRdate() %></span>
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
																			<p id="review_content" class="my-lg-5"><%=tmp.getRcontent() %></p>
																				
																			<p class="float-right" >저자 : <%=dto.getBauthor() %>,&nbsp;&nbsp;출판사 : <%=dto.getBcompany() %>,&nbsp;&nbsp; 출간일 : <%=dto.getBdate() %></p>	
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
											</td>
											<td><%=tmp.getRscore()%>/5 </td>
											<td><%=tmp.getRdate() %></td>
										</tr>
									<%} %>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
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