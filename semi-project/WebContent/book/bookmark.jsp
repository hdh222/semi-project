<%@page import="book.dao.BookDao"%>
<%@page import="book.dto.BookMarkDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	BookMarkDto dto = new BookMarkDto(id, bnum);
	
	boolean isSuccess = false;
	boolean isCheck = false;
	
	isCheck = BookDao.getInstance().selectMark(dto);
	
	if(!isCheck){
		isSuccess = BookDao.getInstance().insert(dto);
	}else{
		BookDao.getInstance().delete(dto);
	}
	
	
	
%>
<% if(isSuccess){%>
	{"result" : "북마크가 추가됨"}
<%}else{%>
	{"result" : "북마크 목록에서 삭제됨"}
<%}%>