<%@page import="review.dao.ReviewDao"%>
<%@page import="review.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum=Integer.parseInt(request.getParameter("bnum"));
	System.out.print("bnum:"+bnum);
	String rname=request.getParameter("rname");
	String user_id=(String)session.getAttribute("id");
	String rimg= request.getParameter("rimg");
	String rcontent=request.getParameter("content");
	int rscore=Integer.parseInt(request.getParameter("rscore"));
	ReviewDto dto=new ReviewDto();
	
	dto.setBnum(bnum);
	dto.setUser_id(user_id);
	dto.setRname(rname);
	dto.setRimg(rimg);
	dto.setRcontent(rcontent);
	dto.setRscore(rscore);
	ReviewDao.getInstance().insert(dto);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script>
		alert("리뷰가 저장되었습니다");
		location.href="../book/book_info.jsp?bnum=<%=bnum%>";
	</script>
</body>
</html>