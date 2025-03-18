<%@page import="org.siva.onlinejobportal.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isELIgnored = "false" %>
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
			<a class="navbar-brand" href="/admin/home">Online Job Portal</a>
		    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
		    	<span class="navbar-toggler-icon"></span>
		    </button>
		    <div class="collapse navbar-collapse" id="navbarSupportedContent">
		   		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
		        	<li class="nav-item">
		          		<a class="nav-link active" aria-current="page" href="/admin/home"><i class="fa-solid fa-home"></i> Home</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link active" aria-current="page" href="/admin/postJobs"><i class="fa-solid fa-plus-circle"></i> Post Job</a>
		        	</li>
		        	<li class="nav-item">
		          		<a class="nav-link active" aria-current="page" href="/admin/viewJobs"><i class="fa-solid fa-eye"></i> View Jobs</a>
		        	</li>
		      	</ul>
		      	<ul class="navbar-nav ms-auto mb-2 mb-lg-0">
		        	<li class="nav-item ms-2">
		          		<a class="nav-link active btn btn-danger" aria-current="page" data-bs-toggle="modal" data-bs-target="#adminProfile"><i class="fa-solid fa-user-tie"></i> ${admin.fullName}</a>
		       		</li>
		        	<li class="nav-item ms-2">
		          		<a class="nav-link active btn btn-success" aria-current="page" href="/admin/logout"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
		        	</li>
		       </ul>
		    </div>
		</div>
	</nav>
	
	<!-- Modal -->
    <div class="modal fade" id="adminProfile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-light">
                    <h5 class="modal-title fw-bold fs-4" id="exampleModalLabel">Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                	<table class="table table-borderless">
                		<tr>
                			<th> Full Name </th>
                			<th> : </th>
                			<td> ${admin.fullName}</td>
                		</tr>
                		<tr>
                			<th> Email </th>
                			<th> : </th>
                			<td> ${admin.email} </td>
                		</tr>
                		<tr>
                			<th> Mobile No </th>
                			<th> : </th>
                			<td> ${admin.mobileNumber } </td>
                		</tr>
                		<tr>
                			<th> Qualification </th>
                			<th> : </th>
                			<td> ${admin.qualification} </td>
                		</tr>
                		<tr>
                			<th> Role </th>
                			<th> : </th>
                			<td> ${admin.role} </td>
                		</tr>
                	</table> 
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancel</button>
                    <a type="button" class="btn btn-primary" href="/admin/profile">Edit</a>
                </div>
            </div>
        </div>
    </div>
	
	<% 
		Admin admin = (Admin) session.getAttribute("admin");
	%>

	<div class="container">
		<div class="row d-flex justify-content-center align-items-center" style="height:90vh">
			<div class="col-md-5">
				<div class="card shadow p-2">
					<div class="card-head pt-3 text-center">
						<h2>Edit Admin</h2>
					</div>
					<div class="card-body">
						<!-- alert message starts -->
						<%
							String successMsg = (String) session.getAttribute("successMsg");
							if (successMsg!=null) 
							{%>
								<div class="alert alert-success">
									<p class="text-center fw-bold"><%= successMsg %></p>
								</div>		
							<%}
							session.removeAttribute("successMsg");
							String failMsg = (String) session.getAttribute("failMsg");
							if (failMsg!=null) 
							{%>
								<div class="alert alert-danger">
									<p class="text-center fw-bold"><%= failMsg %></p>
								</div>		
							<%}
							session.removeAttribute("failMsg");
						%>
						<!-- alert message ends -->
						<form action="/admin/updateAdminInformation" method="post">
							<input type="hidden" name="id" id="id" value="<%= admin.getId() %>"  class="form-control" autocomplete="off" required>
							<div class="form-group">
								<label for="fullName">Enter Fullname</label>
								<input type="text" name="fullName" id="fullName" value="<%= admin.getFullName() %>"  class="form-control" autocomplete="off" required>
							</div>
							<div class="form-group mt-3">
								<label for="email">Enter Email</label>
								<input type="email" name="email" class="form-control" id="email" value="<%= admin.getEmail() %>" autocomplete="off" required>
							</div>
							<div class="form-group mt-3">
								<label for="mobileNumber">Enter Mobile Number</label>
								<input type="number" name="mobileNumber" class="form-control" id="mobileNumber" value="<%= admin.getMobileNumber() %>" autocomplete="off" required>
							</div>
							<div class="form-group mt-3">
								<label for="password">Enter Password</label>
								<input type="text" name="password" class="form-control" id="password" value="<%= admin.getPassword() %>" autocomplete="off" required>
							<div class="form-group mt-3">
								<label for="qualification">Enter Qualification</label>
								<input type="text" name="qualification" id="qualification" class="form-control" value="<%= admin.getQualification() %>" autocomplete="off" required>
							</div>
							</div>
							<div class="form-group mb-3 mt-4">
								<input type="submit" value="Update" class="btn btn-primary form-control">
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