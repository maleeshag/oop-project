<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="model.*" %>	   
<%@page import="com.connection.DBconnection"%>
<%@page import="com.dao.ProductDao"%>
<%@page import="java.util.*"%>	
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		response.sendRedirect("allProduct.jsp");
	}
	
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
<%@include file="includes/header.jsp" %>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<a class="navbar-brand" href="allProducts.jsp">Modern Solutions</a>
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
				<li class="nav-item"><a class="nav-link " href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a></li>
				
				
				
				<%
					if (auth != null) {
				%>
					<li class="nav-item"><a class="nav-link " href="order.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link " href="log-out">LogOut</a></li>
				<%
					} else {
				%>
					<li class="nav-item"><a class="nav-link disabled" href="login.jsp">LogIn</a></li>
				<%
				}
				%>
				
				
			</ul>
			
		</div>
		</div>
	</nav>


<div class="container">
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">User Login</div>
			<div class="card-body">
				<form action="user-login" method="post">
					<div class="form-group">
						<label>Email address</label> 
						<input type="email" name="login-email" class="form-control" placeholder="Enter email" required>
					</div>
					<div class="form-group">
						<label>Password</label> 
						<input type="password" name="login-password" class="form-control" placeholder="Password" required>
					</div>
					<div class="text-center">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>








<%@include file="includes/footer.jsp" %>
<%@include file="includes/footer1.jsp"%>
</body>
</html>