<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Display Image</title>

</head>
<body>
	<img src="./images/imageMSI GF75 Thin 10UE i.png">
	<h1 style="color: red" align="center">DISPLAY IMAGE DETAIL</h1>

	<div align="center">

		<form action="DisplayServlet" method="post">
			Enter Image Id : <input type="number" name="imageId"> <input
				type="submit" value="Display Image">
		</form>

	</div>

	<hr>

	<%
	String imgFileName = (String) request.getAttribute("img");
	String imgId = (String) request.getAttribute("id");
	System.out.println(imgFileName); //check image name in console window
	
	//out.print("<img src='./images/imageAsus ROG Zephyrus SCAR 15.png'" + imgFileName + ">");
	//out.print("<img src='./images'" + imgFileName + ">");
	%>

	<div align="center">
		<table border="5px" style="width: 600px">
			<tr>
				<th>Image Id</th>
			
				<th>Image</th>
				
				<th>Image Description</th>
			</tr>

			<%
			if (imgFileName != "" && imgId != "") {
			%>

			<tr>
				<td><%=imgId%></td>
				<td><%	out.print("<img src='./images'" + imgFileName + ">"); %>				
					</td>
			</tr>
	
			<%
			}
			%>
		</table>
	</div>
</body>
</html>


