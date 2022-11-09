<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootswatch@4.5.2/dist/solar/bootstrap.min.css"
	integrity="sha384-NCwXci5f5ZqlDw+m7FwZSAwboa0svoPPylIW3Nf+GBDsyVum+yArYnaFLE9UDzLd"
	crossorigin="anonymous">
<script type="text/javascript">
	function validate() {
		var email = document.getElementById("email").value;
		var pass = document.getElementById("pass").value;

		if (email == "") {
			document.getElementById("emailerror").innerHTML = "Please enter Email...";
			return false;
		} else {
			document.getElementById("emailerror").innerHTML = "";
		}

		if (pass == "") {
			document.getElementById("passerror").innerHTML = "Please enter password...";
			return false;
		} else {
			document.getElementById("passerror").innerHTML = "";
		}

		if (pass.length<5 || pass.length>8) {
			document.getElementById("passerror").innerHTML = "Password should be in betwwen 5  to 8 character..";
			return false;
		} else {
			document.getElementById("passerror").innerHTML = "";
		}

		return true;
	}
</script>
</head>
<body>
	
	<style>
background-image
:
 
url
(
"
images
/
Acer
 
Nitro
 
5
.png
"
)
;
</style>


	<div align="center">
		<fieldset>

			<%
			String status = (String) request.getAttribute("status");
			if (status != null) {
				out.println(status);
			}
			%>
			<legend>
				<h1>Login</h1>
			</legend>
			<form onsubmit="return validate()" action="loginServlet"
				method="post">
				<table>
					<tr>
						<td>Email :</td>
						<td><input type="email" id="email" name="emailid"></td>
						<td><span style="color: red" id="emailerror">*</span></td>
					</tr>

					<tr>
						<td>Password :</td>
						<td><input type="password" id="pass" name="password"></td>
						<td><span style="color: red" id="passerror">*</span></td>
					</tr>

					<tr>
						<td><input type="submit" value="login"></td>
					</tr>
				</table>
			</form>
			<br>
			<hr>
			<!-- <form action="LogoutServlet" method="get">
				<table>
					<tr>
						<td><input type="submit" value="logout"></td>
					</tr>
				</table>
			</form> -->
		</fieldset>
	</div>
</body>
</html>