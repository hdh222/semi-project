<%@page import="member.dao.MemberDao"%>
<%@page import="member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
		request.setCharacterEncoding("utf-8");
	
		String email=request.getParameter("confirmID");
		String pwd=request.getParameter("pwd");
		String name=request.getParameter("name");
		int sex=Integer.parseInt(request.getParameter("sex"));
		String phone1=request.getParameter("phone1");
		String phone2=request.getParameter("phone2");
		String phone3=request.getParameter("phone3");
		String phone=phone1+"-"+phone2+"-"+phone3;
		String addr=request.getParameter("addr");
		
		MemberDto dto=new MemberDto(email,pwd,name,sex,phone,addr);
		
		boolean result=MemberDao.getInstance().insert(dto);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
</head>
<body>
	<div class="container card">
	<%  if(result) {%>
			<h3 class="text-center text-muted py-5 my-5">회원가입을 환영합니다.</h3>
        	<div class="d-flex justify-content-center py-5 my-5">
            	<button type="button" class="btn btn-outline-secondary w-25" onclick="self.close();">닫기</button>
        	</div>
	<%} else { %>
			<h3 class="text-center text-muted py-5 my-5">회원가입에 실패하였습니다. 다시 시도 해주세요.</h3>
        	<div class="d-flex justify-content-center py-5 my-5">
            	<button type="button" class="btn btn-outline-secondary w-25" onclick="history.go(-1);">다시 시도</button>
        	</div>
	<%} %>
	</div>
</body>
</html>