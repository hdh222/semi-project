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
</head>
<style>
	@font-face { font-family: 'Arita-buri-SemiBold'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Arita-buri-SemiBold.woff') format('woff'); font-weight: normal; font-style: normal; }
	#container{
		width:800px;
		margin:0 auto;		
	}
	.container{
		font-family:'Arita-buri-SemiBold'; 
	 	height:750px;
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
	
</style>

<%
	BookDao dao=BookDao.getInstance();
	BookDto dto=dao.getData();
%>
<body>
	
		<div id="container">
		<!--헤더  -->
		    <header class="blog-header py-3">
		      <div class="row flex-nowrap justify-content-between align-items-center">
		        <div class="col-4 pt-1">
		          <a class="text-muted" href="#">Subscribe</a>
		        </div>
		        <div class="col-4 text-center">
		          <a class="blog-header-logo text-dark" href="#">Large</a>
		        </div>
		        <div class="col-4 d-flex justify-content-end align-items-center">
		          <a class="btn btn-sm btn-outline-secondary" href="#">Sign up</a>
		        </div>
		      </div>
		    </header>
				<!-- 메뉴바 -->
			    <div class="nav-scroller py-1 mb-2">
			      <nav class="nav d-flex justify-content-between">
			        <a class="p-2 text-muted" href="#">World</a>
			        <a class="p-2 text-muted" href="#">U.S.</a>
			        <a class="p-2 text-muted" href="#">Technology</a>
			        <a class="p-2 text-muted" href="#">Design</a>
			        <a class="p-2 text-muted" href="#">Culture</a>
			        <a class="p-2 text-muted" href="#">Business</a>
			        <a class="p-2 text-muted" href="#">Politics</a>
			        <a class="p-2 text-muted" href="#">Opinion</a>
			        <a class="p-2 text-muted" href="#">Science</a>
			        <a class="p-2 text-muted" href="#">Health</a>
			        <a class="p-2 text-muted" href="#">Style</a>
			        <a class="p-2 text-muted" href="#">Travel</a>
			      </nav>
				</div>	
		</div>
			<!--이미지 col-6 -->		
			<div class="container card">
				<div class="row">
					<div class="col-xl-6 ">
						 <img src="<%=dto.getBimg() %>" alt="bookimg" class="mt-5 ml-xl-5 border border-success"/>
					</div>
			<!-- 책정보 col-6 -->
					<div class="col-xl-6 ">
						<div class="right mt-5">
							<h2><strong><%=dto.getBname() %></strong></h2>
							<p class="border-bottom border-success"><%=dto.getBcompany()%>, <%=dto.getBdate()%></p>
							<h3 >줄거리</h3>
							<p class="font-weight-light" style="font-size:12px"><%=dto.getBstory() %></p>
							
							<h3 class="border-bottom border-success">리뷰</h3>
							<div style=" width:480px; height:286px; line-height:2em;overflow:auto; margin:0;">
								<h2>This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. </h2>
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
								This 'div' element uses 'overflow:scroll' to create scrollbars whenever the contents of the 'div' become too large. 
							</div>
						</div>
					</div>
				</div>
			</div>
		<!-- footer -->
		<footer>
			<div style="width:100%; height:100%; border-top:1px solid;"></div>
		</footer>
</body>
</html>