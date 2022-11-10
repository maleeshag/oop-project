<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.connection.DBconnection" %>	
<%@page import="model.*" %>	
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.*"%>

<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
    	request.setAttribute("person", auth);
	}
	ProductDao pd = new ProductDao(DBconnection.getConnection());
	List<Product> products = pd.getAllProducts();
	
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
 	
 	
 	if (cart_list != null) {
 		
 		request.setAttribute("cart_list", cart_list);
 		
 		
 	}
 	
 	
 	

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="includes/header.jsp"%>

</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="allProducts.jsp">NextGen</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item "><a class="nav-link" href="allProducts.jsp">Home
						
				</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a></li>
				
				
				
				<%
					if (auth != null) {
				%>
					<li class="nav-item"><a class="nav-link " href="order.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link " href="log-out">LogOut</a></li>
				<%
					} else {
				%>
					<li class="nav-item"><a class="nav-link " href="login.jsp">LogIn</a></li>
				<%
				}
				%>
				
				
			</ul>
			
			
		</div>
		</div>
	</nav>
	
	
	
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card w-100">
					<img class="card-img-top" src="images/<%=p.getImage() %>" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName() %></h5>
						
						<h6 class="price">Price: Rs:<%=p.getPrice() %></h6>
						
						<h6 class="category">Category: <%=p.getCategory() %></h6>
						
						<div class="mt-3 d-flex justify-content-between"> 
							<a class="btn btn-light" href="add-to-cart?id=<%=p.getId()%>">Add to Cart</a> <a
								class="btn btn-primary" href="order-now?quantity=1&id=<%=p.getId()%>">Buy Now</a>
						</div>
						
					</div>
				</div>
			</div>
			<%
			}
			} else {
			out.println("There is no proucts");
			}
			%>

		</div>
	</div>




	<%@include file="includes/footer.jsp"%>
	<%@include file="includes/footer1.jsp"%>
</body>
</html>