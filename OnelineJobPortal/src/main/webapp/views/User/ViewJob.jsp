<%@page import="org.siva.onlinejobportal.model.Jobs"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Online Job Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container-fluid">
            <a class="navbar-brand" href="/user/home">Online Job Portal</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" href="/user/home"><i class="fa-solid fa-home"></i> Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="/user/viewJobs"><i class="fa-solid fa-eye"></i> View Jobs</a>
                    </li>
                </ul>
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item ms-2">
                        <a class="nav-link active btn btn-info" data-bs-toggle="modal" data-bs-target="#userProfile"><i class="fa-solid fa-user-circle"></i> ${user.fullName}</a>
                    </li>
                    <li class="nav-item ms-2">
                        <a class="nav-link active btn btn-warning" href="/user/logout"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Modal -->
    <div class="modal fade" id="userProfile" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header bg-primary text-light">
                    <h5 class="modal-title fw-bold fs-4" id="exampleModalLabel">Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                	<table class="table text-center table-borderless">
                		<tr>
                			<th> User ID </th>
                			<th> : </th>
                			<th>#${user.id} </th>
                		</tr>
                		<tr>
                			<th> Full Name </th>
                			<th> : </th>
                			<td> ${user.fullName}</td>
                		</tr>
                		<tr>
                			<th> Email </th>
                			<th> : </th>
                			<td> ${user.email} </td>
                		</tr>
                		<tr>
                			<th> Mobile No </th>
                			<th> : </th>
                			<td> ${user.mobileNumber } </td>
                		</tr>
                		<tr>
                			<th> Qualification </th>
                			<th> : </th>
                			<td> ${user.qualification} </td>
                		</tr>
                	</table> 
                </div>
                <div class="modal-footer d-flex justify-content-center">
                    <button type="button" class="btn btn-warning" data-bs-dismiss="modal">Cancel</button>
                    <a type="button" class="btn btn-primary" href="/user/editProfile">Edit</a>
                </div>
            </div>
        </div>
    </div>
    <%
    	Jobs job = (Jobs) session.getAttribute("job");
    %>
    <div class="container">
    	<div class="row">
    		<div class="col-md-12">
    			<div class="card my-4 p-3">
					<div class="card-head p-2 text-center">
						<i class="fa-solid fa-clipboard fa-2x text-primary"></i>
					</div>
					<div class="card-body">
						<h4 class="fw-bold"><%= job.getTitle() %></h4>
						<p><%= job.getDescription() %></p>
						<div class="row my-2">
							<div class="col-md-4">
								<input value="Location: <%= job.getLocation() %>" class="form-control" disabled="disabled" readOnly>
							</div>
							<div class="col-md-4">
								<input value="Category: <%= job.getCategory() %>" class="form-control" disabled="disabled" readOnly>
							</div>
						</div>
						<p>Publish Date: <%= job.getPostDate() %></p>
						<div class="text-center my-2">
							<a href="/user/viewJobs" class="btn btn-dark">Back</a>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>