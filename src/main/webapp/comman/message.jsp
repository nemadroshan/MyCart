
<%
	String msg = (String) session.getAttribute("message");

	if (msg != null) {
		//pring msg
%>
<div class="alert alert-success alert-dismissible fade show" role="alert">
		<strong><%=msg %></strong> 
		<button type="button" class="close" data-dismiss="alert" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
</div>
<%
	//remove msg from session
		session.removeAttribute("message");
	}
%>