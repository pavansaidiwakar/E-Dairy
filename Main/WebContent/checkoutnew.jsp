<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>


</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>

<div class="navbar" id="myTopnav">
  <% if(session.getAttribute("email")!=null){
	%>
  <a href="afterlogin1.jsp">Home</a>
  <%}else{%> 
  <a href="index.html">Home</a>
  <%} %>
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
      <a href="loader1.jsp?type=other productsr">Other Products</a>
      
    </div>
  </div>
  
 <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
  <span style="float:right;">
  <div class="dropdown">  
    <button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="edit-profile.jsp?flag=1">EDIT</a>
      <a href="logout.jsp">LOGOUT</a>
    </div>
  </div>
  
  </span>
</div>
 <% if( session.getAttribute("name").equals(null))
	{response.sendRedirect("index.jsp?flag=0");}
	else{%>
<div style="margin-top:100px;margin-left:500px;border:2px solid grey;align:center;width:500px;background-color:#e8e8c7;border-radius:10px;padding-left:20px;">
   <h3>CHECKOUT</h3>
				<hr/>
				You have selected <b><%= request.getParameter("itemsNo") %></b> items
				<br>
				Total price : Rs. <b><%= request.getParameter("sumtotal") %></b>(Inclusive of delivery charges Rs.30)
				
				 
				<br><br><br><br><br>
				<a href="proopt22.jsp"><button style="width:180px;text-align:center;margin-left:20px;">Cancel</button></a>
				<a href=<%= "instant_upload.jsp?" + request.getQueryString()%>><button style="float:right;width:180px;margin-right:20px;">Proceed to Payment</button></a>
			
    
 </div>


<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>
</body>
</html>
<%}%>