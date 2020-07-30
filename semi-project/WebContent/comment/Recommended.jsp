<%@page import="comment.dao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int cnum=Integer.parseInt(request.getParameter("cnum"));
	int count=0;
	boolean result=CommentDao.getInstance().addRecommend(cnum);
	
	if(result) {
		count=CommentDao.getInstance().countRecommend(cnum);
	}
%>
{"Recommned":"<%=count %>" }

