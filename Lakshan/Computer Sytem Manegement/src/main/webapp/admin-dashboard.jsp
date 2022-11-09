<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/flatly/bootstrap.min.css"
	integrity="sha384-qF/QmIAj5ZaYFAeQcrQ6bfVMAh4zZlrGwTPY7T/M+iTTLJqJBJjwwnsE5Y0mV7QK"
	crossorigin="anonymous">
<title>Dashboard</title>
</head>
<body>
	<form action="LogoutServlet" method="get">
		<table>
			<tr>
				<td><input type="submit" value="logout"></td>
			</tr>
		</table>
	</form>

	<style>
.container {
	margin-top: 30px;
}
</style>
	<div class="container">
		<div class="alert-container alert alert-primary" role="alert">
			<h1 class="text-center">Admin Dashboard</h1>
		</div>
		<div class="container">
			<div class="card-deck">
				<div class="card h-25 d-inline-block">
					<div class="card-body text-center">
						<h5 class="card-title">Employee Registered</h5>
						<h4 class="card-text text-danger">
							<strong> <?php echo $admins?>
							</strong>
						</h4>

						<a href="Employee-Add.jsp">Employee-Add</a>

					</div>
					<div class="card-footer">
						<small class="text-muted">Last updated: <?php echo $date?></small>
					</div>
				</div>
				<div class="card h-25 d-inline-block">
					<div class="card-body text-center">
						<h5 class="card-title">Add Image to system</h5>
						<a href="addImage.jsp">Add-image</a>
						<h4 class="card-text text-danger">

							<strong> <?php echo $users?>
							</strong>
						</h4>
					</div>
					<div class="card-footer">
						<small class="text-muted">Last updated: <?php echo $date?></small>
					</div>
				</div>
				<div class="card h-25 d-inline-block">
					<div class="card-body text-center">
						<h5 class="card-title">Orders Count</h5>
						<a href="Employee-list.jsp">Employee List</a>
						<h4 class="card-text text-danger"></h4>
					</div>
					<div class="card-footer">
						<small class="text-muted">Last updated: <?php echo $date?></small>
					</div>
				</div>

				<div class="container">
					<div class="card-deck">
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title">Listed Laptops Count</h5>
								<h4 class="card-text text-danger"></h4>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated: <?php echo $date?></small>
							</div>
						</div>
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title">Listed Keyboards Count</h5>
								<h4 class="card-text text-danger">
									<strong> <?php echo $keyboards?>
									</strong>
								</h4>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated: <?php echo $date?></small>
							</div>
						</div>
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title">Listed Mice Count</h5>
								<h4 class="card-text text-danger">
									<strong> <?php echo $mice?>
									</strong>
								</h4>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated: <?php echo $date?></small>
							</div>
						</div>
					</div>
				</div>
				<div class="container">
					<div class="card-deck">
						<div class="card h-25 d-inline-block">
							<div class="card-body text-center">
								<h5 class="card-title">Newsletter Subscribers</h5>
								<h4 class="card-text text-danger">
									<strong> <?php echo $subscribers?>
									</strong>
								</h4>
							</div>
							<div class="card-footer">
								<small class="text-muted">Last updated: <?php echo $date?></small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>


