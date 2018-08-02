<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>
<style>
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}

</style>


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
      <a href="loader1.jsp?type=cookies">Cookies</a>
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
	String pid = request.getParameter("pid");
	
	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:8081/diary";
	String user = "root";
	String dbpsw = "nhkmysql";
	String sql3 = "SELECT pid,name,type,variants,price,shelf_life,image_link FROM products p,product_variants pv WHERE p.pid = ? AND p.pid = pv.prodid";
	
	
	
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, user, dbpsw);
		PreparedStatement ps = con.prepareStatement(sql3);
		ps.setString(1, pid);
		ResultSet rs = ps.executeQuery();
		
 
		%><div align="center" width="100%">
		<a href="<%="search.jsp?name=" + request.getParameter("name")%>"> <h3 style="font-family: Rockwell;text-align:left;">Go Back </h3></a><%  
		if(rs.next())
		{%>
		
				<div style="float:left;height:400px;width:50%;"  >
						<img style="width:400px;height:350px;margin-top:100px;" src= <%= rs.getString("image_link") %> />
				</div>
				
				<div style="float:right;padding-left:100px;text-align:left;margin-top:160px;height:400px;width:50%;font-family:Calibri;">
				<table style="width:500px;text-align:center;font-size:25px;" >
				<tr><td><b>Name </b></td> <td><%= rs.getString("name") %></td></tr>
                <tr><td><b>Type </b></td> <td><%= rs.getString("type") %></td></tr>
                <tr><td><b>Shelf Life</b> </td><td><%= rs.getString("shelf_life") %>&nbsp;days</td></tr>
                </table><br><br>
                
                <b>Available variants :</b> <br>
                <ul>
                <% while(true){ %>
                <%= rs.getString("variants") %>ml&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Price: <%= rs.getString("price") %>
                <br>
                <% if(!rs.next())
                {
                	break;
                }%>
                <%}%>
				</ul>
			</div>
		<%}
		else {
		%><div style="align:center;width:100%;">
		<p>Oops!! No product found..</p>
		</div>
		<%} %>   
  </div>

<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>


</body>
</html>