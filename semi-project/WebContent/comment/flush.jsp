<%@page import="java.util.ArrayList"%>
<%@page import="comment.dao.CommentDao"%>
<%@page import="comment.dto.CommentDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rnum=Integer.parseInt(request.getParameter("rnum"));
	
	ArrayList<CommentDto> result=CommentDao.getInstance().getList(rnum);
	
	Object[] obj=result.toArray();
	CommentDto[] dto=new CommentDto[obj.length];


%>

{"isResult":"<%=result %>"}