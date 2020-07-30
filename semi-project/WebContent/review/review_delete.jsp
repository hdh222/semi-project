<%@page import="comment.dao.CommentDao"%>
<%@page import="review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int rnum = Integer.parseInt(request.getParameter("rnum"));
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	CommentDao.getInstance().reviewDelete(rnum);
	ReviewDao.getInstance().delete(rnum);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		location.href="${pageContext.request.contextPath}/book/book_info.jsp?bnum=<%=bnum%>";
	</script>
</body>
</html>