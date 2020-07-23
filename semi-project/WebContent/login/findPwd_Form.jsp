<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String id=request.getParameter("email");
%>
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
	<div class="container card py-5">
		<h3>비밀번호 찾기</h3>
		<hr />
		<small class="text-muted mb-5">현재 비밀번호와 새로운 비밀번호를 입력 해주세요.</small>
		<form action="changePwd.jsp" action="post" id="changePwd">
			<input type="hidden" name="id" id="id" value="<%=id %>" />
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
					<button type="submit" class="btn btn-outline-primary" id="changeBtn">변경</button>
					<button type="button" class="btn btn-outline-secondary" onclick="self.close();">취소</button>
				</div>
			</div>
		</form>
	</div>
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script>
		
		$("#changeBtn").on("click",function() {
			var id=$("#id").val();
			var pwd=$("#pwd").val();
			
			if($.trim($("#pwd").val())=="") {
				alert("현재 비밀번호를 입력하지 않았습니다.");
				return false;
			}else if($.trim($("#npwd").val())=="") {
				alert("새 비밀번호를 입력하지 않았습니다.");
				return false;
			}else if($.trim($("#npwd_check").val())=="") {
				alert("새 비밀번호 확인을 입력하지 않았습니다.");
				return false;
			}else if($("#npwd").val() != $("#npwd_check").val()) {
				alert("새 비밀번호와 새 비밀번호 확인이 일치하지 않습니다.");
				return false;
			}
			
			$.ajax({
				method:"post",
				url:"checkPwd.jsp",
				data:"id="+id+"&pwd="+pwd,
				success:function(data){
					if(data.isTrue == "true") {
						$("#changePwd").submit();
					}else {
						alert("현재 비밀번호가 일치하지 않습니다.");
						return false;
					}
				}
			});
		});
		
		
	</script>
</body>
</html>