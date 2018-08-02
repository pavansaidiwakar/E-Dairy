<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::HOME PAGE</title>


</head>
	<body  onscroll="myFunction()">
<header style="background-color:#660000">
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
   <br>
   <h3>Staff View</h3>
</header>

<div class="navbar" id="myTopnav" style="background-color:#333333">
  <a href="staff_afterlogin.jsp">Home</a>
  
  <span style="float:right;">
  <div class="dropdown">  
    <button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      
      <a href="staff_logout.jsp">LOGOUT</a>
    </div>
  </div>
  </span>
  
  
</div>


<div>
    
    <div align="center"">
      <a href="view_products1.jsp"><button style="height:70px;width:200px">View Products</button></a><br>
      <a href="view_users.jsp"><button  style="height:70px;width:200px">View Users </button></a><br>
      <a href="view_feedback.jsp?update=0"><button  style="height:70px;width:200px">View Feedback</button></a><br>
      <a href="view_bulk.jsp?update=0"><button  style="height:70px;width:200px">View Bulk Orders</button></a><br>
    </div> 
    
    
  </div>