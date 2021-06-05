<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="comman/comman.jsp"%>
<title>Register</title>
</head>
<body>
	<%@include file="comman/navbar.jsp"%>
	
	<div class="container-fluid">
		<div class="row mt-3 ">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<%@include file="comman/message.jsp"%>
					<div class="card-header custom-bg text-white text-center">
						<h3>Sign Up Here !!</h3>
					</div>
					<div class="card-body px-5">
						<form action="RegisterServlet" method="POST">
							<div class="form-group">
								<label for="name">User Name</label> <input type="text"
									name="user_name" class="form-control" id="name"
									placeholder="Enter Here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="email">User email</label> <input type="email"
									name="user_email" class="form-control" id="email"
									placeholder="Enter Here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="password">User password</label> <input name="pwd"
									type="password" class="form-control" id="password"
									placeholder="Enter Here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="phone">User phone</label> <input type="number"
									name="phone" class="form-control" id="phone"
									placeholder="Enter Here" aria-describedby="emailHelp">
							</div>

							<div class="form-group">
								<label for="phone">User Address</label>
								<textarea class="form-control" placeholder="Enter Address"
									name="addrs"></textarea>
							</div>

							<div class="container text-center">
								<button class="btn btn-outline-success" type="submit">Register</button>
								<button class="btn btn-outline-warning" type="reset">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@include file="comman/Comman_Modals.jsp" %>
</body>
</html>