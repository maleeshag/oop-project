<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
<!DOCTYPE html>
<html>
<meta charset="utf-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.checked {
    color: orange;
    
}
</style>






</head>
<body style="background-image: url('c.jpg');background-repeat: no-repeat;background-size: cover;">

<div  class="container" style="background-color: lightgrey;width: auto;padding: 40px;margin-right:150px;margin-left:150px;margin-bottom: auto;margin-top:40px">
   
   <% 
       String feedbackid  = request.getParameter("fid");
	   String coustomerID = request.getParameter("cou");
	   String feedback = request.getParameter("fback");
	   String feedbackrate = request.getParameter("frate");
   %>


<div class="text-center"  style="margin-top:20px;" ><h1 ><b>Update Feedback</b></h1></div>

   
   <form  action="log2" method="post">
   
   
   <div class="col-md-10" >
     
  
    <label for="FeedbackId">Feedback ID</label>
    <input type="text" class="form-control" id="FeedbackId" name="feedbackid"  value="<%= feedbackid  %>" readonly required >

   <label for="coustomerID">Customer Name</label>
   <input type="text"  class="form-control" id ="coustomerID" name="coustomerID"  value="<%= coustomerID  %>" readonly required >

   
    <label for="validationTextarea ">Feedback Title</label>
   <textarea class="form-control is-invalid" id="validationTextarea" name="feedback" placeholder="Required example textarea" required>    <%= feedback  %></textarea>

   
   
    
		 <div > 
		 <label >Feedback Rate </label>
		 
		 <br>
		 <br>
		<span  onmouseover="starmark(this)" onclick="starmark(this)" id="1one" style="font-size:40px;cursor:pointer;"  class="fa fa-star checked"></span>
		<span onmouseover="starmark(this)" onclick="starmark(this)" id="2one"  style="font-size:40px;cursor:pointer;" class="fa fa-star "></span>
		<span onmouseover="starmark(this)" onclick="starmark(this)" id="3one"  style="font-size:40px;cursor:pointer;" class="fa fa-star "></span>
		<span onmouseover="starmark(this)" onclick="starmark(this)" id="4one"  style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
		<span onmouseover="starmark(this)" onclick="starmark(this)" id="5one"  style="font-size:40px;cursor:pointer;" class="fa fa-star"></span>
		<br/>
		
		
		<input type="hidden" name="feedbackrate" id="example"  >
		</div> 
      
      
      
      <button  onclick="result()" type="submit" style="margin-top:10px;margin-left:5px;" class="btn btn-primary"  name="createfeedback" >Upadate</button>



      <br>
      
       
</div>


</form>


</div> 
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script> 

</body>




<script>
var count;

function starmark(item)
{
	count=item.id[0];
		sessionStorage.starRating = count;
		var subid= item.id.substring(1);
		for(var i=0;i<5;i++)
		{
			if(i<count)
			{
			document.getElementById((i+1)+subid).style.color="orange";
			}
			else
			{
		       document.getElementById((i+1)+subid).style.color="black";
		    }
	
	
	    }
		
		
}

function result()
{
	document.getElementById("example").setAttribute('value',count);
}

</script>







   
</html>