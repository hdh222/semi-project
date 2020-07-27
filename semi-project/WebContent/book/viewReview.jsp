<%@page import="book.dao.BookDao"%>
<%@page import="book.dto.BookDto"%>
<%@page import="review.dao.ReviewDao"%>
<%@page import="review.dto.ReviewDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rnum=Integer.parseInt(request.getParameter("rnum"));
	ReviewDto dto=ReviewDao.getInstance().getdata(rnum);
	BookDto BookInfo=BookDao.getInstance().getData(dto.getBnum());
%>
	<div class="modal-header">

				<span><strong id="caption"><%=dto.getUser_id()%>님의 리뷰</strong></span>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">

				<h3 class="border-bottom border-success"><%=BookInfo.getBname()%></h3>

				<p class="small my-1" id="id">
					글쓴이 :
					<%=dto.getUser_id()%>
					<span class="ml-5">get</span><span class="float-right" id="rdate"><%=dto.getRdate()%></span>
				</p>
				<!-- review_menu -->
				<ul class="nav nav-tabs mt-lg-5" id="myTab" role="tablist">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" id="home-tab" data-toggle="tab"
						href="#home" role="tab" aria-controls="home" aria-selected="true">책
							소개</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						id="profile-tab" data-toggle="tab" href="#profile" role="tab"
						aria-controls="profile" aria-selected="false">댓글</a></li>
				</ul>
				<div class="tab-content" id="myTabContent">
					<div class="tab-pane fade show active" id="home" role="tabpanel"
						aria-labelledby="home-tab">
						<p id="review_content" class="my-lg-5"><%=dto.getRcontent()%></p>

						<p class="float-right text-muted"><small>
							저자 :
							<%=BookInfo.getBauthor()%>,&nbsp;&nbsp;출판사 :
							<%=BookInfo.getBcompany()%>,&nbsp;&nbsp; 출간일 :
							<%=BookInfo.getBdate()%></small></p>
					</div>

					<div class="tab-pane fade" id="profile" role="tabpanel"
						aria-labelledby="profile-tab">
						<h3 class="pt-3">댓글</h3>
						<hr />
						<div class="pb-3 mb-5 w-100">  <!-- 댓글 작성 창 -->
							<form action="../comment/insert.jsp" method="post" id="commentForm">
								<input type="hidden" name="rnum" value="<%=dto.getRnum() %>" />
								<input type="hidden" name="id" value="<%=(String)session.getAttribute("id") %>" />
								<textarea class="form-control mt-lg-5 mb-lg-2" name="review_comment" placeholder="댓글을 입력 해주세요.(300자 이하)"></textarea>
								<div class="float-right">
									<button type="button" id="commentBtn" class="btn btn-primary mt-3 mr-2">작성</button>
									<button type="reset" class="btn btn-primary mt-3">지우기</button>
								</div>
							</form>
						</div>
						<div id="commentField"><!-- 댓글 목록 -->
													
						</div>
					</div>
				</div>
			</div>
			
			<script>
			function loadComment() {
				$.ajax({
					"method":"post",
					"url":"../comment/load.jsp",
					"data":"rnum=<%=dto.getRnum()%>",
					"success":function(data) {
						$("#commentField").html(data);
					}
				});
			}
			
			$(document).ready(function() {
				loadComment();
			});
			
			$("#commentBtn").on("click",function() {
				var url=$("#commentForm").attr("action");
				var method=$("#commentForm").attr("method");
				var data=$("#commentForm").serialize();
				
				$.ajax({
					"method":method,
					"url":url,
					"data":data,
					"success": function(d) {
						if(d.isResult=="true") {
							$("#commentForm").children("textarea").val("");
							loadComment();
						}
					},
					"error": function(a,b,c) {
						console.log(a+" "+b+" "+c);
					}
				});
			});
			</script>
			<script>
			var currentPage = 1;
			//전체 페이지의 수를 javascript 변수에 담아준다.
			var totalPageCount =<%=totalPageCount%>;
			$(".loader").hide();
			//웹브라우저에 scoll 이벤트가 일어 났을때 실행할 함수 등록 
			$("#more").on("click", function() {
			var displayRowNum=$("#reviewTable").children("tbody").children().length;
				if(displayRowNum == <%=totalRow%>&&<%=totalRow%>!=0){
					$("#reviewList").append("<div style='width:100%; text-align:center; font-size:12px;'>마지막 리뷰 입니다.</div>")
					$("#more")
					.hide();
				}
				if (currentPage == totalPageCount||<%=totalRow%>==0) {//만일 마지막 페이지 이면 
					return; //함수를 여기서 종료한다. 
				}
				//위쪽으로 스크롤된 길이 구하기
				//var scrollTop = $("#reviewList").scrollTop();
				//window 의 높이
				var listHeight = $("#reviewList").height();
				//document(문서)의 높이
				//var tableHeight = $("#reviewTable").height();
				//바닥까지 스크롤 되었는지 여부
				//var isBottom = scrollTop + listHeight-16> tableHeight;
				//if (isBottom) {//만일 바닥까지 스크롤 했다면...
					//로딩 이미지 띄우기
					
					$(".loader").show();
					currentPage++; //페이지를 1 증가 시키고 
					//해당 페이지의 내용을 ajax  요청을 해서 받아온다. 
					setTimeout(function() {
						$.ajax({
							url : "review_action.jsp",
							method : "get",
							data : {pageNum:currentPage,bnum:<%=num%>},
							success : function(data) {	 
									$("#reviewTable tbody").append(data);
									//로딩 이미지를 숨긴다. 
									$(".loader").hide();
									}
								});
							}, 2000);
					});
			</script>