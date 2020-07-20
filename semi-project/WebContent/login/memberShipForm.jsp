<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberShip</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
</head>

<body>
    <div class="container col-6 card p-5">
        <h3>회원 가입</h3>
        <hr />
        <form>
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-6">
                    <input type="email" class="form-control" id="email" name="email" />
                </div>
                <div class="col-sm-3">
                    <a href="#" class="btn btn-outline-secondary">중복 확인</a>
                </div>
            </div>
            <div class="form-group row">
                <label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="pwd" name="pwd" />
                </div>
            </div>
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label">이 름</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="name" name="name" />
                </div>
            </div>
            <div class="form-group row">
                <label for="sex" class="col-sm-2 col-form-label">성 별</label>
                <div class="col-sm-6">
                    <div class="form-check form-check-inline" id="sex">
                        <input class="form-check-input" type="radio" name="sex" id="man" value="1">
                        <label class="form-check-label" for="man">남</label>
                      </div>
                      <div class="form-check form-check-inline">
                        <input class="form-check-input" type="radio" name="sex" id="woman" value="2">
                        <label class="form-check-label" for="woman">여</label>
                      </div>
                </div>
            </div>
            <div class="form-group row">
                <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
                <div class="input-group col-sm-6" id="phone">
                      <input type="text" class="form-control" aria-label="Text input with dropdown button" name="phone1">
                      <input type="text" class="form-control" aria-label="Text input with dropdown button" name="phone2">
                      <input type="text" class="form-control" aria-label="Text input with dropdown button" name="phone3">
                </div>
            </div>
            <div class="form-group row mb-5">
                <label for="addr" class="col-sm-2 col-form-label">주 소</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="addr" name="addr" />
                </div>
            </div>


            <div class="form-group row">
                <div class="col-sm-6"></div>
                <div class="col-sm-2">
                    <button type="submit" class="btn btn-outline-primary col-sm-10">가 입</button>
                </div>
                <div class="col-sm-2">
                    <button type="reset" class="btn btn-outline-secondary col-sm-10">취 소</button>

                </div>
            </div>
        </form>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>

</html>