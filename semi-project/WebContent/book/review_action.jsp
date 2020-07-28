<%@page import="review.dao.ReviewDao"%>
<%@page import="review.dto.ReviewDto"%>
<%@page import="review.dto.ReviewDto"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<%
		String id = (String) session.getAttribute("id");
		int bnum=Integer.parseInt(request.getParameter("bnum"));
		//한 페이지에 나타낼 row 의 갯수
		final int PAGE_ROW_COUNT = 5;
		
		//보여줄 페이지의 번호
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		System.out.println("page-"+pageNum);
		//보여줄 페이지의 번호가 파라미터로 전달되는지 읽어와 본다.
		//보여줄 페이지 데이터의 시작 ResultSet row 번호
		int startRowNum = 1 + (pageNum - 1) * PAGE_ROW_COUNT;
		//보여줄 페이지 데이터의 끝 ResultSet row 번호
		int endRowNum = pageNum * PAGE_ROW_COUNT;
		

		//전체 row 의 갯수를 읽어온다.
		int totalRow = ReviewDao.getInstance().getCount(bnum);
		//전체 페이지의 갯수 구하기
		int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

		ReviewDto dto = new ReviewDto();
		dto.setBnum(bnum);
		dto.setStartRowNum(startRowNum);
		dto.setEndRowNum(endRowNum);
		//System.out.println("total-"+totalRow);
		//System.out.println("start-"+dto.getStartRowNum());
		//System.out.println("end-"+dto.getEndRowNum());
		//1. DB 에서 글 목록을 얻어온다.
		List<ReviewDto> list = ReviewDao.getInstance().getListb(dto);
		System.out.println("list: " +list);

	%>
	<%for (ReviewDto tmp : list) {%>
		<tr>
			<td><%=tmp.getUser_id()%></td>
			<td>
				<a class="reviewBtn" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">
					<%=tmp.getRname()%>
					<input type="hidden" id="rnum" value="<%=tmp.getRnum()%>" />
				</a>
			</td>
			<td><%=tmp.getRscore()%>/5</td>
			<td><%=tmp.getRdate()%></td>
		</tr>
	<%}%>
	<script>
			$(".reviewBtn").on("click",function() {
				var rnum=$(this).children("#rnum").val();
				
				alert(rnum);
				
				$.ajax({
					"method":"post",
					"url":"viewReview.jsp",
					"data":"rnum="+rnum,
					"success": function(data) {
						$(".modal-content").html(data);
					},
					"error": function(a,b,c) {
						console.log(a+" "+b+" "+c);
					}
				});
			});
			
			
	</script>
	