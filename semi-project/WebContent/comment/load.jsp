<%@page import="java.util.ArrayList"%>
<%@page import="comment.dao.CommentDao"%>
<%@page import="comment.dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rnum=Integer.parseInt(request.getParameter("rnum"));
	
	ArrayList<CommentDto> result=CommentDao.getInstance().getList(rnum);
	
%>

<%for(CommentDto tmp:result) {%>
<div class="media py-2 border-top">
	<div class="media-body">
	 	<Strong class="mt-0 mb-1"><%=tmp.getUser_id()%></Strong><br />
	 	<small class="text-muted"><%=tmp.getCdate()%></small><br />
	 	<%=tmp.getCcontent()%>
	</div>
</div>
<%}%>
<hr class="mt-5"/>