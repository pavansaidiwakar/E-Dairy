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
     function showDiv() {
  	   document.getElementById('adddiv').style.display = "block";
  	 	document.getElementById('deldiv').style.display = "block";
  	}
     function deletediv() {
    	 document.write("nithin");
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
	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairy",
	        "root", "0000");
	
	String sql = "select sid,prodid,name,variant,price,quantity,period,added_date from product_variants pv,products p,customer_subscription cs,subscription s where cs.cust_email =? and cs.sub_id = s.sid and p.pid=s.productid and s.productid=pv.prodid and s.variant=pv.variants";
	PreparedStatement pr = con.prepareStatement(sql);
	pr.setString(1,(String)session.getAttribute("email"));
	ResultSet rs = pr.executeQuery();
	ResultSet rs3 = rs;
	if(!rs.next())
	{
		System.out.println("you have no subscriptions");
	}
	else{
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
		<form id="form1" action="processing.jsp" method="GET"></form>
		<% 
		for(int i=0;rs.next();i++)
		{%>
	   <tr>
	   
			<td align="center"><%= i+1%></td>
			<td><%= rs.getString("name")+"("+ rs.getString("variant")+"ml)" %></td>
			<td align="center"><%= rs.getString("price") %></td>
			<td align="center"><input name=<%= rs.getString("name")%> type="text" value=<%= rs.getInt("quantity")%>></td>
			<td align="center"><input name=<%= rs.getString("prodid")%> type="text" value=<%= rs.getInt("period")%>></td>
			<td><input type="submit" id="disp" style="display:none;"/></td>
				
		</tr>
	<% }%></form>
		<button class="defaultBtn" id="update">Update</button>
		</table>
	
	<input type="button"  class="defaultBtn" value="Add New Product" onclick="showDiv()">
	<input type="button"  class="defaultBtn" value="Delete a Product" onclick="deletediv()">
	
	<div  style="display:none;" class="hideit" id="adddiv">
	 <%
		String sql1 = "SELECT * FROM products";
	 	String sql2 = "SELECT * FROM product_variants";
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(sql1);
		ResultSet rs2 = st2.executeQuery(sql2);
		int flag = 0;
		rs2.next();
		for(int i=0;i<20;i++) {%>
		<div class="row-fluid">
		  <ul class="thumbnails">
		  <%for(int j=0;j<4 && rs1.next() && flag == 0;j++){
		 %>
			<li class="span3">
			  <div class="thumbnail">
				
				<form id="form" action="processing.jsp" method="GET">
				<a href="product_details.jsp?product_id=" + <%= rs1.getString("pid")%>><img src="assets/img/peda.jpeg" alt=""/></a>
				<div class="caption cntr">
					<p><%= rs1.getString("name") %></p>
					
					<!--  <select  style="width:100px;" name=<%= rs1.getString("pid") %>>
					<%for(int p=0;;p++)
					{
						
						if(rs1.getString("pid").equals(rs2.getString("prodid"))){ 
						System.out.println(rs1.getString("pid")+"   "+rs2.getString("prodid") + "  " + rs2.getString("variants") );%>
						
					<option value=<%= rs2.getString("variants")%>> <%= rs2.getString("variants")%></option>
					<%
					if(!rs2.next())
						flag = 1;}
						else
						{
							break;
						}
					} %>
					
					</select>-->
					
					 <div id="cartBtn">
   						<label>
     						 <input id="checkbox" type="checkbox" name="selected" value=<%= rs1.getString("pid") %> ><span>Add</span>
  						 </label> 
					</div>
					<br class="clr">					
				</div>
				</form>
			  </div>
			</li>
			<%} %>
			</ul>
			</div>
			<%} %>
			
		
		
		</form>
	
	</div>
	
	
	<div style="display:none;" id="deldiv">
	<form action=delete.jsp" method="GET">
	<select name="pid">
	<%for(int z=0;rs.next();z++){ %>
	<option value=<%=rs3.getString("proid")+"&sid="+rs3.getString("sid")%>><%= rs.getString("name")+"("+ rs.getString("variant")+"ml)" %></option>
	<%} %>
	</select>
	<input type="submit" value="Delete" name="Delete"/>
	</form>
	</div>
	
	
	<div class="row">
		
</div>


</div><!-- /container -->
</div>
</div>

<script type="text/javascript">  
        $(function(){
         $('.update').on('click',function(){
            $('#form2').submit();
            });
        });
        
    </script>
	
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
