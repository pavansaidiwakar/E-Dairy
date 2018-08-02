<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<!DOCTYPE html>
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
     <script  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
     <script type="text/javascript">  
     
     function deletediv() {
    	 //document.write("nithin");
    	   document.getElementById('deldiv').style.display = "block";
    	}
     </script>
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
					  </div>
		</div>
	  </div>
	</div>
<!-- 
Body Section 
--><%
	Class.forName("com.mysql.jdbc.Driver");
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
	        "root", "nhkmysql");
	String email = (String)session.getAttribute("email");
	String sql = "select sid,prodid,name,variant,price,quantity,period,added_date from product_variants pv,products p,customer_subscription cs,subscription s where cs.cust_email =? and cs.sub_id = s.sid and p.pid=s.productid and s.productid=pv.prodid and s.variant=pv.variants";
	PreparedStatement pr = con.prepareStatement(sql);
	pr.setString(1,email);
	ResultSet rs = pr.executeQuery();
	ResultSet rs3 = rs;
	if(!rs.next())
	{
		System.out.println("you have no subscriptions");
	}
	else{
		String sidval = rs.getString("sid");
		
	%>
	<div class="row">

	<div class="span12">
    <ul class="breadcrumb">
		<li><a href="home.html">Home</a> <span class="divider">/</span></li>
		<li class="active">View your subscription</li>
    </ul>
	<h3>View Your Subscription</h3>	
	<hr class="soft"/>
	<div class="well">
	<h4>Current Subscription</h4>
	<table align="center" cellpadding="10"  border="0" style="background-color:transparent;">
		<tr>
			<th width="50"><b>Sl No</b></th>
			<td width="200"><b>Item</b></td>
			<th width="80"><b>Unit Price</b></th>
			<th width="80"><b>No items</b></th>
			<th width="80"><b>Period</b></th>
		</tr>
		
		<% 
		for(int i=0;;i++)
		{
		%>
		
	   <tr>
	   		<form action="processing1.jsp" method="GET">
			<td align="center"><%= i+1%></td>
			<td><%= rs.getString("name")+"("+ rs.getString("variant")+"ml)" %></td>
			<td align="center"><%= rs.getString("price") %></td>
			<td align="center"><input style="width:30px;" name="quantity" type="text" value=<%= rs.getInt("quantity")%> required><input type="hidden" name="variant" value=<%= rs.getString("variant")%>></td>
			<td align="center"><%= rs.getInt("period")%><input type="hidden" name="sid" value=<%= rs.getString("sid")%>><input type="hidden" name="prodid" value=<%= rs.getString("prodid")%>><input type="hidden" name="price" value=<%= rs.getString("price")%>><input type="hidden" name="period" value=<%= rs.getInt("period")%>></td>
			<td><input type="submit" id="disp" value="Update"/></td>
			</form>	
		</tr>
		
	<% if(!rs.next()){break;}
		}%>
		
		</table>
	
	<button type="button" class="defaultBtn" value="Add more products">Add a product</button>
	
<div>
<b>Not in home? Don't worry. Select the date, we'll not deliver on that day:</b><br><br>
<form action="processing3.jsp" method="get">
<input type="hidden" value="<%=sidval %>" name="sid"/>
<input type="date" name="date" required/>
<button type="submit" class="defaultBtn" value="Stop">Stop all</button>
</form>
</div>

<div>
<b>No need of a product? Don't worry. Select the date and product, we'll not deliver that product on that day:</b><br><br>
<% String sql1 = "select sid,prodid,name,variant,price,quantity,period,added_date from product_variants pv,products p,customer_subscription cs,subscription s where cs.cust_email =? and cs.sub_id = s.sid and p.pid=s.productid and s.productid=pv.prodid and s.variant=pv.variants";
	PreparedStatement pr1 = con.prepareStatement(sql1);
	pr1.setString(1,email);
	ResultSet rs1 = pr1.executeQuery();
	rs1.next();
	%>
<form action="processing2.jsp" method="get">
<select name="value" required>
<option value="">--select product--</option>
<% 

		for(int i=0;;i++)
		{%>
		
	   <option value="<%= rs1.getString("sid")%>,<%= rs1.getString("prodid")%>,<%= rs1.getString("variant")%>" ><%= rs1.getString("name")+"("+ rs1.getString("variant")+"ml)" %></option>
		
	<% if(!rs1.next()){break;}
		}%>
</select>
<input type="date" name="date" required/>
<button type="submit" class="defaultBtn" value="Stop">Stop a product</button>
</form>
</div>

<div style="padding-left:25px" class="row">
<% String sql2 = "select address,city,pincode from customer where email=?";
	PreparedStatement pr2 = con.prepareStatement(sql2);
	pr2.setString(1,email);
	ResultSet rs2 = pr2.executeQuery();
	rs2.next();
	%>
 <b>Your current delivery address:</b><br><br>
 <p><%=rs2.getString("address") %><br><%=rs2.getString("city") %><br><%=rs2.getString("pincode") %></p>
</div>
<b>Amount to be paid at the end of your subscription: <i>Rs. <%=session.getAttribute("total") %></i></b><br><br>
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
   <%}%>
  </body>
</html>
