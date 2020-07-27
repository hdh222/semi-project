<%@page import="comment.dao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	int cnum=Integer.parseInt(request.getParameter("cnum"));

	boolean result=CommentDao.getInstance().delete(cnum);
%>

{"isResult":"<%=result %>"}
