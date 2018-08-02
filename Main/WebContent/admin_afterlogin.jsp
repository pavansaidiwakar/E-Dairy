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
   <h3>Admin VIEW</h3>
</header>

<div class="navbar" id="myTopnav" style="background-color:#333333">
  <a href="admin_afterlogin.jsp?check=0">Home</a>
  
  <span style="float:right;">
  <div class="dropdown">  
    <button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      
      <a href="admin_logout.jsp">LOGOUT</a>
    </div>
  </div>
  </span>
  
  
</div>


<div>
    
     
    
    <div align="center" style="font-size:3">
      <a href="admin1.html"><button id="123" style="height:70px;width:200px">Add Staff </button></a><br>
      <a href="admin2.html"><button id="123" style="height:70px;width:200px" >Remove Staff </button></a><br>
      <a href="admin3.html"><button id="123" style="height:70px;width:200px">Add Products </button></a><br>
      <a href="admin4.html"><button id="123" style="height:70px;width:200px">Remove Products </button></a><br>
      <a href="view_user.jsp"><button id="123" style="height:70px;width:200px">View Users </button></a><br>
      <a href="view_products.jsp"><button id="123" style="height:70px;width:200px">View Products </button></a><br>
      <a href="view_staff.jsp"><button id="123" style="height:70px;width:200px">View Staff </button></a><br>
     
    </div>
  </div>
  <%
  switch(request.getParameter("check"))
  {
  case "ap1":%><script>alert('Product added successfully!');</script><%
  break;
  case "ap0":%><script>alert('Error in adding Product.');</script><%
  break;
  case "as1":%><script>alert('Staff added successfully!');</script><%
  break;
  case "as0":%><script>alert('Error in adding Staff.');</script><%
  break;
  case "rp1":%><script>alert('Product deleted successfully!');</script><%
  break;
  case "rp0":%><script>alert('Error in deleting the Product.');</script><%
  break;
  case "rs1":%><script>alert('Staff deleted successfully!');</script><%
  break;
  case "rs0":%><script>alert('Error in deleting the Staff.');</script><%
  break;
  }%>