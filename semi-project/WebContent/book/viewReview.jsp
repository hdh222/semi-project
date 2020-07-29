<%@page import="comment.dao.CommentDao"%>
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
	
	int totalPageCount=CommentDao.getInstance().getCount(rnum);
	int endPage=(int)Math.ceil(totalPageCount/5.0);
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
					<%=dto.getUser_id()%> &nbsp;&nbsp;
					평점 : 
					<%if(dto.getRscore() == 5){ %>
						★★★★★
					<%}else if(dto.getRscore() == 4){ %>
						★★★★☆
					<%}else if(dto.getRscore() == 3){ %>
						★★★☆☆
					<%}else if(dto.getRscore() == 2){ %>
						★★☆☆☆
					<%}else if(dto.getRscore() == 1){ %>
						★☆☆☆☆						
					<%}else{ %>
						잘못된 평점입니다.
					<%} %>
					<span class="float-right" id="rdate"><%=dto.getRdate()%></span>
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
						<h4 class="pt-3" id="comment_caption">댓글</h4>
						<hr />
						<div class="pb-3 mb-5 w-100">  <!-- 댓글 작성 창 -->
							<form action="${pageContext.request.contextPath }/comment/insert.jsp" method="post" id="commentForm">
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
						<hr class="mt-5"/>
						<span class="comment_loader">
							<img src="${pageContext.request.contextPath}/image/ajax-loader.gif" class="mx-auto"/>
						</span>
						<div class="text-center">
							<button id="comment_more" class="btn btn-light-sm ">더보기 <strong>+</strong></button>
						</div>
					</div>
				</div>
			</div>
			
			<script>
			var currentPage = 1;
			var totalPage =<%=endPage%>;
			
			function loadComment() {
				$.ajax({
					"method":"get",
					"url":"${pageContext.request.contextPath}/comment/load.jsp",
					"data":"rnum=<%=dto.getRnum()%>&page=1",
					"success":function(data) {
						$("#commentField").html(data);
						currentPage=1;
					}
				});
			}
			
			$(document).ready(function() {
				$(".comment_loader").hide();
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
							totalPage=d.endPage;
							loadComment();
						}
					},
					"error": function(a,b,c) {
						console.log(a+" "+b+" "+c);
					}
				});
			});
			
			
			
			$("#comment_more").on("click", function() {
				var displayRowNum=$("#commentField").children(".media").length;
				
				if (currentPage == totalPage ||<%=totalPageCount%>==0) {
					return;
				}
				
					
				$(".comment_loader").show();
				currentPage++;
				setTimeout(function() {
					$.ajax({
						url : "${pageContext.request.contextPath}/comment/load.jsp",
						method : "get",
						data : {page:currentPage,rnum:<%=rnum%>},
						success : function(data) {	
									$("#commentField").append(data);
									$(".comment_loader").hide();
								}
							});
						}, 2000);
				});
			</script>