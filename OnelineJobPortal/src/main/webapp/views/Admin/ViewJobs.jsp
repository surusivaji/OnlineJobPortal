<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.siva.onlinejobportal.model.Jobs"%>
<%@page import="java.util.List"%>
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
	
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1 class="text-center fw-bold text-danger my-2">View Jobs</h1>
					<%
						String successMsg = (String) session.getAttribute("successMsg");
						if (successMsg!=null)
						{%>
							<div class="alert alert-success">
								<p class="text-center fw-bold"><%= successMsg %></p>
							</div>	
						<% session.removeAttribute("successMsg");
						}
						String failMsg = (String) session.getAttribute("failMsg");
						if (failMsg!=null)
						{%>
							<div class="alert alert-danger">
								<p class="text-center fw-bold"><%= failMsg %></p>
							</div>
						<% session.removeAttribute("failMsg");
						}
						String warningMsg = (String) session.getAttribute("warningMsg");
						if (warningMsg!=null) 
						{%>
							<div class="alert alert-warning">
								<p class="text-center fw-bold"><%= warningMsg %></p>
							</div>	
						<% session.removeAttribute("warningMsg");
						}
					List<Jobs> jobs = (List<Jobs>) session.getAttribute("jobs");
					if (jobs.isEmpty()) 
					{%>
						<div class="card text-center">
							<h3 class="text-warning p-3 fw-bold">No Jobs Are Present...!!!</h3>
						</div>
					<%
					}
					else 
					{
						for (Jobs job : jobs) 
						{%>
							<div class="card mb-3">
								<div class="card-head p-2 text-center">
									<i class="fa-solid fa-clipboard fa-2x text-primary"></i>
								</div>
								<div class="card-body">
									<span class="fw-bold">Title: </span><%= job.getTitle() %> <br>
									<span class="fw-bold">Description: </span> <br>
									<p><%= job.getDescription() %></p>
									<div class="row my-2">
										<div class="col-md-4">
											<input value="Location: <%= job.getLocation() %>" class="form-control" disabled="disabled" readOnly>
										</div>
										<div class="col-md-4">
											<input value="Category: <%= job.getCategory() %>" class="form-control" disabled="disabled" readOnly>
										</div>
										<div class="col-md-4">
											<input value="Status: <%= job.getStatus() %>" class="form-control" disabled="disabled" readOnly>
										</div>
									</div>
									<p><span class="fw-bold">Publish Date: </span>
										<%
											SimpleDateFormat formater = new SimpleDateFormat("dd-MM-yyyy");
											String postDate = formater.format(job.getPostDate());
										%>
										<%= postDate %>
									 </p>
									<div class="my-2 d-flex justify-content-center">
										<a href="/admin/editJob/<%= job.getId() %>" class="btn btn-success me-2"><i class="fa-solid fa-pen-to-square"></i> Edit</a>
										<a onclick="deleteJob(<%= job.getId() %>)" class="btn btn-danger"><i class="fa-solid fa-trash-can"></i> Delete</a>
									</div>
								</div>
							</div>	
						<%}
					}
				%>
			</div>
		</div>
	</div>
  
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
	    function deleteJob(id) {
	        swal({
	            title: "Are you sure?",
	            text: "You want to delete this job!",
	            icon: "warning",
	            buttons: true,
	            dangerMode: true,
	        })
	        .then((willDelete) => {
	            if (willDelete) {
	                window.location = "/admin/deleteJob/" + id;  
	            } else {
	                swal("Your job is safe!");
	            }
	        });
	    }
	</script>
  </body>
</html>