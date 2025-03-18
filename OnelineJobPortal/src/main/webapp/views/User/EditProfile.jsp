<%@page import="org.siva.onlinejobportal.model.User"%>
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
     	User user = (User)session.getAttribute("user");
     %>
    
    <div class="container">
		<div class="row d-flex justify-content-center align-items-center" style="height:90vh">
			<div class="col-md-5">
				<div class="card shadow p-2">
					<div class="card-head pt-3 text-center">
						<h2>Edit User</h2>
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
						<form action="/user/updateUserInformation" method="post">
							<input type="hidden" name="id" id="id" value="<%= user.getId() %>"  class="form-control" autocomplete="off" required>
							<div class="form-group">
								<label for="fullName">Enter Fullname</label>
								<input type="text" name="fullName" id="fullName" value="<%= user.getFullName() %>"  class="form-control" autocomplete="off" required>
							</div>
							<div class="form-group mt-3">
								<label for="email">Enter Email</label>
								<input type="email" name="email" class="form-control" id="email" value="<%= user.getEmail() %>" autocomplete="off" required>
							</div>
							<div class="form-group mt-3">
								<label for="mobileNumber">Enter Mobile Number</label>
								<input type="number" name="mobileNumber" class="form-control" id="mobileNumber" value="<%= user.getMobileNumber() %>" autocomplete="off" required>
							</div>
							<div class="form-group mt-3">
								<label for="password">Enter Password</label>
								<input type="text" name="password" class="form-control" id="password" value="<%= user.getPassword() %>" autocomplete="off" required>
							<div class="form-group mt-3">
								<label for="qualification">Enter Qualification</label>
								<input type="text" name="qualification" id="qualification" class="form-control" value="<%= user.getQualification() %>" autocomplete="off" required>
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
    
    

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>