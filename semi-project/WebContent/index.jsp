<%@page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
  <meta name="generator" content="Jekyll v4.0.1">
  <title>Blog Template °§ Bootstrap</title>

  <link rel="canonical" href="https://getbootstrap.com/docs/4.5/examples/blog/">

  <!-- Bootstrap core CSS -->
  <link href="css/bootstrap.css" rel="stylesheet">
  <link href="css/bootstrap.min.css" rel="stylesheet">
  <style>
    .bd-placeholder-img {
      font-size: 1.125rem;
      text-anchor: middle;
      -webkit-user-select: none;
      -moz-user-select: none;
      -ms-user-select: none;
      user-select: none;
    }

    @media (min-width: 768px) {
      .bd-placeholder-img-lg {
        font-size: 3.5rem;
      }
    }
  </style>
  <!-- Custom styles for this template -->
  <link href="https://fonts.googleapis.com/css?family=Playfair+Display:700,900" rel="stylesheet">
  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/css/blog.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/css/carousel.css" rel="stylesheet" />
</head>

<body>
<jsp:include page="/include/header.jsp"></jsp:include>
  <div class="container">
    <div class="input-group mb-3 w-50 container">
      <input type="text" class="form-control" placeholder="Recipient's username" aria-label="Recipient's username"
        aria-describedby="button-addon2">
      <div class="input-group-append">
        <button class="btn btn-outline-secondary" type="button" id="button-addon2">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor"
            stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"
            focusable="false">
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
            <picture>
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="card" style="width: 18rem;">
            <picture class="shadow">
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="card" style="width: 18rem;">
            <picture>
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="card" style="width: 18rem;">
            <picture>
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="card" style="width: 18rem;">
            <picture>
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="card" style="width: 18rem;">
            <picture>
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
        <li>
          <div class="card" style="width: 18rem;">
            <picture>
              <source srcset="${pageContext.request.contextPath }/image/book.PNG" type="image/svg+xml">
              <img src="${pageContext.request.contextPath }/image/book.PNG" class="img-fluid img-thumbnail" alt="...">
            </picture>
            <div class="card-body">
              <p class="card-text">Some quick example text to build on the card title and make up the bulk of the
                card's content.</p>
            </div>
          </div>
        </li>
      </ul>


      <div class="prev">
        <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-caret-left-fill" fill="currentColor"
          xmlns="http://www.w3.org/2000/svg">
          <path
            d="M3.86 8.753l5.482 4.796c.646.566 1.658.106 1.658-.753V3.204a1 1 0 0 0-1.659-.753l-5.48 4.796a1 1 0 0 0 0 1.506z" />
        </svg>
      </div>
      <div class="next">
        <svg width="2em" height="2em" viewBox="0 0 16 16" class="bi bi-caret-right-fill bi-light" fill="currentColor"
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
          <legend class="p-2">Ω≈∞£ µµº≠
            <button class="btn btn-light btn-sm float-right mr-3">
              <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z"/>
                <path fill-rule="evenodd" d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z"/>
              </svg>
            </button>
          </legend>
          <iframe src="new.jsp" frameborder="0" class="h-100" scrolling="no"></iframe>
        </div>
        <!--ƒ…∑Øºø-->
      </div>

      <div class="col-md-6">
        <div class="card">
          <table class="table table-hover mb-0">
            <legend class="p-2">√÷±Ÿ ∏Æ∫‰
              <button class="btn btn-light btn-sm float-right mr-3">
                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" d="M8 3.5a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5H4a.5.5 0 0 1 0-1h3.5V4a.5.5 0 0 1 .5-.5z"/>
                  <path fill-rule="evenodd" d="M7.5 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1H8.5V12a.5.5 0 0 1-1 0V8z"/>
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
          <img src="${pageContext.request.contextPath }/image/link.PNG" alt="...">
        </button>
      </div>
      <div class="col">
        <button>
          <img src="${pageContext.request.contextPath }/image/link.PNG" alt="...">
        </button>
      </div>
      <div class="col">
        <button>
          <img src="${pageContext.request.contextPath }/image/link.PNG" alt="...">
        </button>
      </div>
      <div class="col">
        <button>
          <img src="${pageContext.request.contextPath }/image/link.PNG" alt="...">
        </button>
      </div>
      <div class="col">
        <button>
          <img src="${pageContext.request.contextPath }/image/link.PNG" alt="...">
        </button>
      </div>
    </div>

  </div>

  
  <!--
  <main role="main" class="container">
    <div class="row">
      <div class="col-md-8 blog-main">
        <h3 class="pb-4 mb-4 font-italic border-bottom">
          From the Firehose
        </h3>

        <div class="blog-post">
          <h2 class="blog-post-title">Sample blog post</h2>
          <p class="blog-post-meta">January 1, 2014 by <a href="#">Mark</a></p>

          <p>This blog post shows a few different types of content that°Øs supported and styled with Bootstrap. Basic
            typography, images, and code are all supported.</p>
          <hr>
          <p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus.
            Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est
            at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>
          <blockquote>
            <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu
              leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
          </blockquote>
          <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet
            fermentum.
            Aenean lacinia bibendum nulla sed consectetur.</p>
          <h2>Heading</h2>
          <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo
            luctus,
            nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac,
            vestibulum at eros.</p>
          <h3>Sub-heading</h3>
          <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</p>
          <pre><code>Example code block</code></pre>
          <p>Aenean lacinia bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce
            dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa.</p>
          <h3>Sub-heading</h3>
          <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia
            bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac
            cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <ul>
            <li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>
            <li>Donec id elit non mi porta gravida at eget metus.</li>
            <li>Nulla vitae elit libero, a pharetra augue.</li>
          </ul>
          <p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>
          <ol>
            <li>Vestibulum id ligula porta felis euismod semper.</li>
            <li>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.</li>
            <li>Maecenas sed diam eget risus varius blandit sit amet non magna.</li>
          </ol>
          <p>Cras mattis consectetur purus sit amet fermentum. Sed posuere consectetur est at lobortis.</p>
        </div>

        <div class="blog-post">
          <h2 class="blog-post-title">Another blog post</h2>
          <p class="blog-post-meta">December 23, 2013 by <a href="#">Jacob</a></p>

          <p>Cum sociis natoque penatibus et magnis <a href="#">dis parturient montes</a>, nascetur ridiculus mus.
            Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Sed posuere consectetur est
            at lobortis. Cras mattis consectetur purus sit amet fermentum.</p>
          <blockquote>
            <p>Curabitur blandit tempus porttitor. <strong>Nullam quis risus eget urna mollis</strong> ornare vel eu
              leo. Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
          </blockquote>
          <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet
            fermentum.
            Aenean lacinia bibendum nulla sed consectetur.</p>
          <p>Vivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Duis mollis, est non commodo
            luctus,
            nisi erat porttitor ligula, eget lacinia odio sem nec elit. Morbi leo risus, porta ac consectetur ac,
            vestibulum at eros.</p>
        </div>

        <div class="blog-post">
          <h2 class="blog-post-title">New feature</h2>
          <p class="blog-post-meta">December 14, 2013 by <a href="#">Chris</a></p>

          <p>Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aenean lacinia
            bibendum nulla sed consectetur. Etiam porta sem malesuada magna mollis euismod. Fusce dapibus, tellus ac
            cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus.</p>
          <ul>
            <li>Praesent commodo cursus magna, vel scelerisque nisl consectetur et.</li>
            <li>Donec id elit non mi porta gravida at eget metus.</li>
            <li>Nulla vitae elit libero, a pharetra augue.</li>
          </ul>
          <p>Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit amet
            fermentum.
            Aenean lacinia bibendum nulla sed consectetur.</p>
          <p>Donec ullamcorper nulla non metus auctor fringilla. Nulla vitae elit libero, a pharetra augue.</p>
        </div>

        <nav class="blog-pagination">
          <a class="btn btn-outline-primary" href="#">Older</a>
          <a class="btn btn-outline-secondary disabled" href="#" tabindex="-1" aria-disabled="true">Newer</a>
        </nav>

      </div>

      <aside class="col-md-4 blog-sidebar">
        <div class="p-4 mb-3 bg-light rounded">
          <h4 class="font-italic">About</h4>
          <p class="mb-0">Etiam porta <em>sem malesuada magna</em> mollis euismod. Cras mattis consectetur purus sit
            amet fermentum. Aenean lacinia bibendum nulla sed consectetur.</p>
        </div>

        <div class="p-4">
          <h4 class="font-italic">Archives</h4>
          <ol class="list-unstyled mb-0">
            <li><a href="#">March 2014</a></li>
            <li><a href="#">February 2014</a></li>
            <li><a href="#">January 2014</a></li>
            <li><a href="#">December 2013</a></li>
            <li><a href="#">November 2013</a></li>
            <li><a href="#">October 2013</a></li>
            <li><a href="#">September 2013</a></li>
            <li><a href="#">August 2013</a></li>
            <li><a href="#">July 2013</a></li>
            <li><a href="#">June 2013</a></li>
            <li><a href="#">May 2013</a></li>
            <li><a href="#">April 2013</a></li>
          </ol>
        </div>

        <div class="p-4">
          <h4 class="font-italic">Elsewhere</h4>
          <ol class="list-unstyled">
            <li><a href="#">GitHub</a></li>
            <li><a href="#">Twitter</a></li>
            <li><a href="#">Facebook</a></li>
          </ol>
        </div>
      </aside>
    -->
    </div><!-- /.row -->

  </main><!-- /.container -->

  <footer class="blog-footer">
    <p>Blog template built for <a href="https://getbootstrap.com/">Bootstrap</a> by <a
        href="https://twitter.com/mdo">@mdo</a>.</p>
    <p>
      <a href="#">Back to top</a>
    </p>
  </footer>

  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <script src="${pageContext.request.contextPath }/js/carousel.js"></script>
</body>

</html>