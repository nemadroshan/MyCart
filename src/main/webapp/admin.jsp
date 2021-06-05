<%@page import="com.nt.entity.Product"%>
<%@page import="com.nt.dao.ProductDao"%>
<%@page import="org.w3c.dom.ls.LSInput"%>
<%@page import="com.nt.entity.Category"%>
<%@page import="java.util.List"%>
<%@page import="com.nt.dao.CategoryDao"%>
<%@page import="com.nt.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	User user = (User) session.getAttribute("current-user");
if (user == null) {
	session.setAttribute("message", "You are not Loged in ");
	response.sendRedirect("login.jsp");
	return;
} else {
	if (user.getUserType().equalsIgnoreCase("normal")) {
		session.setAttribute("message", "You restriced to access ");
		response.sendRedirect("login.jsp");
		return;
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>admin</title>
<%@include file="comman/comman.jsp"%>
</head>
<body>
	<%@include file="comman/navbar.jsp"%>
	<div class="container admin mt-2">
		<div class="container-fluid">
			<%@include file="comman/message.jsp"%>
		</div>
		<!-- 1st row -->
		<div class="row mt-3">
			<!-- 1st column -->
			<div class="col-md-4">
				<div class="card">
					<!-- card start -->
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle"
								alt="usersImg.png" src="img/team.png">
						</div>
						<h1>1234</h1>
						<h1 class="text-uppercase text-muted">USers</h1>
					</div>
				</div>
				<!-- card ends -->
			</div>
			<!-- 2nd column -->
			<div class="col-md-4">
				<div class="card">
					<!-- card start -->
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle "
								alt="products.png" src="img/products.png">
						</div>
						<h1><%=session.getAttribute("noOfProduct")%></h1>
						<h1 class="text-uppercase text-muted">Product</h1>
					</div>
				</div>
				<!-- card ends -->
			</div>
			<!-- 3rd column -->
			<div class="col-md-4">
				<div class="card">
					<!-- card start -->
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle"
								alt="products.png" src="img/list.png">
						</div>
						<h1><%=session.getAttribute("noOfCategory")%></h1>
						<h1 class="text-uppercase text-muted">category</h1>
					</div>
				</div>
				<!-- card ends -->
			</div>
		</div>
		<!-- 2nd row -->
		<div class="row mt-3">
			<!-- 1st column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-category">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle"
								alt="products.png" src="img/add.png">
						</div>
						<p class="mt-2">click here to add category</p>
						<h2 class="text-uppercase text-muted">add category</h2>
					</div>
				</div>
			</div>
			<!-- 2nd column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#add-product">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle"
								alt="products.png" src="img/add.png">
						</div>
						<p class="mt-2">click here to add product</p>
						<h2 class="text-uppercase text-muted">add PRODUCT</h2>
					</div>
				</div>
			</div>
		</div>
		<!-- 2nd  row end -->

		<!-- 3rd row starts -->
		<div class="row mt-3">
			<!-- 1st column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#delete-category">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle"
								alt="products.png" src="img/add.png">
						</div>
						<p class="mt-2">click here to Delete category</p>
						<h2 class="text-uppercase text-muted">Delete category</h2>
					</div>
				</div>
			</div>
			<!-- 2nd column -->
			<div class="col-md-6">
				<div class="card" data-toggle="modal" data-target="#delete-product">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-height: 125px;" class="img-fluid rounded-circle"
								alt="products.png" src="img/add.png">
						</div>
						<p class="mt-2">click here to Delete product</p>
						<h2 class="text-uppercase text-muted">Delete Products</h2>
					</div>
				</div>
			</div>
		</div>
       <!-- 3row ends -->
	</div>

	<!-- adding category model -->
	<!-- Modal -->
	<div class="modal fade" id="add-category" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content">
				<div class="modal-header  custom-bg text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- category form  starts-->
					<form action="AddOperation" method="POST">
						<div class="form-group">
							<input type="hidden" name="operation" value="addCategory">
							<label for=" CategoryTitle">Category Title</label> <input
								type="text" class="form-control" id="CategoryTitle"
								name="catTitle" placeholder="Enter title">
						</div>
						<div class="form-group">
							<label for="catDesc">Category Description</label>
							<!-- <input type="text" class="form-control" id="catDesc" name="catDesc"> -->
							<textarea class="form-control" id="catDesc" name="catDesc"
								placeholder="Enter descrption"></textarea>
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
					<!-- category form  ends-->
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div> -->
			</div>
		</div>
	</div>
	<!-- end category and start product model -->

	<!-- product Modal -->
	<div class="modal fade" id="add-product" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-header custom-bg text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- product form  starts-->
					<form action="AddOperation" method="POST"
						enctype="multipart/form-data">
						<div class="form-group">
							<input type="hidden" name="operation" value="addProduct">
							<input type="text" class="form-control" id="podTitle"
								name="podName" placeholder="Enter Product Name">
						</div>
						<div class="form-group">
							<textarea class="form-control" id="podDesc" name="podDesc"
								placeholder="Enter Product Decription"></textarea>
						</div>
						<div class="form-group">

							<input type="number" class="form-control" id="podPrice"
								name="podPrice" placeholder="Enter Product price">
						</div>

						<div class="form-group">

							<input type="number" class="form-control" id="podDiscount"
								name="podDiscount" placeholder="Enter Product Discount">
						</div>

						<div class="form-group">
							<input type="number" class="form-control" id="podQuantity"
								name="podQuantity" placeholder="Enter Product Quantity">
						</div>
						<!-- product category -->

						<%
							List<Category> list = new CategoryDao().getCategories();
						%>
						<div class="form-group">
							<select name="catId" id="" class="form-control">
								<%
									for (Category c : list) {
								%>
								<option value="<%=c.getCategoryId()%>"><%=c.getCategoryTitle()%></option>
								<%
									}
								%>
							</select>
						</div>
						<div class="form-group">
							<label for="podImg">Select Picture</label><br> <input
								type="file" class="form-control" id="podImg" name="podImg">
						</div>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
					<!-- product form  ends-->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<!-- <button type="button" class="btn btn-primary">Save changes</button> -->
				</div>
			</div>
		</div>
	</div>
	<!-- product model ends -->
	<!-- delete catagory form -->
	<div class="modal fade" id="delete-category" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content">
				<div class="modal-header  custom-bg text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Delete Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- category form  starts-->
					<form action="delOperation" method="POST">
						<table class="table table-bordered">
						
							<thead>
							   
								   <tr>
									<th scope="col">Category Id</th>
									<th scope="col">Category Title</th>
									<th scope="col">Category Discription</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							 <% for(Category c:list) {%>
								<tr>
									<th><%=c.getCategoryId()%></th>
									<td><%=c.getCategoryTitle()%></td>
									<td><%=c.getCategoryDecription()%></td>
									<td>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault">
											Select </label>
									</div>
									</td>
								</tr>
						<% }%>
							</tbody>
						</table>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
					<!-- category form  ends-->
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div> -->
			</div>
		</div>
	</div>
	
	
		<!-- delete Product form -->
	<div class="modal fade" id="delete-product" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg ">
			<div class="modal-content">
				<div class="modal-header  custom-bg text-white ">
					<h5 class="modal-title" id="exampleModalLabel">Delete Prouducts</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<!-- category form  starts-->
					<form action="prodDelOperation" method="POST">
						<table class="table table-bordered">
						
							<thead>
							   
								   <tr>
									<th scope="col">Id</th>
									<th scope="col">Name</th>
									<th scope="col">Discription</th>
									<th scope="col">Category</th>
									<th scope="col">Price</th>
									<th scope="col">Discount</th>
									<th scope="col">Quantity</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
							 <% 
							  List<Product> prodList = new ProductDao().getallProducts();
				           						
							 for(Product p:prodList) {%>
								<tr>
									<th><%=p.getPid()%></th>
									<td><%=p.getpName()%></td>
									<td><%=p.getCategory().getCategoryId()%></td>
									
									<td><%=p.getpDesc()%></td>
									<td><%=p.getpPrice()%></td>
									
									<td><%=p.getpDiscount()%></td>
									<td><%=p.getpQuantity()%></td>
									
									
									<td>
									<div class="form-check">
										<input class="form-check-input" type="checkbox" value=""
											id="flexCheckDefault"> <label
											class="form-check-label" for="flexCheckDefault">
											Select </label>
									</div>
									</td>
								</tr>
						<% }%>
							</tbody>
						</table>
						<button type="submit" class="btn btn-success">Submit</button>
					</form>
					<!-- category form  ends-->
				</div>
				<!-- <div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div> -->
			</div>
		</div>
	</div>
</body>
</html>