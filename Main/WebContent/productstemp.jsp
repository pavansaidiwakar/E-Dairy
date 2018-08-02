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
  </head>
<body>


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
	<div class="span4">
	<div class="offerNoteWrapper">
	<h1 style="font-family:Rockwell">
	
	DAIRY PRODUCT MANAGEMENT SYSTEM
	</h1>
	</div>
	</div>
	<div class="span4 alignR">
	<p><br> <strong> Support (24/7) :  0800 1234 678 </strong><br><br></p>
	
	
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
			  <li class=""><a href="aboutus.html">About Us</a></li>
			  <li class=""><a href="gallery.html">Gallery</a></li>
			  <li class=""><a href="delivery.html">Delivery</a></li>
			  
			</ul>
			<form action="#" class="navbar-search pull-left">
			  <input type="text" placeholder="Search" class="search-query span2">
			</form>
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><span class="icon-lock"></span> Login <b class="caret"></b></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm" action="login.jsp" method="GET">
				  <div class="control-group">
					<input type="email" class="span2" id="inputEmail" placeholder="Email" name="email">
				  </div>
				  <div class="control-group">
					<input type="password" class="span2" id="inputPassword" placeholder="Password" name="pwd">
				  </div>
				  <div class="control-group">
					<label class="checkbox">
					<input type="checkbox"> Remember me
					</label>
					<button type="submit" class="shopBtn btn-block">Sign in</button>
				  </div>
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

	<div class="span9">
    
	<h3> PRODUCTS </h3>
	<div class="well well-small">
	<h3>ALL PRODUCTS </h3>
		<div class="row-fluid">
		  <ul class="thumbnails">
		  <%
		  Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
		            "root", "nhkmysql");
		    String sql = "select * from products";
		    Statement st = con.createStatement();
		    ResultSet rs;
		    rs = st.executeQuery(sql);
		    for(int i=0;rs.next();i++){ %>
			<li class="span4">
			  <div class="thumbnail">
				
				
				<a href="product_details.html"><img src="assets/img/p0.jpg" alt=""></a>
				<div class="caption cntr">
					<p><%=rs.getString("name")%></p>
					<p><strong><%=rs.getString("price") %></strong></p>
					
					 
					<br class="clr">
				</div>
			  </div>
			</li>
			<% } %>
			<!--  <li class="span4">
			  <div class="thumbnail">
				
				
				<a href="product_details.html"><img src="assets/img/p1.jpg" alt=""></a>
				<div class="caption cntr">
					<p>Milk Product 2</p>
					<p><strong>Rs.200</strong></p>
					
					 
					<br class="clr">
				</div>
			  </div>
			</li>
			<li class="span4">
			  <div class="thumbnail">
				
				
				<a href="product_details.html"><img src="assets/img/p2.jpg" alt=""></a>
				<div class="caption cntr">
					<p>Milk Product 3</p>
					<p><strong>Rs.300</strong></p>
					
					 
					<br class="clr">
				</div>
			  </div>
			</li>-->
		  </ul>
		</div>
	
	
	
	    
	</div>	
	<hr class="soft"/>
	
	
</div>
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
