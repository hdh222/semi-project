<%@page import="comment.dao.CommentDao"%>
<%@page import="comment.dto.CommentDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rnum=Integer.parseInt(request.getParameter("rnum"));
	String user_id=request.getParameter("id");
	String ccontent=request.getParameter("review_comment");
	
	CommentDto dto=new CommentDto(0,rnum,user_id,null,ccontent,0);
	
	boolean result=CommentDao.getInstance().insert(dto);
	int totalCount=CommentDao.getInstance().getCount(rnum);
	
	int endPage=(int)Math.ceil(totalCount/5.0);
%>

{"isResult":"<%=result %>","endPage":"<%=endPage%>"}