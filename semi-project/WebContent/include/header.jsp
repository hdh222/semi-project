<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String id=(String)session.getAttribute("id");
	
	String index=request.getParameter("nav_index");
	
	if(index == null) {
		index="";
	}
%>
<style>
	.menu_select {
		border-bottom: 5px solid rgba(144, 198, 230, 0.774);
	}
	#logo{
		width:90px;
		height: auto;
	}
</style>
<div class="container">
	<input type="hidden" id="index" value="<%=index %>" />
	<header class="blog-header py-3">
		<div
			class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1">
				<a class="text-muted" href="#">Subscribe</a>
			</div>
			<div class="col-4 text-center">
				<a href="${pageContext.request.contextPath}/index.jsp"><img id="logo" src="${pageContext.request.contextPath}/image/logoG.png" alt="" /></a>
			</div>
			<div class="col-4 d-flex justify-content-end align-items-center">
				<%if(id == null) {%>
					<a class="btn btn-sm btn-outline-secondary" href="${pageContext.request.contextPath}/login/loginForm.jsp">Sign in</a>
				<%} else { 
					String name=(String)session.getAttribute("name");
				%>
					
					<p id="login_status" class="text-muted m-0"><span><%=name %>님 로그인</span> <a href="${pageContext.request.contextPath}/login/logout.jsp" class="btn btn-outline-secondary btn-sm mx-3" data-toggle="tooltip" title="<%=name %>">로그 아웃</a></p>
					
				<%} %>
			</div>
		</div>


	</header>
	
	<nav class="nav d-flex justify-content-center bg-white" id="nav">
		<a class="p-3 mx-lg-5 text-muted" href="${pageContext.request.contextPath }/book/book_list.jsp">Book</a> 
		<a class="p-3 mx-lg-5 text-muted" href="${pageContext.request.contextPath}/emptyPage/movie.jsp">Movie</a>
		<a class="p-3 mx-lg-5 text-muted" href="${pageContext.request.contextPath}/emptyPage/music.jsp">Musical</a> 
		<a class="p-3 mx-lg-5 text-muted" href="${pageContext.request.contextPath}/emptyPage/FAQ.jsp">FAQ</a>
		<a class="p-3 mx-lg-5 text-muted" href="${pageContext.request.contextPath}/mypage/mypage.jsp">My Page</a>
	</nav>
</div>
