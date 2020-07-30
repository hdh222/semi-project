<%@page import="java.net.URLEncoder"%>
<%@page import="member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String url=request.getParameter("url");
	String encodedUrl=URLEncoder.encode(url);	

	String id=request.getParameter("email");    
	String pwd=request.getParameter("pwd");
	
	String name=MemberDao.getInstance().login(id, pwd);
	boolean result= false;
	if(name != null) {
		result=true;
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>
	<%  if(result) {
			session.setAttribute("id", id);
			session.setAttribute("name", name);
			session.setMaxInactiveInterval(3000);
			response.sendRedirect(url);
	    }else { %>	
			<script>
				alert('로그인에 실패하였습니다. 아이디 비밀번호를 확인 해주세요.');
				location.href="loginform.jsp?url="+encodedUrl;
			</script>
    <%  } %>
	%>
</body>
</html>