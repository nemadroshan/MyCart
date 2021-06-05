<%@page import="com.nt.utility.Utility"%>


<%@page import="com.nt.entity.*"%>
<%@page import="java.util.List"%>
<%@page import="com.nt.dao.*"%>
<%@page import="com.nt.Factory.FactoryProvider"%>
<%@page contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<html>
<head>
<title>Home</title>
<%@include file="comman/comman.jsp"%>
</head>
<body>
	<%@include file="comman/navbar.jsp"%>

	<div class="container-fluid ">

		<!-- row start -->
		<div class="row mt-3">
			<%
				ProductDao dao = new ProductDao();
				CategoryDao catDao = new CategoryDao();
				List<Category> catList = catDao.getCategories();
				String category = request.getParameter("catId");
				List<Product> product = null;
				product = dao.getallProducts();
				int noOfProduct = product.size();
				int noOfCategory = catList.size();
				session.setAttribute("noOfProduct", noOfProduct);
				session.setAttribute("noOfCategory", noOfCategory);
				if (category != null)
					if (category.trim().equals("all")) {
						product = dao.getallProducts();
					} else {
						int catid = Integer.parseInt(category.trim());
						product = dao.getallProductsByCategoryId(catid);
					}
			%>
			<!-- col1 start  show category-->
			<div class="col-md-2">
				<div class="list-group">
					<a href="index.jsp?catId=all"
						class="list-group-item list-group-item-action active"> All
						Category </a>
					<%
						for (Category c : catList) {
					%>
					<a href="index.jsp?catId=<%=c.getCategoryId()%>"
						class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
					<%
						}
					%>
				</div>
			</div>
			<!-- col1 end -->

			<!-- col2 start  show products -->
			<div class="col-md-10">
				<%-- <h1>
					number of products ::
					<%=product.size()%></h1>
				
				<br>
				<%
					}
				%> --%>

				<div class="row">
					<div class="col-md-12">
						<div class="card-columns ">
							<!-- traversing products -->
							<%
								for (Product p : product) {
									String name = "Files" + p.getpPhoto();
							%>
							<div class="card">
								<div class="container text-center">
									<img class="card-img-top" src="data:image/jpg;base64,<%=p.getBase64Image()%>"
										alt="<%=p.getpPhoto()%>"
										style="max-height: 200px; max-width: 100%; width: auto;"
										class="card-img-top m-2">
								</div>

								<div class="card-body">
									<input type=hidden  id= "pquant" name="pquant" value="<%= p.getpQuantity()%>"/>
									<h5 class="card-title"><%=p.getpName()%></h5>
									<p class="card-text">
										<%
											String word = Utility.get10words(p.getpDesc());
										%>
										<%=word%></p>
								</div>
								<div class="card-footer">
									<button class="btn custom-bg text-white" 
									onclick="addToCart('<%= p.getPid()%>','<%=p.getpName()%>',<%=p.getPriceafterDescount()%>)">Add To Card</button>
									<button class="btn btn-outline-success ">
										&#8377;<%=p.getPriceafterDescount()%>
										/- <span class="discount-style"> <span
											style="text-decoration: line-through;">&#8377; <%=p.getpPrice()%>
										</span>&nbsp;| <%=p.getpDiscount()%> % off
										</span>
									</button>
								</div>
							</div>
							<!-- closing card here -->

							<%
								}
							%>
						</div>
						<!-- Closing card columns -->
					</div>
				</div>
			</div>
			<!-- col1 end -->
		</div>
		<!-- row end -->
	</div>
	
	<%@include file="comman/Comman_Modals.jsp" %>
	
</body>
</html>
