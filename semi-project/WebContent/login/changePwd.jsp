<%@page import="member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("id");
	String pwd=request.getParameter("npwd");
	
	boolean result=MemberDao.getInstance().changePwd(id, pwd);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<body>
	<div class="container card">
	<%  if(result) {%>
			<h3 class="text-center text-muted py-5 my-5">비밀번호가 변경 되었습니다.</h3>
        	<div class="d-flex justify-content-center py-5 my-5">
            	<button type="button" class="btn btn-outline-secondary w-25" onclick="self.close();">닫기</button>
        	</div>
	<%} else { %>
			<h3 class="text-center text-muted py-5 my-5">비밀번호 변경에 실패 하였습니다.</h3>
        	<div class="d-flex justify-content-center py-5 my-5">
            	<button type="button" class="btn btn-outline-secondary w-25" onclick="history.go(-1);">다시 시도</button>
        	</div>
	<%} %>
	</div>
</body>
</html>