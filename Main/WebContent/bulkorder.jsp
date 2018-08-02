<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
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
   <% if(session.getAttribute("email")!=null){%>
  <a href="feedback1.jsp">Feedback</a>
  <%}%> 
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
  &nbsp;&nbsp;&nbsp;&nbsp;
  <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
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
	<% if( session.getAttribute("name").equals(null))
	{response.sendRedirect("index.jsp?flag=0");}
	else{%>
	<h2>BULK ORDERS</h2>
 <div class="container" style="width:800px; margin:0;margin-left:330px;margin-top:40px;">
 
<form class="form-horizontal" action="registration3.jsp" method="GET">
<% if(request.getParameter("submit").equals("1")){
     %><p style="align:center;">Bulk order has been placed successfully!!<br>Our staff will contact you soon.</p>
     <%}%>
     <% if(request.getParameter("submit").equals("2")){
     %><script>alert('Error in placing bulk order. Try again');</script>
     <%}%>
		<h3 style="font-family:Rockwell; align:center;">Give us more information</h3>
		
		  <textarea style="width:100%" placeholder="Purpose" name="purpose" required></textarea>
		
		
		<br>
		
		
		  <textarea style="width:100%" placeholder="Address" name="address" required></textarea>
		<br>

	 
			  <select style="width:100%" type="text" name="city" required>
  <option >--select city--</option>
  <option value="Bengaluru">Bengaluru</option>
  <option value="Bengaluru Rural">Bengaluru Rural</option>
  <option value="Bengaluru North">Bengaluru North</option>
  <option value="Bengaluru East">Bengaluru East</option>
</select>
	
		<br>
 
		  <input style="width:100%" type="number" pattern="[5]{1}[0-9]{5}" placeholder="Pin-Code*" name="pincode" required>
	<br>
			  <input style="width:100%" type="text" id="inputFname" name="name" placeholder="Contact Person Name*" required>
	<br>	
		  <input style="width:100%" type="email" placeholder="Email* " name="email" required>
	<br>	
	 
		  <input style="width:100%" type="text" pattern="[7-9]{1}[0-9]{9}" placeholder="Mobile Number*" name="mobile" maxlength="10" required>
	<br>
		  <button style="width:100%text-align:center;"  type="submit"> Submit</button>
	
	</form>
	
	 
</div>

</body>
</html>
<%}%>