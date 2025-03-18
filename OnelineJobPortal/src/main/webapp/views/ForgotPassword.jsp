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

	<div class="container">
		<div class="row d-flex justify-content-center align-items-center" style="height:85vh">
			<div class="col-md-5">
				<div class="card shadow">
					<div class="card-head pt-3 text-center">
						<i class="fa-solid fa-user-plus fa-2x"></i><br>
						<h2>Forgot Password</h2>
					</div>
					<div class="card-body">
						<!-- alert message starts -->
						<%
							String failMsg = (String) session.getAttribute("failMsg");
							if (failMsg!=null)
							{%>
								<div class="alert alert-danger">
									<p class="text-center fw-bold"><%= failMsg %></p>
								</div>
							<% session.removeAttribute("failMsg");
							}
						%>
						<!-- alert message ends -->
						<form action="/next" method="post">
							<div class="form-group mb-3">
								<label for="email">Enter Email</label>
								<input type="email" name="email" class="form-control" id="email" autocomplete="off" required>
							</div>
							<div class="form-group mb-3">
								<label for="mobileNumber">Enter Mobile Number</label>
								<input type="number" name="mobileNumber" class="form-control" id="mobileNumber" autocomplete="off" required>
							</div>
							<div class="form-group mb-3 mt-4">
								<input type="submit" value="Next" class="btn btn-primary form-control">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
  
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
  </body>
</html>