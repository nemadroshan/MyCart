<%@page import="com.nt.entity.User"%>
<%
	User currentUser = (User) session.getAttribute("current-user");
%>

<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"><i>MyShoping<em>Cart</em></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home <span class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> Category </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdown">
						<a class="dropdown-item" href="#">Action</a> <a
							class="dropdown-item" href="#">Another action</a>
						<div class="dropdown-divider"></div>
						<a class="dropdown-item" href="#">Something else here</a>
					</div></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link" data-toggle="modal" data-target="#cart"
					href="#"><i class ="fa fa-cart-plus" style="font-size: 30px;"></i> <span  class="card-items" style="font-size: 15px;">( 0 )</span></a></li>
				<%
					if (currentUser == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login </a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Register</a>
				</li>
				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link" href="#"><%=currentUser.getUserName()%></a></li>
				<li class="nav-item active"><a class="nav-link" href="logout">Logout
				</a></li>
				<%
					}
				%>
			</ul>
		</div>
	</div>
</nav>