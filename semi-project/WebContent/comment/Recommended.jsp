<%@page import="java.net.URLDecoder"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="comment.dao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");
	String cnum=request.getParameter("cnum");
	String[] cnums=null;
	String value="";
	Cookie[] cookies=request.getCookies();
	int count=0;
	boolean isVaild=false; //쿠키가 있는지 확인
	boolean isSave=false; //쿠기에 해당 데이터 있는지 확인(cnum)
	
	for(Cookie c:cookies) {
		if(c.getName().equals(URLEncoder.encode(id))) {
			isVaild=true;
			cnums=URLDecoder.decode(c.getValue()).split(",");
			for(String tmp:cnums) {
				if(tmp.equals(cnum)) {
					isSave=true;
					break;
				}
			}
			break;
		}
	}
	
	if(!isSave) {
		
		boolean result=CommentDao.getInstance().addRecommend(Integer.parseInt(cnum));
		
		if(isVaild) {
			for(int i=0;i<cnums.length;i++) {
				value+=cnums[i]+",";
			}
			value+=cnum;
		} else {
			value=cnum;
		}
		
		Cookie cookie=new Cookie(URLEncoder.encode(id),URLEncoder.encode(value));
		cookie.setMaxAge(7*24*60*60);
		cookie.setPath("/");
		
		response.addCookie(cookie);
		
		if(result) {
			count=CommentDao.getInstance().countRecommend(Integer.parseInt(cnum));
		}
	}
	
%>
{"Recommend":"<%=count %>"}

