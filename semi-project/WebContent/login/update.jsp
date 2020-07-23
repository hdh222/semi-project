<%@page import="member.dto.MemberDto"%>
<%@page import="member.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("email");
	String name=request.getParameter("name");
	String phone1=request.getParameter("phone1");
	String phone2=request.getParameter("phone2");
	String phone3=request.getParameter("phone3");
	String addr=request.getParameter("addr");
	
	String phone=phone1+"-"+phone2+"-"+phone3;
	
	MemberDto dto=new MemberDto(id,null,name,0,phone,addr);
	
	boolean result=MemberDao.getInstance().update(dto);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update</title>
</head>
<body>
<%if(result) {
	
	session.setAttribute("name", name);
%>
	<script>
		alert("회원정보가 수정되었습니다.");
		 opener.location.reload();
		 window.close();
	</script>
<%}else { %>
	<script>
		alert("회원정보 수정에 실패 하였습니다.");
		histoy.go(-1);
	</script>
<%} %>
</body>
</html>