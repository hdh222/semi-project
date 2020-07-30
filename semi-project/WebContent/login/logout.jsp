<%@page import="org.apache.jasper.tagplugins.jstl.core.Remove"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Logout</title>
</head>
<body>
	<%
		session.removeAttribute("id");
		session.removeAttribute("name");
		response.sendRedirect(request.getContextPath()+"/index.jsp");
	%>
</body>
</html>