
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<title>Movie page</title>

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/font.css" />
<link href="${pageContext.request.contextPath }/css/blog.css" rel="stylesheet" />


</head>

<body>
	<jsp:include page="/include/header.jsp">
		<jsp:param value="1" name="nav_index"/>
	</jsp:include>
	
	<div class="container">
		<img src="${pageContext.request.contextPath}/image/warning.jpeg" alt="점검중.." class="w-100"/>
	</div>
	<!--/.container -->

	<jsp:include page="../include/footer.jsp"></jsp:include>
	
	<script src="${pageContext.request.contextPath}/js/jquery-3.5.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/header.js"></script>
</body>

</html>