<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>PRODUCTS::DAIRY PRODUCT MANAGEMENT SYSTEM</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    
    <!-- Bootstrap styles -->
    <link href="assets/css/bootstrap.css" rel="stylesheet"/>
    <!-- Customize styles -->
    <link href="style.css" rel="stylesheet"/>
    <!-- font awesome styles -->
	<link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet">
		<!--[if IE 7]>
			<link href="css/font-awesome-ie7.min.css" rel="stylesheet">
		<![endif]-->

		<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
		<![endif]-->

	<!-- Favicons -->
    <link rel="shortcut icon" href="assets/ico/favicon.ico">
    <style type="text/css">
    	#cartBtn label input {
   		margin-right:100px;
		}
		
		#cartBtn {
		    margin:4px;
		    background-color:orange;
		    border-radius:2px;
		    border:0px;
		    text-alignment:center;
		    overflow:auto;
		    float:left;
		}
		
		
		
		#cartBtn label {
		    float:left;
		    width:4.0em;
		}
		
		#cartBtn label span {
		    text-align:center;
		    padding:5px 0px;
		    display:block;
		}
		
		#cartBtn label input {
			position:absolute;
		    right:1200px;
			
		}
		
		#cartBtn input:checked + span {
		    background-color:red;
		    color:white;
		}
    </style>
  </head>
<body>
<%  String[] cartitems = request.getParameterValues("selected");    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
%>

<!--
Lower Header Section 
-->
<div class="container">
<div id="gototop"> </div>
<header id="header">
<div class="row">
	<div class="span4">
	<h1>
	<a class="logo" href="home.html"><span>eDAIRY</span> 
		<img src="assets/img/1.png" alt="eDAIRY">
	</a>
	</h1>
	</div>
	
	<div class="span4 alignR">
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	<p><br> <strong><a href="staff_login.jsp">staff login</a></strong><br><br></p>
	
	</div>
</div>
</header>

<!--
Navigation Bar Section 
-->
<div class="navbar">
	  <div class="navbar-inner">
		<div class="container">
		  <a data-target=".nav-collapse" data-toggle="collapse" class="btn btn-navbar">
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		  </a>
		  <div class="nav-collapse">
			<ul class="nav">
			  <li class="active"><a href="home.html">Home	</a></li>
			  <li class=""><a href="about_us.html">About Us</a></li>
			  <li class=""><a href="gallery.html">Gallery</a></li>
			  <li class=""><a href="delivery.html">Delivery</a></li>
			  
			</ul>
			<form action="#" class="navbar-search pull-left">
			  <input type="text" placeholder="Search" class="search-query span2">
			</form>
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><b>Welcome  <%=session.getAttribute("name")%></b><!--  <b class="caret"></b>--></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm">
				  Name :  <%=session.getAttribute("name")%>
				  <br>
				  email :  <%=session.getAttribute("email")%>
				  <br>
				  <a href="edit_details.jsp"><button type="button">Edit</button></a>
				  <a href="logout.jsp"><button type="button">Logout</button></a>
				  
				</form>
				</div>
			</li>
			</ul>
		  </div>
		</div>
	  </div>
	</div>
<!-- 
Body Section 
-->
	<div class="row">

	<div class="span12">
    <br>
	<font size="5"><b>PRODUCTS</b></font>
	<input class="defaultBtn" style="float:right;" type="submit" value="View Cart" form="form1"/>
	<br><br>
	<div class="well well-small">
	<h3>ALL PRODUCTS </h3>
	<form  target="_blank" id="form1" action="carting.jsp" method="GET">
	 <%
		String sql = "SELECT * FROM products";
		Statement st = con.createStatement();
		ResultSet rs = st.executeQuery(sql);
		
		for(int i=0;i<20;i++) {%>
		<div class="row-fluid">
		  <ul class="thumbnails">
		  <%for(int j=0;j<4 && rs.next();j++){%>
			<li class="span3">
			  <div class="thumbnail">
				
				String proid = <%= rs.getString("pid")%>;
				<a href="product_details.jsp?product_id=" +proid ><img src="assets/img/peda.jpeg" alt=""/></a>
				<div class="caption cntr">
					<p><%= rs.getString("name") %></p>
					<p><strong>Rs.100</strong></p>
					
					
					 <div id="cartBtn">
   						<label>
     						 <input type="checkbox" name="selected" value=<%= rs.getString("pid") %> ><span>Add</span>
  						 </label> 
					</div>
					<br class="clr">					
				</div>
			  </div>
			</li>
			<%} %>
			</ul>
			</div>
			<%} %>
			
		<input class="defaultBtn" style="float:right;" type="submit" value="View Cart" form="form1"/>
		
		</form>
	
	
	
	  </div>  
	</div>	
	<hr class="soft"/>
	
	

</div>


</div><!-- /container -->


	
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>

