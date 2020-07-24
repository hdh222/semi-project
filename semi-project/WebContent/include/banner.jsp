<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/css/banner.css" />


 		<div id="banner_wrap" class="my-5 wrap_line">
 			<ul class="banner_slide" id="banner_slide">
				<li>
					<a href="javascript:window.open('http://www.kyobobook.co.kr');" class="btn btn-sm mx-0 banner">
						<img src="${pageContext.request.contextPath }/image/kyobo.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('https://www.aladin.co.kr');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/aladin.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('http://www.ypbooks.co.kr');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/yp.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('http://www.yes24.com');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/yes24.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('https://www.bookslibro.com');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/libro.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('https://ridibooks.com');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/ridi.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('http://book.interpark.com');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/inter.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('http://www.barobook.com');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/baro.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('http://www.bandinlunis.com');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/bandi.PNG"
							alt="...">
					</a>
				</li>
				<li>
					<a href="javascript:window.open('http://books.11st.co.kr');" class="btn btn-sm banner">
						<img src="${pageContext.request.contextPath }/image/11st.PNG"
							alt="...">
					</a>
				</li>
		</div>
 	
	<script>
		function Rslide() {
		       $('#banner_slide').animate({ left: -196 },6000, function () {   // 애니메이션 효과 slie전체 창에 위치를 좌측으로 1000px 당김 
		           $('#banner_slide li:first').appendTo('#banner_slide');  // 맨 첫번째를 맨뒤로 추가시킴
		           $('#banner_slide').css({ left: 0 })  //
		       });
	    }
	
		setInterval(Rslide, 10);
	</script>