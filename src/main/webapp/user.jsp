<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<% 
	User user = (User)session.getAttribute("current-user");
	if(user == null){
			session.setAttribute("message", "You are not Loged in !! Please Log in First ");
			response.sendRedirect("login.jsp");
			return;
		} else {
			if (user.getUserType().equalsIgnoreCase("admin")) {
				session.setAttribute("message", "You restriced to access admin ");
				response.sendRedirect("login.jsp");
				return;
			}
	}
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user</title>
<%@include file="comman/comman.jsp"%>

</head>
<body>
	<%@include file="comman/navbar.jsp"%>
	<h1>inside user</h1>
	<%@include file="comman/Comman_Modals.jsp" %>
</body>
</html>