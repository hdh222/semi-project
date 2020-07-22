<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<%
	int num=Integer.parseInt(request.getParameter("bnum"));
	String user_id=(String)session.getAttribute("id");
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
#content{width:750px; height:440px;}
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
						<input type="text"class="form-control-plaintext border-bottom" name="user_id" id="user_id" value="<%=user_id%>" disabled>
					</div>
				</div>
				
				<div class="form-group row">
					<label for="content" class="col-sm-2 col-form-label text-center">내용</label>
					<div class="col-sm-10  mb-2">
						<textarea name="content" id="content"></textarea>
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
					<button type="submit" class="btn btn-primary mr-2" onclick="submitContents(this);">작성</button>
					<button type="reset" class="btn btn-primary mr-2">취소</button>
				</div>	
			</form>
		
		</div>
	</div> <!-- .container -->
	
	<jsp:include page="../include/footer.jsp"></jsp:include>
	

<script src="${pageContext.request.contextPath}/js/header.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	var oEditors = [];
	
	//추가 글꼴 목록
	//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
	
	nhn.husky.EZCreator.createInIFrame({
		oAppRef: oEditors,
		elPlaceHolder: "content",
		sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",	
		htParams : {
			bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
			fOnBeforeUnload : function(){
				//alert("완료!");
			}
		}, //boolean
		fOnAppLoad : function(){
			//예제 코드
			//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
		},
		fCreator: "createSEditor2"
	});
	
	function pasteHTML() {
		var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
		oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
	}
	
	function showHTML() {
		var sHTML = oEditors.getById["content"].getIR();
		alert(sHTML);
	}
		
	function submitContents(elClickedObj) {
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
		
		// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
		
		try {
			elClickedObj.form.submit();
		} catch(e) {}
	}
	
	function setDefaultFont() {
		var sDefaultFont = '궁서';
		var nFontSize = 24;
		oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
	}
</script>
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