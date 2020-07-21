<%@page import="member.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	boolean result=false;
	String id=request.getParameter("id");
	String pwd=request.getParameter("pwd");
	String name=MemberDao.getInstance().login(id, pwd);
	
	
	if(name != null) {
		result=true;
	}
	
%>

{"isTrue": "<%=result %>"}