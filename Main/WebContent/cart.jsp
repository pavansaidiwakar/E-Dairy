<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%!String[] cartitems;
	String priceid, quantityid, subtotalid, remove_itemid;

%>
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
    <script data-require="jquery" data-semver="2.1.4" src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    <script>
    $(function(){
  	$("#quantity").change(function(){
        $("#subTotal").val(parseInt($(this).val()) * parseInt($("#price").val()));
        subtotal(3);
    	});
	});
    $(function(){
      	$("#quantity2").change(function(){
            $("#subTotal2").val(parseInt($(this).val()) * parseInt($("#price2").val()));
            subtotal(3);
        	});
    	});
    $(function(){
      	$("#quantity3").change(function(){
            $("#subTotal3").val(parseInt($(this).val()) * parseInt($("#price3").val()));
            subtotal(3);
        	});
    	});
    $(function(){
      	$("#quantity4").change(function(){
            $("#subTotal4").val(parseInt($(this).val()) * parseInt($("#price3").val()));
            subtotal(3);
        	});
    	});
    </script>
    <script type="text/javascript">
    function subtotal(a)
    {
    	var i,sum=0;
    	for(i=1;i<=a;i++)
    		{
    			sum+=document.getElementById(subTotal);
    		}
    	document.getElementById(subtotal).value(sum);
    }
    </script>
  </head>
<body>
<% 
	
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
			<b><p align="right">Welcome <%=session.getAttribute("name")%>....</p></b>
		  </div>
		</div>
	  </div>
	</div>
<!-- 
Body Section 
-->
	<div class="row">

	<div class="span12">
    
	<h3> PRODUCTS </h3>
	<div class="well well-small">
	
	<%  if(request.getParameterValues("selected")==null)
	{%><h3>CART(0 items selected)</h3>
	<div style="height:300px; text-align:center;"> 
	<p style="height:120px;"><h3>No items were added to cart</h3></p>
	</div>
	<% }
	else{
	cartitems = request.getParameterValues("selected");
	%>
	<h3>CART(<%= cartitems.length %> items selected)</h3>
	<table align="center" cellpadding="10"  border="0" style="background-color:transparent;">
		<tr>
			<td width="50"><b>Sl No</b></td>
			<td width="250"><b>Item</b></td>
			<td width="100"><b>Unit Price</b></td>
			<td width="100"><b>Quantity</b></td>
			<td width="80" align="right"><b>Sub Total</b></td>
			<td></td>
		</tr>
	
	<%
	String sql = "SELECT pid, name, type FROM  products WHERE pid = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	for(int i=0;i<cartitems.length;i++)
	{
		ps.setString(1,cartitems[i]);
		ResultSet rs = ps.executeQuery();
		rs.next();
		priceid = "price" + i+1;
		quantityid = "quantity" + i+1;
		subtotalid = "subTotal" + i+1;
		remove_itemid = "remove_item" + i+1;
	
		
	%>
	   <tr>
			<td><%= i+1%></td>
			<td><%= rs.getString("name") %></td>
			<td><%-- rs.getString("price") --%><input id="priceid" type="text" value="100" style="width:80px; border:0px; background-color:transparent;" readonly /></td>
			<td><input id="quantityid" type="number" value="1" min="1" style="width:50px;" name="quantity" /></td>
			<td align="right"><input type="text" id="subTotal" style="width:80px; border:0px; background-color:transparent;"  value="100" name="subtotal" /></td>
			subtotal(<%= cartitems.length %>);
			<td><input type="button" id="remove_item" value="X" onclick="remove_item();" /></td>
		</tr>
	<% }%>
	
	
	</table>
	<%} %>
	  </div>
	  <div  style="height:200px; width:920px;" class="well well-small">
	  <div  style="height:150px; width:300px; float:right; position:relative; top:15px; right:120px;" class="well well-small">
	 <p><h4><b>Subtotal   Rs. <input type="text"  id="subtotal2"  name="subtotal2" style="width:80px; border:0px; background-color:transparent;"  />  </b></h4></p>
	 </div>
	  </div>  
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
