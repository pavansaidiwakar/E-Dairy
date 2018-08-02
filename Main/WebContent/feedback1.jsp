<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::SIGN-UP</title>


</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>

<div class="navbar" >
  <a href="afterlogin1.jsp">Home</a>
  <a href="about_us.jsp">About us</a>
  <div class="dropdown">
    <button class="dropbtn"> Products 
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
     <a href="loader1.jsp?type=Ghee and Butter">Butter And Ghee</a>
      <a href="loader1.jsp?type=milk">Milk</a>
      <a href="loader1.jsp?type=Fermented Products">Fermented Products</a>
      <a href="loader1.jsp?type=sweets">Sweets</a>
      <a href="loader1.jsp?type=ice-creams">Ice-Creams</a>
      <a href="loader1.jsp?type=chocolate">Chocolate</a>
      
      <a href="loader1.jsp?type=milk products">Milk Products</a>
      <a href="loader1.jsp?type=other products">Other Products</a>    </div>
  </div>
  <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
  <a href="feedback1.jsp">Feedback</a>
  <span style="float:right;">
  		<div class="dropdown">  
    	<button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <%session.setAttribute("calledpage",request.getRequestURL() + "?" + request.getQueryString()); %>
      <a href="edit-profile.jsp?flag=1">EDIT</a>
      <a href="logout.jsp">LOGOUT</a>
    </div>
  </div>
  
  </span>
</div>

	</div>
	<br><br>
 <div class="container" style="width:800px; margin:0 auto;">
<form action="feedback.jsp">
    <h3 align="center" style="font-family:Rockwell">Feedback form</h3>
    
     <textarea name="feedback" placeholder="Enter your feedback here" rows="10" cols="80"></textarea><br>
      
      
  
     <button type="submit" name="submitAccount"  class="exclusive shopBtn">Submit</button>
  </form>
</div>
<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>

</body>
</html>
