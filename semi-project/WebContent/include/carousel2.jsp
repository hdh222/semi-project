<%@page import="book.dao.BookDao"%>
<%@page import="book.dto.BookDto"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	ArrayList<BookDto> newBook = BookDao.getInstance().getNewList();

%>
<style>
.carousel {
	margin: 0;
	padding: 0;
}

img {
	margin: 0 auto;
	padding: 0;
}
</style>

<div id="carouselExampleControls" class="carousel slide card border-0"
	data-ride="carousel">
	<div class="carousel-inner mb-0 py-4">

		<%
			boolean act = true;
		for (BookDto tmp : newBook) {
			String story=tmp.getBstory().replace("*"," ");
		%>

		<div class="carousel-item <%if (act) {%>active<%act = false; }%>">
			<div class="media">
				<img src="<%=tmp.getBimg()%>" class="shadow mx-3" alt="..." width="150px"
					height="200px">
				<div class="media-body mx-3">
					<h5 class="mt-0"><strong><%=tmp.getBname()%></strong></h5>
					<p class="text-right mr-3"><small><%=tmp.getBdate()%> 출간</small></p>
					<%=story %>...
				</div>
			</div>
		</div>
		<%
			}
		%>

		<a class="carousel-control-prev"
			href="#carouselExampleControls" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon bg-secondary" aria-hidden="true"></span> <span
			class="sr-only">Previous</span>
		</a> <a class="carousel-control-next"
			href="#carouselExampleControls" role="button" data-slide="next">
			<span class="carousel-control-next-icon bg-secondary" aria-hidden="true"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
</div>