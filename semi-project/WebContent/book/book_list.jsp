<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.List"%>
<%@page import="book.dto.BookDto"%>
<%@page import="book.dao.BookDao"%>
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

</style>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bookList.css" />
</head>
<body>
	<%
	int sort = 1;
	String strsort = request.getParameter("sort");
	
	if(strsort != null){
		sort = Integer.parseInt(request.getParameter("sort"));
	}
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT = 5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT = 5;

	//보여줄 페이지의 번호
	int pageNum = 1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum != null) {//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum = Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	/*
		검색 키워드 관련 처리
	*/
	String keyword = request.getParameter("keyword");
	if(keyword == null){
		keyword="";
	}
	String encodedK=URLEncoder.encode(keyword);	

	//검색 키워드와 startRowNum, endRowNum 을 담을 FileDto 객체 생성
	BookDto dto=new BookDto();
	dto.setBname(keyword);
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//select 된 결과를 담을 List
	List<BookDto> list=null;
	//전체 row 의 갯수를 담을 변수 
	int totalRow=0;
	
	if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
		dto.setBname(keyword);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		list = BookDao.getInstance().getSearchList(dto);
		totalRow = BookDao.getInstance().getSearchCount(keyword);
	}else{
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setBsort(sort);
		//FileDto 객체를 인자로 전달해서 파일 목록을 얻어온다.
		list = BookDao.getInstance().getList(dto);
		//전체 row 의 갯수를 읽어온다.
		totalRow = BookDao.getInstance().getCount(sort);
	}
	
	//전체 페이지의 갯수 구하기
	int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	//끝 페이지 번호가 잘못된 값이라면 
	if (totalPageCount < endPageNum) {
		endPageNum = totalPageCount; //보정해준다. 
	}
	
		
	%>
	
	<jsp:include page="/include/header.jsp"></jsp:include>

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
		<div class="container card my-4">
			<div class="row mt-5 mb-4" id="article">
				<div class="col-2">
					<a href="book_list.jsp?sort=1"><button class="btn btn-link">
						<img id="computer" class="menu_icon"
							src="https://image.flaticon.com/icons/svg/867/867746.svg" alt="" />
							<p class="mt-3 text-dark">컴퓨터/IT</p>
					</button></a>
				</div>

				<div class="col-2">
					<a href="book_list.jsp?sort=2"><button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/3164/3164118.svg"
							alt="" />
						<p class="mt-3 text-dark">경제/경영</p>
					</button></a>
				</div>

				<div class="col-2">
					<a href="book_list.jsp?sort=3"><button class="btn btn-link mx-3">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/2970/2970729.svg"
							alt="" />
						<p class="mt-3 text-dark">예술</p>
					</button></a>
				</div>

				<div class="col-2">
					<a href="book_list.jsp?sort=4"><button class="btn btn-link">
						<img class="menu_icon"
							src="https://image.flaticon.com/icons/svg/841/841988.svg" alt="" />
						<p class="mt-3 text-dark">과학</p>
					</button></a>
				</div>

				<div class="col-2">
					<a href="book_list.jsp?sort=5"><button class="btn btn-link">
						<img class="menu_icon"
							src="https://cdn3.iconfinder.com/data/icons/eldorado-stroke-buildings/40/church-512.png"
							alt="" />
							<p class="mt-3 text-dark">종교</p>
					</button></a>
				</div>

				<div class="col-2">
					<a href="book_list.jsp?sort=6"><button class="btn btn-link">
						<img class="menu_icon"
							src="https://cdns.iconmonstr.com/wp-content/assets/preview/2017/240/iconmonstr-time-17.png"
							alt="" />
						<p class="mt-3 text-dark">역사</p>
					</button></a>
				</div>
			</div>
		</div>
		
		<div class="container my-5 card">
			<ul class="list-unstyled">

				<%for(int i = 0; i < list.size(); i++){
					BookDto tmp = list.get(i);
				%>
				
					<li class="media my-4 border list_info"><img
					src="<%=tmp.getBimg() %>"
					class="mr-5 list_img border-right pr-5" alt="...">
					<div class="media-body">
						<h5 class="mt-0 my-2">
							<a class="text-dark" href="book_info.jsp?bnum=<%=tmp.getBnum()%>"><Strong><%=tmp.getBname() %></Strong></a>
						</h5>
						<small>저자 : <%=tmp.getBauthor() %> , 출판사 : <%=tmp.getBcompany() %> , 출간일 : <%=tmp.getBdate() %></small> <br />
						<br />
						<p id="story"><%=tmp.getBstory() %></p>
					</div></li>
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
</body>
</html>