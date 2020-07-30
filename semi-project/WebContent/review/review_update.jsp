<%@page import="review.dto.ReviewDto"%>
<%@page import="review.dao.ReviewDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int bnum=Integer.parseInt(request.getParameter("bnum"));
	int rnum=Integer.parseInt(request.getParameter("rnum"));
	String rname=request.getParameter("rname");
	String user_id=(String)session.getAttribute("id");
	String rimg= request.getParameter("rimg");
	String rcontent=request.getParameter("content");
	int rscore=Integer.parseInt(request.getParameter("rscore"));
	ReviewDto dto= new ReviewDto();
	dto.setRnum(rnum);
	dto.setRname(rname);
	dto.setUser_id(user_id);
	dto.setRimg(rimg);
	dto.setRcontent(rcontent);
	dto.setRscore(rscore);
	ReviewDao.getInstance().update(dto);
%>
<script>
	alert("수정되었습니다!");
	location.href="../book/book_info.jsp?bnum=<%=bnum%>"
</script>