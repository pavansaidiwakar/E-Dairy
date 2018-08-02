<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpUtils.*" %> 
<%!String[] cartitems;%>
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
    <script  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
    
    
    
    
  </head>
<body>
<%  StringBuffer url = request.getRequestURL();
	String query = request.getQueryString();
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/dairy",
            "root", "0000");
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
			
			
			<ul class="nav pull-right">
			<li class="dropdown">
				<a data-toggle="dropdown" class="dropdown-toggle" href="#"><b>Welcome  <%=session.getAttribute("name")%></b><!--  <b class="caret"></b>--></a>
				<div class="dropdown-menu">
				<form class="form-horizontal loginFrm">
				  &nbsp;<b>Name</b> :  <%=session.getAttribute("name")%>
				  <br>
				  &nbsp;<b>Email</b> :  <%=session.getAttribute("email")%>
				  <br><br>&nbsp;
				  <a href="edit_details.jsp"><button class="defaultBtn" type="button">Edit</button></a>
				  &nbsp;&nbsp;
				  <a href="logout.jsp"><button class="defaultBtn" type="button">Logout</button></a>
				  
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
    
	<h3> PRODUCTS </h3>
	<input class="defaultBtn" style="float:right;" type="submit" value="View Cart" form="form1"/>
	<br><br>
	<div class="well well-small">
	<h3>ALL PRODUCTS </h3>
	<form  target="_blank" id="form1" action="carttemp.jsp" method="GET">
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
				
				
				<a href="product_details.jsp?product_id=" + <%= rs1.getString("pid")%>><img src="assets/img/peda.jpeg" alt=""/></a>
				<div class="caption cntr">
					<p><%= rs1.getString("name") %></p>
					
					<select  style="width:100px;" name=<%= rs1.getString("pid") %>>
					<%for(int p=0;;p++)
					{
						
						if(rs1.getString("pid").equals(rs2.getString("prodid"))){ 
						%>
						
					<option value=<%= rs2.getString("variants")%>> <%= rs2.getString("variants")%></option>
					<%
					if(!rs2.next())
						flag = 1;}
						else
						{
							break;
						}
					} %>
					
					</select>
					
					 <div id="cartBtn">
   						<label>
     						 <input type="checkbox" name="selected" value=<%= rs1.getString("pid") %> ><span>Add</span>
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
</div>



</div><!-- /container -->
<script type="text/javascript">
	var totalsum = 0;
$("table input").on('change blur input', function () {
    var val = this.value;
    var sum = 0;
    $(this).closest('tr').find('td:eq(4)').text(function () {
        return (+$.trim($(this).siblings(':eq(2)').text()) * +val)
    });
    $('table  tr td:nth-of-type(5)').each(function () {
        sum += parseFloat($(this).text()) || 0;
    });
    $('.sum').text(sum);
    $('.sumtotal').text(sum+30);
    totalsum = sum+30;
    
});
function call(a){ 
	window.location.replace("checkout.jsp?sumtotal="+ totalsum + "&itemsNo=" + a);
	}

</script>




	
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
  </body>
</html>
