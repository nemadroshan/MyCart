<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="comman/comman.jsp"%>
<title>Login</title>
</head>
<body>
	<%@include file="comman/navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-6 offset-md-3">

				<div class="card mt-3">
				
					<div class="card-header custom-bg text-white ">
						<h3>Login here</h3>
					</div>

					<div class="card-body">
					<%@include file="comman/message.jsp" %>
						<form action="LoginServlet" method="POST">
							<div class="form-group">
								<label for="email">Email address</label> <input
									type="email" class="form-control" id="email" name="email"
									aria-describedby="emailHelp" placeholder="Enter email">
							</div>
							<div class="form-group">
								<label for="password">Password</label> <input
									type="password" class="form-control" id="password" name ="pwd"
									placeholder="Password">
							</div>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary custom-bg">Login</button>
								<button type="reset" class="btn btn-primary custom-bg">Reset</button>
							</div>
						</form>
					</div>

					<div class="card-footer">
					<a href="register.jsp">If Not Registered Click Here !!</a>
					</div>
				</div>

			</div>
		</div>
	</div>
	<%@include file="comman/Comman_Modals.jsp" %>
</body>
</html>