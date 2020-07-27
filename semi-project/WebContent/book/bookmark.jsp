<%@page import="book.dao.BookDao"%>
<%@page import="book.dto.BookMarkDto"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String id = request.getParameter("id");
	int bnum = Integer.parseInt(request.getParameter("bnum"));
	
	BookMarkDto dto = new BookMarkDto(id, bnum);
	
	String isSuccess = "";
	boolean isCheck = false;
	
	isCheck = BookDao.getInstance().selectMark(dto);
	
	if(!isCheck){
		isSuccess = BookDao.getInstance().insert(dto);
	}else{
		BookDao.getInstance().delete(dto);
		isSuccess = "북마크 목록에서 삭제되었습니다.";
	}
	
	
	
%>
{"result" : "<%=isSuccess %>"}
