<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/blog/">

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
</head>
<body>
 	<jsp:include page="/include/carousel2.jsp"></jsp:include>
 	
 	
 	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/carousel.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
	<script>
	 $(".bookInfo").on("click",function() {
     	$(this).children("form").submit();
     });
	</script>
</body>
</html>