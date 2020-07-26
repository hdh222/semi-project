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
						<div class="pb-3 mb-5 w-100">
							<form action="../comment/insert.jsp" method="post" id="commentForm">
								<input type="hidden" name="rnum" value="<%=dto.getRnum() %>" />
								<input type="hidden" name="id" value="<%=(String)session.getAttribute("id") %>" />
								<textarea class="form-control mt-lg-5 mb-lg-2" name="review_comment" placeholder="댓글을 입력 해주세요.(300자 이하)"></textarea>
								<div class="float-right">
									<button type="submit" class="btn btn-primary mt-3 mr-2">작성</button>
									<button type="reset" class="btn btn-primary mt-3">지우기</button>
								</div>
							</form>
						</div>
						<div>
							<div class="media py-2 border-top">
							  <div class="media-body">
	 							  <h5><Strong class="mt-0 mb-1">Media object</Strong></h5>
	 							  <small class="text-muted">2020-07-26</small><br />
	 							   Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	 						  </div>
							</div>
							<div class="media py-2 border-top">
							  <div class="media-body">
	 							  <h5><Strong class="mt-0 mb-1">Media object</Strong></h5>
	 							  <small class="text-muted">2020-07-26</small><br />
	 							   Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	 						  </div>
							</div>
							<div class="media py-2 border-top">
							  <div class="media-body">
	 							  <h5><Strong class="mt-0 mb-1">Media object</Strong></h5>
	 							  <small class="text-muted">2020-07-26</small><br />
	 							   Cras sit amet nibh libero, in gravida nulla. Nulla vel metus scelerisque ante sollicitudin. Cras purus odio, vestibulum in vulputate at, tempus viverra turpis. Fusce condimentum nunc ac nisi vulputate fringilla. Donec lacinia congue felis in faucibus.
	 						  </div>
							</div>
							<hr class="mt-5"/>
						</div>
						
					</div>
				</div>
			</div>