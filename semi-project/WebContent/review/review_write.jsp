<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/blog.css" />
</head>

<body>

	<jsp:include page="../include/header.jsp"></jsp:include>
	<div class="container-sm">
		<div class="my-4 py-4">
			<h3 class="p-2">Review 작성</h3>
			<hr class="mt-0" />
			<form action="review_insert.jsp" method="post">
				<div class="form-group row">
					<label for="review_name"
						class="col-sm-2 col-form-label text-center">제목</label>
					<div class="col-sm-10">
						<input type="text"
							class="form-control-plaintext border-bottom"
							id="review_name">
					</div>
				</div>

				<div class="form-group row">
					<label for="review_file"
						class="col-sm-2 col-form-label text-center">첨부</label>
					<div class="col-sm-10">

						<div class="custom-file">
							<input type="file" class="custom-file-input"
								id="inputGroupFile01" aria-describedby="inputGroupFileAddon01">
							<label class="custom-file-label" for="inputGroupFile01">Choose
								file</label>
						</div>
					</div>
				</div>
				<div class="form-group row">
					<label for="review_content"
						class="col-sm-2 col-form-label text-center">내용</label>
					<div class="col-sm-10">
						<textarea name="review_content" class="w-100 border border-secondary" rows="10" style="resize:none; border-color:gray; "id="review_content"></textarea>
					</div>
				</div>
				
				<div class="form-group row float-right">
					<button type="submit" class="btn btn-primary mr-2">작성</button>
					<button type="reset" class="btn btn-primary mr-2">취소</button>
				</div>	
			</form>

		</div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>

</body>

</html>