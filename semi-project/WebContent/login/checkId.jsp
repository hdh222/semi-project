<%@page import="member.dao.MemberDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("id");
	boolean result=MemberDao.getInstance().isMember(id);
	
%>

{"isMember": "<%=result %>"}