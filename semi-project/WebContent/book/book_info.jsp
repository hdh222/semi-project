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
<style>
	footer{
		text-align:center;
	}
</style>
</head>
<style>
	@font-face { font-family: 'Arita-buri-SemiBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-buri-SemiBold.woff') format('woff'); font-weight: normal; font-style: normal; }

	#container{
		width:800px;
		margin:0 auto;		
	}
	.container{
		font-family:'Arita-buri-SemiBold'; 
	 	border:2px solid tomato;
	 	margin-top:50px;
	
	 	
	}
	.right{
		width:460px;
		height:651px;
		
	}
	.col-6{
		height:100%
	}
	.position-relative{
		width:480px;
		height:286px;
		border:1px solid green;
	}
	footer{
		width:100%;
		height:150px;
		margin-top:100px;
		border:1px soild red;
	}
	#story{
		width:470px;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 9; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap:break-word; 
		line-height: 1.5em;
		height: 13.5em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
	}
	
</style>

<%
	int num = Integer.parseInt(request.getParameter("bnum"));
	BookDao dao=BookDao.getInstance();
	BookDto dto=dao.getData(num);
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
							<h3 class="border-bottom border-success">리뷰<a href="../review/review_write.jsp?bnum=<%=dto.getBnum() %>" class="float-right font-weight-bold" style="font-size:15px">리뷰작성</a></h3>
							<div style=" width:480px; height:286px;">
								<table style="font-size:7px">
									<thead>
									 	<tr>
									 		<th>아이디</th>
									 		<th>작성일</th>
									 		<th>제목</th>
									 		<th>내용</th>
									 	</tr>
									</thead>
									<tr>
										<td>stau04</td>
										<td>2020-07-06</td>
										<td>5가지 사랑의 언어에 대하여</td>
										<td><a href="">비단 부부, 연인들뿐만이 아닌 자신의 주위사람과의 관계에 대해 돌아보게 될 것이다. 저자가 이야기하는 5가지 사랑의 언어를 
										이해하고 상대방의 제1의 사랑의 언어로 구사하는 것을 배우게 되면 상대방의 행동에 즉각적인 변화가 나타날 것이다.</a></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- footer -->
		<jsp:include page="../include/footer.jsp"></jsp:include>
</body>
</html>