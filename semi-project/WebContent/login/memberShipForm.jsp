<%@page import="java.util.ArrayList"%>
<%@page import="member.dao.MemberDao"%>
<%@page import="member.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("utf-8");

	String id=request.getParameter("email");
	MemberDto dto=null;
	ArrayList<String> phone=new ArrayList<String>();
	
	if(id !=null) {
		dto=MemberDao.getInstance().getData(id);
		String[] emp=dto.getUser_phone().split("-");
		phone.add(emp[0]);
		phone.add(emp[1]);
		phone.add(emp[2]);
	} else {
		dto=new MemberDto("","","",0,"","");
		phone.add("");
		phone.add("");
		phone.add("");
	}
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>memberShip</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
</head>

<body>
    <div class="card p-5" style="width:700px;">
        <h3><%if(id==null) {%>회원가입<%}else {%>회원정보 수정<%} %></h3>
        <hr />
        <form action="<%if(id==null) {%>memberShip.jsp<%}else {%>update.jsp<%} %>" method="post" id="memberForm">
        	<input type="hidden" id="confirmID" name="confirmID" />
            <div class="form-group row">
                <label for="email" class="col-sm-2 col-form-label">이메일</label>
                <div class="col-sm-6">
                    <input type="email" <%if(id != null) {%>readonly<%} %>class="form-control" id="email" name="email" value="<%=dto.getUser_id()%>"/>
                    <div id="wrap">
    					
  					</div>
                </div>
                <%if(id == null) {%>
                <div class="col-sm-3">
                    <button type="button" class="btn btn-outline-secondary" id="confirmBtn">중복 확인</button>
                </div>
                <%} %>
            </div>
            <%if(id == null) {%>
            <div class="form-group row">
                <label for="pwd" class="col-sm-2 col-form-label">비밀번호</label>
                <div class="col-sm-6">
                    <input type="password" class="form-control" id="pwd" name="pwd"/>
                </div>
            </div>
            <%} %>
            <div class="form-group row">
                <label for="name" class="col-sm-2 col-form-label">이 름</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="name" name="name"  value="<%=dto.getUser_name()%>"/>
                </div>
            </div>
            <%if(id== null) { %>
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
            <%} %>
            <div class="form-group row">
                <label for="phone" class="col-sm-2 col-form-label">전화번호</label>
                <div class="input-group col-sm-6" id="phone">
                      <input type="text" class="form-control" aria-label="Text input with dropdown button" name="phone1" id="phone1" value="<%=phone.get(0)%>"/>
                      <input type="text" class="form-control" aria-label="Text input with dropdown button" name="phone2" id="phone2" value="<%=phone.get(1)%>"/>
                      <input type="text" class="form-control" aria-label="Text input with dropdown button" name="phone3" id="phone3" value="<%=phone.get(2)%>"/>
                </div>
            </div>
            <div class="form-group row mb-5">
                <label for="addr" class="col-sm-2 col-form-label">주 소</label>
                <div class="col-sm-6">
                    <input type="text" class="form-control" id="addr" name="addr" value="<%=dto.getUser_addr()%>"/>
                </div>
            </div>


            <div class="form-group">
				<div class="float-right mr-sm-3">
					<button type="submit" class="btn btn-outline-primary"><%if(id==null) {%>가입<%}else { %>변경<%} %></button>
					<button type="reset" class="btn btn-outline-secondary">취소</button>
				</div>
			</div>
        </form>
    </div>

    <script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/popup.js"></script>
	<script>
		var isConfirm=false;
		$("#confirmBtn").on("click",function() {
			var email=$("#email").val();
			
			$.ajax({
				method:"post",
				url:"checkId.jsp",
				data:"id="+email,
				success:function(data){
					if(data.isMember == "true") {
						$("#email").removeClass("is-valid").addClass("is-invalid");
						$("#wrap").removeClass("valid-feedback").addClass("invalid-feedback").text("등록된 이메일 입니다.");
						$("#confirmID").val("");
						
						isConfirm=false;
						
					} else {			
						$("#email").addClass("is-valid").removeClass("is-invalid");
						$("#wrap").addClass("valid-feedback").removeClass("invalid-feedback").text("등록가능한 이메일 입니다.");
						$("#confirmID").val(email);
						
						isConfirm=true;
					}
				}
			});
		});
		
		$("#memberForm").submit(function() {
			if($.trim($("#email").val())=="") {
				alert("이메일을 입력하세요.");
				return false;
			}
			<%if(id==null) {%>
			else if($.trim($("#pwd").val())=="") {
				alert("비밀번호를 입력하세요.");
				return false;
			}
			<%} %>
			else if($.trim($("#name").val())=="") {
				alert("이름을 입력하세요.");	
				return false;
			}
			<%if(id==null) {%>
			else if($("input:radio[name='sex']").is(":checked")==false) {
				alert("성별을 골라주세요.");
				return false;
			}
			<%} %>
			else if($("#phone1").val()=="" || $("#phone2").val()=="" || $("#phone3").val()=="") {
				alert("전화 번호를 입력하세요.");
				return false;
			}else if($.trim($("#addr").val())=="") {
				alert("주소를 입력하세요.");
				return false;
			}
			<%if(id==null) {%>
			else if(isConfirm == false) {
				alert("이메일 중복확인 하세요.");
				return false;
			}
			<%}%>
		});
		
	</script>
</body>

</html>