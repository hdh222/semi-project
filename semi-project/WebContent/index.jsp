<%@page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author"
	content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Jekyll v4.0.1">
<title>index page</title>

<link rel="canonical"
	href="https://getbootstrap.com/docs/4.5/examples/blog/">

<!-- Bootstrap core CSS -->
<link href="${pageContext.request.contextPath }/css/bootstrap.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}
</style>
<!-- Custom styles for this template -->
<link
	href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900"
	rel="stylesheet">
<!-- Custom styles for this template -->
<link href="${pageContext.request.contextPath }/css/blog.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath }/css/carousel.css"
	rel="stylesheet" />
</head>

<body>
	<jsp:include page="/include/header.jsp"></jsp:include>
	<div class="container">
		<div class="input-group mb-3 w-50 container">
			<input type="text" class="form-control"
				placeholder="Recipient's username" aria-label="Recipient's username"
				aria-describedby="button-addon2">
			<div class="input-group-append">
				<button class="btn btn-outline-secondary" type="button"
					id="button-addon2">
					<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20"
						fill="none" stroke="currentColor" stroke-linecap="round"
						stroke-linejoin="round" stroke-width="2" class="mx-3" role="img"
						viewBox="0 0 24 24" focusable="false">
            <title>Search</title>
            <circle cx="10.5" cy="10.5" r="7.5" />
            <path d="M21 21l-5.2-5.2" />
          </svg>
				</button>
			</div>
		</div>

		<div id="wrap">
			<ul class="slide">
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
				<li>
					<div class="card" style="width: 18rem;">
						<picture class="shadow">
						<source
							srcset="${pageContext.request.contextPath }/image/book.PNG"
							type="image/svg+xml">
						<img src="${pageContext.request.contextPath }/image/book.PNG"
							class="img-fluid img-thumbnail" alt="..."> </picture>
						<div class="card-body">
							<p class="card-text">Some quick example text to build on the
								card title and make up the bulk of the card's content.</p>
						</div>
					</div>
				</li>
			</ul>


			<div class="prev">
				<svg width="2em" height="2em" viewBox="0 0 16 16"
					class="bi bi-caret-left-fill" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
          <path
						d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
        </svg>
			</div>
			<div class="next">
				<svg width="2em" height="2em" viewBox="0 0 16 16"
					class="bi bi-caret-right-fill bi-light" fill="currentColor"
					xmlns="http://www.w3.org/2000/svg">
          <path
						d="M12.14 8.753l-5.482 4.796c-.646.566-1.658.106-1.658-.753V3.204a1 1 0 0 1 1.659-.753l5.48 4.796a1 1 0 0 1 0 1.506z" />
        </svg>
			</div>
		</div>

		<div class="row mb-2">
			<div class="col-6">
				<!--ƒ…∑Øºø-->
				<div class="card">
					<legend class="p-2">
						Ω≈∞£ µµº≠
						<button class="btn btn-outline-secondary btn-sm float-right mr-3">
							<svg width="1em" height="1em" viewBox="0 0 16 16"
								class="bi bi-plus" fill="currentColor"
								xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd"
									d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z" />
                <path fill-rule="evenodd"
									d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z" />
              </svg>
						</button>
					</legend>
					<jsp:include page="new.jsp"></jsp:include>
				</div>
				<!--ƒ…∑Øºø-->
			</div>

			<div class="col-md-6">
				<div class="card">
					<table class="table table-hover mb-0">
						<legend class="p-2">
							√÷±Ÿ ∏Æ∫‰
							<button class="btn btn-outline-secondary btn-sm float-right mr-3">
								<svg width="1em" height="1em" viewBox="0 0 16 16"
									class="bi bi-plus" fill="currentColor"
									xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd"
										d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z" />
                  <path fill-rule="evenodd"
										d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z" />
                </svg>
							</button>
						</legend>
						<thead>
							<tr>
								<th scope="col">#</th>
								<th scope="col">First</th>
								<th scope="col">Last</th>
								<th scope="col">Handle</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<th scope="row">1</th>
								<td>Mark</td>
								<td>Otto</td>
								<td>@mdo</td>
							</tr>
							<tr>
								<th scope="row">2</th>
								<td>Jacob</td>
								<td>Thornton</td>
								<td>@fat</td>
							</tr>
							<tr>
								<th scope="row">3</th>
								<td colspan="2">Larry the Bird</td>
								<td>@twitter</td>
							</tr>
							<tr>
								<th scope="row">4</th>
								<td colspan="2">Larry the Bird</td>
								<td>@twitter</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="row mb-3">
			<div class="col">
				<button>
					<img src="${pageContext.request.contextPath }/image/link.PNG"
						alt="...">
				</button>
			</div>
			<div class="col">
				<button>
					<img src="${pageContext.request.contextPath }/image/link.PNG"
						alt="...">
				</button>
			</div>
			<div class="col">
				<button>
					<img src="${pageContext.request.contextPath }/image/link.PNG"
						alt="...">
				</button>
			</div>
			<div class="col">
				<button>
					<img src="${pageContext.request.contextPath }/image/link.PNG"
						alt="...">
				</button>
			</div>
			<div class="col">
				<button>
					<img src="${pageContext.request.contextPath }/image/link.PNG"
						alt="...">
				</button>
			</div>
		</div>



	</div>
	<!-- /.container -->

	<footer class="blog-footer">
		<p>
			Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a>
			by <a href="https://twitter.com/mdo">@mdo</a>.
		</p>
		<p>
			<a href="#">Back to top</a>
		</p>
	</footer>

	<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/carousel.js"></script>
</body>

</html>