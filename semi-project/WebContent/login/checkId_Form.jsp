<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<style>
	@media(min-width : 0px ) {
		#label {
			 text-align: left;
		}
	}
	@media(min-width : 578px ) {
		#label {
			 text-align: right;
		}
	}
</style>
</head>
<body>
	<div class="container card py-5 my-5">
		<h3>비밀번호 찾기</h3>
		<hr />
		<small class="text-muted mb-5">비밀번호를 찾으실 email을 입력 해주세요.</small>
		<form action="findPwd_Form.jsp" id="checkId">
			<div class="form-group row mb-5">
				<label for="email" class="col-sm-4 col-form-label" id="label">Email</label>
				<div class="col-sm-4">
					<input type="email" class="form-control" id="email" name="email">
				</div>
			</div>
			<div class="form-group">
				<div class="float-right mr-sm-3">
					<button type="button" class="btn btn-outline-primary" id="nextBtn">다음</button>
					<button type="button" class="btn btn-outline-secondary" onclick="window.close();">취소</button>
				</div>
			</div>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script>
		$("#nextBtn").on("click",function() {
			var email=$("#email").val();
			
			
			$.ajax({
				method:"post",
				url:"checkId.jsp",
				data:"id="+email,
				success:function(data){
					if(data.isMember == "true") {
						$("#checkId").submit();
					} else {
						alert("등록된 아이디가 없습니다.");
					}
				}
			});
			
		});
	</script>
</body>
</html>