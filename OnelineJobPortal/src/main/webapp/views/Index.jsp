<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  </head>
  <body>
  	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<a class="navbar-brand" href="/">Online Job Portal</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    	<span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		   		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        	<li class="nav-item">
		          		<a class="nav-link active" aria-current="page" href="/"><i class="fa-solid fa-home"></i> Home</a>
		        	</li>
		      	</ul>
		      	<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		        	<li class="nav-item ms-2">
		          		<a class="nav-link active btn btn-danger" aria-current="page" href="/signin"><i class="fa-solid fa-user-circle"></i> Login</a>
		       		</li>
		        	<li class="nav-item ms-2">
		          		<a class="nav-link active btn btn-dark" aria-current="page" href="/adminLogin"><i class="fa-solid fa-user-tie"></i> Admin</a>
		       		</li>
		        	<li class="nav-item ms-2">
		          		<a class="nav-link active btn btn-success" aria-current="page" href="/signup"><i class="fa-solid fa-right-to-bracket"></i> Signup</a>
		        	</li>
		       </ul>
		    </div>
		</div>
	</nav>
	
	<div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-inner">
		    <div class="carousel-item">
				<img src="${pageContext.request.contextPath}/images/background-3.jpg" class="d-block w-100" height="637px" alt="...">
		    </div>
		    <div class="carousel-item active">
		      <img src="${pageContext.request.contextPath}/images/background-1.jpg" class="d-block w-100" height="637px" alt="...">
		    </div>
		    <div class="carousel-item">
				<img src="${pageContext.request.contextPath}/images/background-2.jpg" class="d-block w-100" height="637px" alt="...">
		    </div>
		  </div>
		  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Previous</span>
		  </button>
		  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="visually-hidden">Next</span>
		  </button>
	</div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>