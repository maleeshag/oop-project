<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="model.*" %>
     <%@page import="java.util.*"%>
     <%@page import="com.dao.*"%>
     <%@page import="com.connection.*"%>
<%
	User auth = (User) request.getSession().getAttribute("auth");
	if (auth != null) {
		request.setAttribute("person", auth);
	}
	ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
	if (cart_list != null) {
		request.setAttribute("cart_list", cart_list);
	}
	List<Order> orders = null;
	if (auth != null) {
	    request.setAttribute("person", auth);
	    OrderDao orderDao  = new OrderDao(DBconnection.getConnection());
		orders = orderDao.userOrders((auth.getCusId()));
	}else{
		response.sendRedirect("login.jsp");
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
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart<span class="badge badge-danger">${cart_list.size()}</span></a></li>
				
				
				
				<%
					if (auth != null) {
				%>
					<li class="nav-item"><a class="nav-link " href="order.jsp">Orders</a></li>
					<li class="nav-item"><a class="nav-link " href="log-out">LogOut</a></li>
				<%
					} else {
				%>
					<li class="nav-item"><a class="nav-link" href="login.jsp">LogIn</a></li>
				<%
				}
				%>
				
				
			</ul>
			
		</div>
		</div>
	</nav>
	
	

<div class="container">
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Address</th>
					<th scope="col">Update Order</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
			
			<%
			if(orders != null){
				for(Order o:orders){%>
					<tr>
						<td><%=o.getDate() %></td>
						<td><%=o.getName() %></td>
						<td><%=o.getCategory() %></td>
						<td><%=o.getQunatity() %></td>
						<td><%=o.getPrice() %></td>
						<td><input type="text" name="delivery-address" class="form-control" placeholder="<%=o.getCusAddress() %>"></td>
						<td><a class="btn btn-sm btn-warning"  href="UpdateOrder?id=<%=o.getOrderId()%>&address=<%=o.getCusAddress() %>">Update Order</a></td>
						<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
					</tr>
				<%}
			}
			%>
			
			</tbody>
		</table>
	</div>


<%@include file="includes/footer.jsp" %>
<%@include file="includes/footer1.jsp"%>
</body>
</html>