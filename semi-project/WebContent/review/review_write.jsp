<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	int num=Integer.parseInt(request.getParameter("bnum"));
	System.out.print("bnum:"+num);
%>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/blog.css" />
<style>
#star i{ text-decoration: none; color: gray; } 
#star i.on{ color: red; }
</style>
</head>

<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container-sm py-3">
		<div class="my-4 py-4">
			
			<h3 class="p-2">Review 작성</h3>
			<hr class="mt-0" />
			<form action="review_insert.jsp" method="post">
				<input type="hidden" name="bnum" value="<%=num%>"/>
				<div class="form-group row">
					<label for="rname" class="col-sm-2 col-form-label text-center mt-4">제목</label>
					<div class="col-sm-10  mb-2 mt-4">
						<input type="text"class="form-control-plaintext border-bottom" name="rname" id="rname">
					</div>
				</div>
				<div class="form-group row">
					<label for="user_id" class="col-sm-2 col-form-label text-center mt-4">작성자</label>
					<div class="col-sm-10  mb-2 mt-4">
						<input type="text"class="form-control-plaintext border-bottom" name="user_id" id="user_id">
					</div>
				</div>
				<div class="form-group row">
					<label for="rimg"class="col-sm-2 col-form-label text-center">첨부</label>
					<div class="col-sm-10  mb-2">
						<div class="custom-file">
							<input type="file" class="custom-file-input" id="rimg" name="rimg" aria-describedby="inputGroupFileAddon01">
							<label class="custom-file-label" for="rimg">Choose file</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="rcontent" class="col-sm-2 col-form-label text-center">내용</label>
					<div class="col-sm-10  mb-2">
						<textarea name="rcontent" class="w-100 border border-secondary" rows="10" style="resize:none; border-color:gray; "id="rcontent"></textarea>
					</div>
				</div>
				<div class="form-gruop row">
					<label for="rscore" class="col-sm-2 col-form-label text-center">평점</label>
					<div class="col-sm-10 mb-2">
						<P id="star"> 
							<i  value="1">★</i> 
							<i  value="2">★</i> 
							<i  value="3">★</i>
							<i  value="4">★</i> 
							<i  value="5">★</i> 
							<strong></strong>
						<p>
						<input type="hidden" name="rscore" id="rscore" value="" />
					</div>
				</div>
				<div class="form-group row float-right my-4 ">
					<button type="submit" class="btn btn-primary mr-2">작성</button>
					<button type="reset" class="btn btn-primary mr-2">취소</button>
				</div>	
			</form>
		
		</div>
	</div> <!-- .container -->
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	

<script src="${pageContext.request.contextPath}/js/header.js"></script>
<script src="../js/jquery-3.5.1.min.js"></script>
<!-- 별점기능 제이쿼리 -->
<script>
	$('#star i').on('click',function(){
		$(this).parent().children("i").removeClass("on");
		$(this).addClass("on").prevAll("i").addClass("on");
		$("strong").text($(this).attr("value"));
		$("#rscore").val($(this).attr("value"));
	})
</script>
</body>

</html>