<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
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
		<small class="text-muted mb-5">현재 비밀번호와 새로운 비밀번호를 입력 해주세요.</small>
		<form>
			<div class="form-group row mb-5">
				<label for="pwd" class="col-sm-4 col-form-label" id="label">현재 비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="pwd" name="pwd">
				</div>
			</div>
			<div class="form-group row mb-5">
				<label for="npwd" class="col-sm-4 col-form-label" id="label">새 비밀번호</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="npwd" name="npwd">
				</div>
			</div>
			<div class="form-group row mb-5">
				<label for="npwd_check" class="col-sm-4 col-form-label" id="label">새 비밀번호 확인</label>
				<div class="col-sm-4">
					<input type="password" class="form-control" id="npwd_check" >
				</div>
			</div>
			<div class="form-group">
				<div class="float-right mr-sm-3">
					<button type="submit" class="btn btn-outline-primary">변경</button>
					<button type="reset" class="btn btn-outline-secondary">취소</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>