<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <style>
    .carousel {
      margin: 0;
      padding: 0;
    }
    img {
        margin: 0 auto;
        padding: 0;
    }
</style>
</head>
<body>
  <div id="carouselExampleControls" class="carousel slide card p-5" data-ride="carousel">
    <div class="carousel-inner mb-0">
      <div class="carousel-item active">
        <div class="media">
          <img src="${pageContext.request.contextPath }/image/book.PNG" class="mr-3" alt="...">
          <div class="media-body">
            <h5 class="mt-0">Media heading</h5>
            Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="media">
          <img src="${pageContext.request.contextPath }/image/book.PNG" class="mr-3" alt="...">
          <div class="media-body">
            <h5 class="mt-0">Media heading</h5>
            Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,
          </div>
        </div>
      </div>
      <div class="carousel-item">
        <div class="media">
          <img src="${pageContext.request.contextPath }/image/book.PNG" class="mr-3" alt="...">
          <div class="media-body">
            <h5 class="mt-0">Media heading</h5>
            Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,Cras sit amet nibh libero,
          </div>
        </div>
      </div>
    </div>
    <a class="carousel-control-prev bg-dark" href="#carouselExampleControls" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next bg-dark" href="#carouselExampleControls" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>

  <script src="https://code.jquery.com/jquery-3.4.1.js"></script>
  <script src="js/bootstrap.min.js"></script>
</body>
</html>






  