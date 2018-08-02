<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
    <%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpUtils.*" %> 
<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>STAFF::HOME PAGE</title>


</head>
	<body  onscroll="myFunction()">
<header style="background-color:#660000">
  <h1 >DAIRY PRODUCT MANAGEMENT SYSTEM</h1>	
  <br>
   <h3>Staff VIEW</h3>
</header>

<div class="navbar" id="myTopnav" style="background-color:#333333">
  <a href="base.html">Home</a>
  
 
</div>


	</div>
	<br>
	<br>
    <form action="staff_login.jsp" method="get">
  

  <div class="container" style="width:500px; margin:0 auto;"  >
  	
  	<span style="text-align:center"><h1>STAFF LOGIN</h1><span>
  	<%if(request.getParameter("flag").equals("1")){%>
  		<p style="align:center; color:red;">Invalid credentials!!</p>
  	<%} %>
    <input type="text" placeholder="Staff ID" name="staff_id" required>

    
    <input type="password" placeholder="Password" name="pwd" required>
        
    <button type="submit">Login</button>
    
  </div>

</form>
	<script>
var navbar = document.getElementById("myTopnav");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>


</body>
</html>