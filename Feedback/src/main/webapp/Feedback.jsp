<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body style="background-image: url('c.jpg');background-repeat: no-repeat;background-size: cover;">

<div  class="container" style="background-color: lightgrey;width: auto;padding: 40px;margin: auto;margin-top:40px">
  
   <div class="text-center"  style="margin-top:20px;margin-bottom:60px;" ><h1 ><b>Customer Feedback</b></h1></div>      
    <c:forEach var ="cus" items="${feedbackDetails}">
     
    
     <c:set var = "feedbackid" value="${cus.feedbackid}"/>
     <c:set var = "coustomer" value="${cus.coustomer}"/>
     <c:set var = "feedback" value="${cus.feedback}"/>
     <c:set var = "feedbackrate" value="${cus.feedbackrate}"/>
     
    
     
	 <h4>Customer Name : ${cus.coustomer}</h4>
	 
	 <div class="mb-3">
     <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" readonly> ${cus.feedback}</textarea>
     </div>

	 <h5>Rate Point : ${cus.feedbackrate}</h5>
	 
	<br>
	
	
	

	
	<c:url value="updateFeedback.jsp" var="feedbackupdate">
		<c:param name="fid" value="${feedbackid}"/>
		<c:param name="cou" value="${coustomer}"/>
		<c:param name="fback" value="${feedback}"/>
		<c:param name="frate" value="${feedbackrate}"/>
	</c:url>
	
	
	

     <a href="${feedbackupdate}">
     
     <input type="button"  class="btn btn-dark" value="update feedback">
     </a>
     
     
     
     <c:url value="DeleteFeedback.jsp" var="feedbackDelete">
		<c:param name="fid" value="${feedbackid}"/>
		<c:param name="cou" value="${coustomer}"/>
		<c:param name="fback" value="${feedback}"/>
		<c:param name="frate" value="${feedbackrate}"/>
	</c:url>
	
	
	

     <a href="${feedbackDelete}">
     
     <input   type="button" class="btn btn-dark"  value="Delete feedback">
     </a>
     
     
     <br><br><br><br>
     
   </c:forEach>
   
   <br>


   
    <a href="InsertFeedback.jsp">
     
     <input type="button" class="btn btn-dark" value="Insert feedback">
    </a>
    
   <br>
   <br>

   
 <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 
     
    
    
  </div>
</body>
</html>