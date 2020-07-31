<%@page import="java.util.ArrayList"%>
<%@page import="comment.dao.CommentDao"%>
<%@page import="comment.dto.CommentDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int rnum=Integer.parseInt(request.getParameter("rnum"));
	int p=Integer.parseInt(request.getParameter("page"));	
	String id=(String)session.getAttribute("id");
	if(id == null) {
		id="";
	}
	ArrayList<CommentDto> result=CommentDao.getInstance().getList(rnum,p);
	
%>

<%for(CommentDto tmp:result) {%>
<div class="media py-2 border-top">
	<div class="media-body">
		<input type="hidden" id="cnum" value="<%=tmp.getCnum()%>"/>
	 	<Strong class="mt-0 mb-1"><%=tmp.getUser_id()%></Strong>
	 		<%if(tmp.getUser_id().equals(id)) {%>
			 	<button type="button" class="btn float-right deleteBtn">
			 		<svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
	 					<path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
	  					<path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					</svg>
			 	</button>
		 	<%}%>
		 	<br />
	 	<small class="text-muted"><%=tmp.getCdate()%></small><br />
	 	<%=tmp.getCcontent()%>
	 	<a class="float-right recommendBtn">
	 		<img src="${pageContext.request.contextPath}/image/good.png" alt=".." class="pb-1" style="width: 20px;" />
	 		<strong id="recommendNum"><%=tmp.getCrecommend() %></strong>
	 	</a>
	</div>
</div>
<%}%>
<script>
	$(".deleteBtn").on("click",function() {
		var cnum=$(this).prevAll("#cnum").val();

		$.ajax({
			method:"get",
			url:"${pageContext.request.contextPath}/comment/delete.jsp",
			data:"cnum="+cnum,
			success:function(data) {
				if(data.isResult == "true") {
					alert("정상적으로 삭제 되었습니다.");
					loadComment();
				} else {
					alert("삭제에 실패 하였습니다.");
				}
			}	
		});
	});
	
	$(".recommendBtn").on("click",function() {
		var id="<%=id%>";
		
		if(id != "") {
			var cnum=$(this).prevAll("#cnum").val();
			var field=$(this).children("#recommendNum");
			
			$.ajax({
				method:"get",
				url:"${pageContext.request.contextPath}/comment/Recommended.jsp",
				data:"cnum="+cnum,
				success:function(data) {
					if(data.Recommend == "0") {
						alert("7일 이내에 추천한 댓글 입니다.");
					} else {
					alert(field.parent().prevAll("strong").text()+"님을 추천하였습니다.");
					field.text(data.Recommend);
					}
				}
			});
		} else {
			var url=encodeURIComponent(window.location.href.replace("http://localhost:8888",""));
			alert("로그인 후에 이용 가능합니다.");
			location.href="${pageContext.request.contextPath}/login/loginForm.jsp?url="+url;
		}
	});
</script>