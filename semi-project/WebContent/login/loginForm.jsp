<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    
</head>

<body>
	
	<jsp:include page="../include/header.jsp"></jsp:include> 
	
    <div class="container mt-5">
        <h3 class="p-2">LOGIN</h3>
        <hr class="mt-0" />

        <div class="row">
            <div class="col-6 card p-5">
                <form>
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
                <a  href="#">회원이 아니신가요? 회원가입</a>
                <a  href="#">비밀번호를 잊으셨나요?</a>
            </div>
            <div class="col-6">
                <div id="carouselExampleSlidesOnly" class="carousel slide card" data-ride="carousel" data-interval="2000">
                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="${pageContext.request.contextPath}/image/img.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/img.jpg" class="d-block w-100" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="${pageContext.request.contextPath}/image/img.jpg" class="d-block w-100" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>