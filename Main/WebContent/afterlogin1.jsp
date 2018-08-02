<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<head>
	<!--  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">-->
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>


</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>


<div class="navbar" >
  <a href="afterlogin1.jsp">Home</a>
  <a href="about_us.jsp">About us</a>
  <a href="feedback1.jsp">Feedback</a>
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



<div>
    
     
    <br>
    <br>
    <div align="center" style="font-size:3">
    <%if( session.getAttribute("name").equals(null))
	{response.sendRedirect("index.jsp?flag=0");}
	else{
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
	        "root", "nhkmysql");
	String email = (String)session.getAttribute("email");
	String sql = "select sub_id from customer_subscription where cust_email = ?";
	PreparedStatement pr = con.prepareStatement(sql);
	pr.setString(1,email);
	ResultSet rs = pr.executeQuery();
	if(rs.next())
	{
		%><a href="totalcalc.jsp?sid=<%= rs.getString("sub_id")%>"><button  style="height:70px;width:200px">SUBSCRIPTION</button></a><br><%
	}
	else
	{
		%><a href="subtry1.jsp"><button  style="height:70px;width:200px">SUBSCRIPTION</button></a><br><%
	}%>
	<br>
	
      
      <a href="bulkorder.jsp?submit=0"><button  style="height:70px;width:200px">BULK ORDER</button></a><br><br>
      <a href="proopt22.jsp"><button  style="height:70px;width:200px">INSTANT ORDER </button></a><br><br>
     
    </div>
  </div>
  <%} %>
<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>
<footer>DAIRY PRODUCT MANAGEMENT SYSTEM</footer>
</body>
</html>