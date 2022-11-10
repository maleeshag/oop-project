<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="model.*" %>
 <%@page import="com.connection.DBconnection"%>
<%@page import="com.dao.*"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>	   
    
 <%
	
 	User auth = (User) request.getSession().getAttribute("auth");
 	if (auth != null) {
     	request.setAttribute("person", auth);
 	}
 	
 	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
 	
 	List<Cart> cartProduct = null;
 	
 	if (cart_list != null) {
 		
 		ProductDao pDao = new ProductDao(DBconnection.getConnection());
 		
 		cartProduct = pDao.getCartProducts(cart_list);
 		request.setAttribute("cart_list", cart_list);
 		
 		double total = pDao.getTotalCartPrice(cart_list);
 		request.setAttribute("total", total);
 		
 		
 	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cart Page</title>
<%@include file="includes/header.jsp" %>

<style type="text/css">

.table tbody td{
	vertical-align: middle;
}
.btn-incre, .btn-decre{
	box-shadow: none;
	font-size: 25px;
}





</style>

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
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a></li>
				
				
				
				<%
					if (auth != null) {
				%>
					<li class="nav-item"><a class="nav-link" href="order.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="log-out">LogOut</a></li>
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
	



<div class="container my-3">
		<div class="d-flex py-3"><h3>Total Price: Rs: ${(total>0)? total:0} </h3> <a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a></div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%= c.getPrice()%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
						<input type="hidden" name="id" value="<%= c.getId()%>" class="form-input">
						
							<div class="form-group d-flex justify-content-between w-50">
							
								<a href="quantity-inc-dec?action=inc&id=<%=c.getId()%>" class="badge badge-info" >+</a>
								
								<input type="text" name="quantity" class="form-control w-50"  value="<%=c.getQuantity()%>" readonly> 
								
								 <a href="quantity-inc-dec?action=dec&id=<%=c.getId()%>" class="badge badge-info">-</a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm ">Buy</button>
						</form>
					</td>
					<td><a href="remove-from-cart?id=<%=c.getId() %>" class="btn btn-sm btn-danger">Remove</a></td>
				</tr>

				<%
				}
			}%>
			</tbody>
		</table>
	</div>






<%@include file="includes/footer.jsp" %>
<%@include file="includes/footer1.jsp"%>
</body>
</html>