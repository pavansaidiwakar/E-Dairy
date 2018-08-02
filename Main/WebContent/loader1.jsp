<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>
<script  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

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
      <a href="loader1.jsp?type=other products">Other Products</a>
    </div>
  </div>
  <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
  <% if(session.getAttribute("email")!=null){%>
  <span style="float:right;">
  <div class="dropdown">  
    <button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
      <a href="#">EDIT</a>
      <a href="logout.jsp">LOGOUT</a>
    </div>
  </div>
  </span>
  <%}%> 
</div>




<div>
    
<%
	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:8081/diary";
	String user = "root";
	String dbpsw = "nhkmysql";
	String prod_type=request.getParameter("type");
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql = "SELECT * from products where type =?";
	
	ps = con.prepareStatement(sql);
	ps.setString(1,prod_type);

	rs = ps.executeQuery();

	
	%> <br> <h4><%= prod_type.toUpperCase()%><%
	while( rs.next() ){
	%>
	

<div class="card_container">

<div class="card" style="float:left; margin-left:20px; margin-top:25px;"> 
  <input type="hidden" id="parameter1" value="<%= rs.getString("type")%>" name="parameter1"/>
  <input type="hidden" id="parameter2" value="<%= rs.getString("pid")%>" name="parameter2"/>
  <img style="height:250px;width:280px;" id="<%=rs.getString("pid")%>" src="<%=rs.getString("image_link") %>" alt="ERROR LOADING IMAGE" style="width:100%; height:100%;" >
  <div style="background-color:#ccffcc; padding-top:3px;padding-bottom:2px;">
  <h3><%=rs.getString("name") %></h3>  
   Shelf Life: <%= rs.getString("shelf_life") %><br> 
	</div>
</div>

</div>


<%} %>
</div>
<!-- 
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
 -->
 <script type="text/javascript">
 $(document).ready(function(){
	 $('body').on('click','img',function(){
	 	window.location.replace("description1.jsp?pid=" + this.id + "&type=" + document.getElementById("parameter1").value );
	 })
	 });

 function search(){ 
		window.location.replace("search.jsp?name=" + document.getElementById("search").value);
		}
 
 </script>
 
<footer>MADE BY PAVAN AND NITHIN</footer>
</body>
</html>