<%@page import="java.util.ArrayList"%>
<%@page import="comment.dao.CommentDao"%>
<%@ page language="java" contentType="application/json; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=(String)session.getAttribute("id");	
	int cnum=Integer.parseInt(request.getParameter("cnum"));
	ArrayList<Integer> cnums=(ArrayList<Integer>)session.getAttribute(id);
	int count=0;
	
	boolean flag=false; //세션에 저장되있으면 true(추천 중복확인)
	
	if(cnums == null) {
		cnums=new ArrayList<>();
		cnums.add(cnum);
	}
	else {
		for(int tmp:cnums) {
			System.out.println(tmp);
			if(tmp == cnum) {
				flag=true;
				
			}
		}
		if(!flag) {
			cnums.add(cnum);
		}
	}
	
	if(!flag) {
		
		boolean result=CommentDao.getInstance().addRecommend(cnum);
		
		session.setAttribute(id, cnums);
		if(result) {
			count=CommentDao.getInstance().countRecommend(cnum);
		}
	}
	
%>
{"Recommend":"<%=count %>"}

