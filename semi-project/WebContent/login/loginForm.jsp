<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// url 파라미터가 넘어오는지 읽어와 보기 
	String url=request.getParameter("url");
	
	if(url==null){//목적지 정보가 없다면
		String cPath=request.getContextPath();
		url=cPath+"/index.jsp"; //로그인후 인덱스 페이지로 가도록 하기 위해 
	}
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/blog.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
</head>

<body>
	
	<jsp:include page="/include/header.jsp"></jsp:include> 
	<div class="container">
    <div class="my-5 py-5">
        <h3 class="p-2">LOGIN</h3>
        <hr class="mt-0" />

        <div class="row">
            <div class="col-lg-6 card py-5">
                <form action="login.jsp" method="post" id="loginForm">
                	<input type="hidden" name="url" value="<%=url %>" />
                    <div class="form-group m-0">
                        <label for="email">ID</label>
                        
                        <input type="email" class="form-control col-10" id="email" name="email"
                            aria-describedby="emailHelp" placeholder="example@email.com" />
                    </div>
                    <div class="form-group">
                        <label for="pwd">Password</label>
                        <input type="password" class="form-control col-10" id="pwd" name="pwd" placeholder="password" />
                    </div>
                    <div class="form-group form-check">
                        <input type="checkbox" class="form-check-input" id="idCheck" name="idCheck" value="1">
                        <label class="form-check-label" for="idCheck">ID 저장</label>
                    </div>
                    <button type="submit" class="btn btn-primary">로그인</button>
                </form>
                <hr />
                <a  href="javascript:window.open('memberShipForm.jsp','memberShip','width=700,height=570,scroll')">회원이 아니신가요? 회원가입</a>
                <a  href="javascript:window.open('checkId_Form.jsp','memberShip','width=700,height=570')">비밀번호를 잊으셨나요?</a>
            </div>
            <div class="col-md-6 p-0" id="carousel">
                <div id="carouselExampleSlidesOnly" class="carousel slide card px-2 py-5" data-ride="carousel" data-interval="2000">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/image/pn1.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/pn2.png" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/pn3.png" class="d-block w-100" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
	</div>
	<jsp:include page="../include/footer.jsp"></jsp:include>


    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
    <script src="${pageContext.request.contextPath}/js/header.js"></script>
    <script>
    $("#loginForm").submit(function() {
		if($.trim($("#email").val())=="") {
			alert("이메일을 입력하세요.");
			return false;
		}else if($.trim($("#pwd").val())=="") {
			alert("비밀번호를 입력하세요.");
			return false;
		}
	});
    </script>
</body>

</html>