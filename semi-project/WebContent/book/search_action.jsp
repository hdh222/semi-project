<%@page import="book.dao.BookDao"%>
<%@page import="java.util.List"%>
<%@page import="book.dto.BookDto"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	int sort = 1;
	String strsort = request.getParameter("sort");
	
	if(strsort != null){
		sort = Integer.parseInt(request.getParameter("sort"));
	}
	
	//한 페이지에 나타낼 row 의 갯수
	final int PAGE_ROW_COUNT = 5;
	//하단 디스플레이 페이지 갯수
	final int PAGE_DISPLAY_COUNT = 5;

	//보여줄 페이지의 번호
	int pageNum = 1;
	//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.	
	String strPageNum = request.getParameter("pageNum");
	if (strPageNum != null) {//페이지 번호가 파라미터로 넘어온다면
		//페이지 번호를 설정한다.
		pageNum = Integer.parseInt(strPageNum);
	}
	//보여줄 페이지 데이터의 시작 ResultSet row 번호
	int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
	//보여줄 페이지 데이터의 끝 ResultSet row 번호
	int endRowNum = pageNum * PAGE_ROW_COUNT;
	/*
		검색 키워드 관련 처리
	*/
	String keyword = request.getParameter("keyword");
	if(keyword == null){
		keyword="";
	}
	String encodedK=URLEncoder.encode(keyword);	

	//검색 키워드와 startRowNum, endRowNum 을 담을 FileDto 객체 생성
	BookDto dto=new BookDto();
	dto.setBname(keyword);
	dto.setStartRowNum(startRowNum);
	dto.setEndRowNum(endRowNum);
	
	//select 된 결과를 담을 List
	List<BookDto> list=null;
	//전체 row 의 갯수를 담을 변수 
	int totalRow=0;
	
	if(!keyword.equals("")){ //만일 키워드가 넘어온다면 
		dto.setBname(keyword);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		list = BookDao.getInstance().getSearchList(dto);
		totalRow = BookDao.getInstance().getSearchCount(keyword);
	}else{
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		dto.setBsort(sort);
		//FileDto 객체를 인자로 전달해서 파일 목록을 얻어온다.
		list = BookDao.getInstance().getList(dto);
		//전체 row 의 갯수를 읽어온다.
		totalRow = BookDao.getInstance().getCount(sort);
	}
	
	//전체 페이지의 갯수 구하기
	int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);
	//시작 페이지 번호
	int startPageNum = 1 + ((pageNum - 1) / PAGE_DISPLAY_COUNT) * PAGE_DISPLAY_COUNT;
	//끝 페이지 번호
	int endPageNum = startPageNum + PAGE_DISPLAY_COUNT - 1;
	//끝 페이지 번호가 잘못된 값이라면 
	if (totalPageCount < endPageNum) {
		endPageNum = totalPageCount; //보정해준다. 
	}
	
		
	%>
	