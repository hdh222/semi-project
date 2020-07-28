<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String id=(String)session.getAttribute("id");
	
%>
<style>
.
</style>
<div class="container">
	<header class="blog-header py-3">
		<div
			class="row flex-nowrap justify-content-between align-items-center">
			<div class="col-4 pt-1">
				<a class="text-muted" href="#">Subscribe</a>
			</div>
			<div class="col-4 text-center">
				<a id="logo"class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/index.jsp">
					<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-book" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					  <path fill-rule="evenodd" d="M3.214 1.072C4.813.752 6.916.71 8.354 2.146A.5.5 0 0 1 8.5 2.5v11a.5.5 0 0 1-.854.354c-.843-.844-2.115-1.059-3.47-.92-1.344.14-2.66.617-3.452 1.013A.5.5 0 0 1 0 13.5v-11a.5.5 0 0 1 .276-.447L.5 2.5l-.224-.447.002-.001.004-.002.013-.006a5.017 5.017 0 0 1 .22-.103 12.958 12.958 0 0 1 2.7-.869zM1 2.82v9.908c.846-.343 1.944-.672 3.074-.788 1.143-.118 2.387-.023 3.426.56V2.718c-1.063-.929-2.631-.956-4.09-.664A11.958 11.958 0 0 0 1 2.82z"/>
					  <path fill-rule="evenodd" d="M12.786 1.072C11.188.752 9.084.71 7.646 2.146A.5.5 0 0 0 7.5 2.5v11a.5.5 0 0 0 .854.354c.843-.844 2.115-1.059 3.47-.92 1.344.14 2.66.617 3.452 1.013A.5.5 0 0 0 16 13.5v-11a.5.5 0 0 0-.276-.447L15.5 2.5l.224-.447-.002-.001-.004-.002-.013-.006-.047-.023a12.582 12.582 0 0 0-.799-.34 12.96 12.96 0 0 0-2.073-.609zM15 2.82v9.908c-.846-.343-1.944-.672-3.074-.788-1.143-.118-2.387-.023-3.426.56V2.718c1.063-.929 2.631-.956 4.09-.664A11.956 11.956 0 0 1 15 2.82z"/>
					</svg>
				 This out!
				 </a>
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
		<a class="p-3 mx-lg-5 text-muted" href="#">U.S.</a>
		<a class="p-3 mx-lg-5 text-muted" href="#">Technology</a> 
		<a class="p-3 mx-lg-5 text-muted" href="#">Design</a>
		<a class="p-3 mx-lg-5 text-muted" href="${pageContext.request.contextPath}/mypage/mypage.jsp">My Page</a>
	</nav>
</div>
