<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Registration::DAIRY PRODUCT MANAGEMENT SYSTEM</title>
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
	<a class="logo" href="index.html"><span>eDAIRY</span> 
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
			  <li class=""><a href="about_us.html">My Account</a></li>
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
				<form class="form-horizontal loginFrm">
				  <div class="control-group">
					<input type="email" class="span2" id="inputEmail" placeholder="Email">
				  </div>
				  <div class="control-group">
					<input type="password" class="span2" id="inputPassword" placeholder="Password">
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
<div id="sidebar" class="span3">
<div class="well well-small">
	<ul class="nav nav-list">
		<li><a href="productsnew.jsp"><span class="icon-chevron-right"></span>All Products</a></li>
		<li><a href="gheeandbutter.html"><span class="icon-chevron-right"></span>Butter And Ghee</a></li>
		<li><a href="milk.html"><span class="icon-chevron-right"></span>Milk</a></li>
		<li><a href="fermented.html"><span class="icon-chevron-right"></span>Fermented Products</a></li>
		<li><a href="sweets.html"><span class="icon-chevron-right"></span>Sweets</a></li>
		<li><a href="productsnew.jsp"><span class="icon-chevron-right"></span>Ice-Creams</a></li>
		<li><a href="productsnew.jsp"><span class="icon-chevron-right"></span>Choclate</a></li>
		<li><a href="productsnew.jsp"><span class="icon-chevron-right"></span>Cookies </a></li>
		<li><a href="productsnew.jsp"><span class="icon-chevron-right"></span>Milk Products</a></li>
		<li><a href="productsnew.jsp"><span class="icon-chevron-right"></span>Other Products</a></li>
		<li style="border:0"> &nbsp;</li>
		
	</ul>
</div>
	
			  
			  
			
			
			<br>
			<br>
			

	</div>
	<div class="span9">
    <ul class="breadcrumb">
		<li><a href="home.html">Home</a> <span class="divider">/</span></li>
		<li class="active">Registration</li>
    </ul>
	<h3>Registration</h3>	
	<hr class="soft"/>
	<div class="well">
	
	<p>Registration successful! Login here</p>
	
	</div>
		<div class="span1"> &nbsp;</div>
		<div class="span4">
			<div class="well" >
			
			<form width="100%" action="login.jsp" method="GET">
			  <div class="control-group">
				
				<div class="controls">
				  <input width="100%" class="span3"  name="email" type="email" placeholder="Email" required>
				</div>
			  </div>
			  <div class="control-group">
				
				<div class="controls">
				  <input width="100%" type="password" name="pwd" class="span3" placeholder="Password" required>
				</div>
			  </div>
			  <div class="control-group">
				<div class="controls">
				  <input type="submit" class="defaultBtn" value="Sign in"/> <br><br>
				  </form>
				  <form action="registration.html">
				<input  type="submit" class="defaultBtn" value="Create New Account">
			</form>
			</div>
		</div>


</div><!-- /container -->
</div>
</div>

	
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
