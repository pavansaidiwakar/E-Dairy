<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>
<style type="text/css">
    	#cartBtn label input {
   		margin-right:100px;
		}
		
		#cartBtn {
		    margin:4px;
		    background-color:#ccffcc;
		    border-radius:2px;
		    border:0px;
		    text-alignment:center;
		    overflow:auto;
		    float:left;
		}
		
		
		
		#cartBtn label {
		    float:left;
		    width:5em;
		    height:2.5em;
		}
		
		#cartBtn label span {
		    text-align:center;
		    padding:5px 0px;
		    display:block;
		}
		
		#cartBtn label input {
			position:absolute;
		    right:1500px;
			
		}
		
		#cartBtn input:checked + span {
		    background-color:orange;
		    color:white;
		    width:5em;
		    height:2.5em;
		    text:"Added";
		}
		#anchor{
	color:blue;
}
#anchor:link {
    text-decoration: none;
}

#anchor:visited {
    text-decoration: none;
    color:blue;
}

#anchor:hover {
    text-decoration: underline;
}

#anchor:active {
    text-decoration: underline;
}
    </style>
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
      <a href="loader1.jsp?type=other productsr">Other Products</a>
    </div>
  </div>
  <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
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
</div>

<div>

<form  action="subcart.jsp" method="GET" id="form1" >
	 <%  
	 	Class.forName("com.mysql.jdbc.Driver");
	    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
	            "root", "nhkmysql");
	    String sqlq = "select * from customer_subscription where cust_email = ?";
	    PreparedStatement prest = con.prepareStatement(sqlq);
	    prest.setString(1,(String)session.getAttribute("email"));
	    ResultSet res = prest.executeQuery();
	    if(res.next())
	    {%>
	    	<div style="height:300px; text-align:center;"> 
	    	<p style="height:120px;"><h3>You already have a active subscription under your account.<br>You can edit your subscription details.</h3></p>
			<a href="subtry1.jsp">View Subscription</a>
	    	</div>
	    <%}
	    else{
	    String tempsql = "select pin from outlet as o,customer as c where c.email = ? and c.pincode = o.pin";
	    PreparedStatement sttemp = con.prepareStatement(tempsql);
	    sttemp.setString(1,(String)session.getAttribute("email"));
	    ResultSet temprs = sttemp.executeQuery();
	    if(!temprs.next())
	    {%>
	    	<div style="height:300px; text-align:center;"> 
	    	<p style="height:120px;"><h3>Sorry. Currently we are not delivering products in your area:(<br>Try out our instant delivery option.</h3></p>
			<a href="proopt22.jsp">Instant Delivery</a>
	    	</div>
	   <%  }
	    else{
	 	StringBuffer url = request.getRequestURL();
		String query = request.getQueryString();
		String sql1 = "SELECT * FROM products";
	 	String sql2 = "SELECT * FROM product_variants";
	 	String sql3 = "SELECT distinct type as type FROM products";
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		Statement st3 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(sql1);
		ResultSet rs2 = st2.executeQuery(sql2);
		ResultSet rs1temp = st3.executeQuery(sql3);
		String previous = "nhk"; //some value for initialization;
		int flag = 0;
		int flag2 = 0;
		boolean flag3 = true;
		rs2.next(); %>
		<div style="width:1150px; border:0px solid black;" class="product_container">
	
		<% while( flag3=rs1.next() ){ 
		if(flag2==0){
		%> <br><ul style="display:inline;list-style-type:none;"><h5 id="<%= rs1.getString("type").toUpperCase()%>"><%=rs1.getString("type").toUpperCase()%></h5>
		<%}if(flag2!=0 && !previous.equals(rs1.getString("type"))){ %>
		</ul><br><ul style="list-style-type:none;"><h5 id="<%= rs1.getString("type").toUpperCase()%>"><%=rs1.getString("type").toUpperCase()%></h5>
		<%}%> 
		
		<div style="border:1px solid grey; margin-top:5px;">
		<ul style="list-style-type:none;">
		<li style="display:inline-block;padding-left:10px;"><img style="width:150px;height:135px;" src=<%= rs1.getString("image_link")%> alt=""/></li>
		<li style="display:inline-block;padding-left:10px;"><p><b><%= rs1.getString("name") %></b></p></li>
					
					<li style="display:inline-block;margin-top:50px;padding-left:10px;"><select  style="width:150px;" name=<%= rs1.getString("pid") %> >
					<%for(int p=0;;p++)
					{
						
						if(rs1.getString("pid").equals(rs2.getString("prodid"))){ 
						%>
						
					<option value=<%= rs2.getString("variants")%>> <%= rs2.getString("variants")%>ml  Rs.<%= rs2.getString("price")%></option>
					<%
					if(!rs2.next())
						flag = 1;}
						else
						{
							break;
						}
					} %>
					
					</select></li>
					<li style="display:inline-block;margin-top:20px;padding-left:10px;"><input style="display:inline-block;margin-top:50px;"style="width:100px;" type="text" name="<%= rs1.getString("pid")  + "no"%>" placeholder="no of units"/></li>
					<li style="display:inline-block;margin-top:20px;padding-left:10px;"><input style="width:100px;" type="text" name="<%= rs1.getString("pid") + "pr"%>"  placeholder="period"/></li>
					<li style="display:inline-block;margin-top:20px;padding-left:10px;">
					<div id="cartBtn" >
   						<label>
     						 <input type="checkbox" name="selected" value=<%= rs1.getString("pid") %> ><span>Add</span>
  						 </label> 
					</div></li>
					</ul>
					</div>
		  </li>
		
		<% previous = rs1.getString("type"); flag2 = 1;} %>
		<%if(flag3){ %></ul><%} %>
		
		</div>
		<div style="top:200px;left:1170px;width:300px;float:right; position:fixed;background-color:#ccffcc;padding:20px;">
		<p>GO TO :</p>
		<%while(rs1temp.next()) {
		String t = rs1temp.getString("type");
		%>
			<a id="anchor" href="<%= "#"+t.toUpperCase()%>"><%= t%><br><br></a>
		<%} %>
		<button style:"width:30px; align:center;" type="submit" form="form1"/>See Added Products</button>
		</div>	
		</form>
	


</div>
<script type="text/javascript">
$('label').click(function () {
    var checked = $('input', this).is(':checked');
    $('span', this).text(checked ? 'Added' : 'Add');
});
</script>

<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>
<%}} %>
</body>
</html>