<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="book.dto.BookDto"%>
<%@page import="book.dao.BookDao"%>
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
	
	#story {
		width: 100%;
		overflow: hidden;
		text-overflow: ellipsis;
		display: -webkit-box;
		-webkit-line-clamp: 3; /* 라인수 */
		-webkit-box-orient: vertical;
		word-wrap: break-word;
		line-height: 1.5em;
		height: 4.5em;
		/* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
	}
	
	.book_img {
		width:148px;
	}
	
	.list_info {
		cursor: pointer;
	}
	.select-icon {
		border-bottom: 5px solid tomato;
		opacity: 1.5;
		
	}
</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookList.css" />
</head>
<body>
	
	<jsp:include page="/include/header.jsp">
		<jsp:param value="0" name="nav_index"/>
	</jsp:include>
	<%@include file="search_action.jsp" %>
	
	<div class="container">
	<form action="book_list.jsp" method="get">
		<div class="input-group my-3 w-50 container">
						<input type="text" class="form-control"
							placeholder="search book" aria-label="Recipient's username"
							aria-describedby="button-addon2" name="keyword" value="<%=keyword %>">
						<div class="input-group-append">
							<button class="btn btn-outline-secondary" type="submit"
								id="button-addon2">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
									fill="none" stroke="currentColor" stroke-linecap="round"
									stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
									viewBox="0 0 24 24" focusable="false">
						            <title>Search</title>
						            <circle cx="10.5" cy="10.5" r="7.5" />
						            <path d="M21 21l-5.2-5.2" />
						          </svg>
							</button>
						</div>
		</div>	<!-- search -->
	</form>	
		
		<div class="container card my-3">  <!-- sort -->
			<div class="row px-3" id="article">
				<div class="col px-0">
					<a href="book_list.jsp?sort=1"><button class="btn btn-link w-100 px-0">
						<img class="menu_icon my-3"
							src="https://image.flaticon.com/icons/svg/867/867746.svg" alt="" />
						<p class="text-dark icon-text">컴퓨터/IT</p>
					</button></a>
				</div>

				<div class="col px-0">
					<a href="book_list.jsp?sort=2"><button class="btn btn-link w-100 px-0">
						<img class="menu_icon my-3"
							src="https://image.flaticon.com/icons/svg/3164/3164118.svg"
							alt="" />
						<p class="text-dark icon-text">경제/경영</p>
					</button></a>
				</div>

				<div class="col px-0">
					<a href="book_list.jsp?sort=3"><button class="btn btn-link w-100 px-0">
						<img class="menu_icon my-3"
							src="https://image.flaticon.com/icons/svg/2970/2970729.svg"
							alt="" />
						<p class="text-dark icon-text">예술</p>
					</button></a>
				</div>
				<div class="col px-0">
					<a href="book_list.jsp?sort=4"><button class="btn btn-link w-100 px-0">
						<img class="menu_icon my-3"
							src="https://image.flaticon.com/icons/svg/841/841988.svg" alt="" />
						<p class="text-dark icon-text">과학</p>
					</button></a>
				</div>

				<div class="col px-0">
					<a href="book_list.jsp?sort=5"><button class="btn btn-link w-100 px-0">
						<img class="menu_icon my-3"
							src="https://cdn3.iconfinder.com/data/icons/eldorado-stroke-buildings/40/church-512.png"
							alt="" />
						<p class="text-dark icon-text">종교</p>
					</button></a>
				</div>
		
				<div class="col px-0">
					<a href="book_list.jsp?sort=6"><button class="btn btn-link w-100 px-0">
						<img class="menu_icon my-3"
							src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-time-17.png"
							alt="" />
						<p class="text-dark icon-text">역사</p>
					</button></a>
				</div>
			</div>
		</div>
		
		<div class="container my-3 card">   <!-- book list -->
			<ul class="list-unstyled">
			<%if(totalRow > 0){ %>
				<%for(int i = 0; i < list.size(); i++){
					BookDto tmp = list.get(i);
				%>
				
					<li class="media my-4 border rounded list_info">
						<input type="hidden" id="bnum" value="<%=tmp.getBnum() %>" />
						<img src="<%=tmp.getBimg() %>" class="mr-5 list_img border-right shadow book_img" alt="..." />
						<div class="media-body my-auto mr-5">
							<h5 class="mt-0 my-2">
								<Strong><%=tmp.getBname() %></Strong>
							</h5>
							<small class="text-muted">저자 : <%=tmp.getBauthor() %> , 출판사 : <%=tmp.getBcompany() %> , 출간일 : <%=tmp.getBdate() %></small> <br />
							<p id="story"><%=tmp.getBstory().replace("*", " ") %></p>
						</div>
					</li>				
				<%} %>
				
				<%}else{ %>
					<li class="media my-4 border list_info"><img style = "width:100%; height : 100%;"
					src="${pageContext.request.contextPath }/image/search_empty.JPG"
					class="mr-5 list_img border-right" alt="...">
					
					<br>
					
				<%} %>
			</ul>
			<div class="">
				<nav aria-label="책 리스트 페이지네이션">
					<ul class="pagination justify-content-center">
					<%if(startPageNum != 1){ %>
						<li class="page-item"><a class="page-link" href="book_list.jsp?pageNum=<%=startPageNum-1%>&sort=<%=sort%>&keyword=<%=encodedK %>">Previous</a></li>
					<%} %>
						<!-- for문으로 페이지네이션 -->
						<%for(int i=startPageNum; i<=endPageNum; i++) {	%>
						
							<%if(i==pageNum){ %>
								<li class="page-item active"><a class="page-link" href="book_list.jsp?pageNum=<%=i %>&sort=<%=sort%>&keyword=<%=encodedK %>"><%=i %></a></li>
							<%}else{ %>
								<li class="page-item"><a class="page-link" href="book_list.jsp?pageNum=<%=i %>&sort=<%=sort%>&keyword=<%=encodedK %>"><%=i %></a></li>
							<%} %>
							
						<%} %>
						<%if(endPageNum < totalPageCount){ %>
							<li class="page-item"><a class="page-link" href="book_list.jsp?pageNum=<%=endPageNum+1 %>&sort=<%=sort%>&keyword=<%=encodedK %>">Next</a></li>
						<%} %>
					</ul>
				</nav>
			</div>

		</div>

	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>

	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script>
		$(document).ready(function() {
			var icon=$("#article").children(".col")[<%=(sort-1)%>];
			$(icon).addClass("select-icon");
		});
		
		$(".list_info").on("click",function() {
			var bnum=$(this).children("#bnum").val();
			location.href="book_info.jsp?bnum="+bnum;
		});
	</script>
</body>
</html>