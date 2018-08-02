<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%!String[] cartitems;
   String[] variants = new String[20];%>
<!DOCTYPE html><head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>
 <script  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<style type="text/css">
.totalamnt
{
	display:none;
}
</style></head>
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
      <a href="loader1.jsp?type=other productsr">Other Products</a>
    </div></div>
 <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
  <span style="float:right;">
  <div class="dropdown">  
    <button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <a href="edit-profile.jsp?flag=1">EDIT</a>
      <a href="logout.jsp">LOGOUT</a>
    </div>
  </div>
  </span>
</div>
<div>
	<%
	if( session.getAttribute("name").equals(null))
	{response.sendRedirect("index.jsp?flag=0");}
	else{
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
	{%>
	<div style="height:300px; text-align:center;"> 
	<p style="height:120px;"><h3>You don't seem to have any subscription:(</h3></p>
	<form action="add_products.jsp" >
	<button type="submit"  style="width:150px;" >New Subscription</button>
	</form>
	</div>
	
	<%}else{
	String sidval = rs.getString("sid");%>
	<h3>View Your Subscription</h3>	
	<hr/>
	<h4>Current Subscription</h4>
	<table align="center" cellpadding="10"  border="0" style="background-color:transparent;">
		<tr>
			<th width="100"><b>Sl No</b></th>
			<td width="200"><b>Item</b></td>
			<th width="150"><b>Unit Price(Rs)</b></th>
			<th width="150"><b>No of units</b></th>
			<th width="150"><b>Period(days)</b></th>
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
			<td align="center"><input style="width:70px;" name="quantity" type="text" value=<%= rs.getInt("quantity")%> required><input type="hidden" name="variant" value=<%= rs.getString("variant")%>></td>
			<td align="center"><%= rs.getInt("period")%><input type="hidden" name="sid" value=<%= rs.getString("sid")%>><input type="hidden" name="prodid" value=<%= rs.getString("prodid")%>><input type="hidden" name="price" value=<%= rs.getString("price")%>><input type="hidden" name="period" value=<%= rs.getInt("period")%>></td>
			<td><button style="width:100px;" type="submit" id="disp" value="Update"/>Update</button></td>
			</form>	
		</tr>
		
	<% if(!rs.next()){break;}
		}%>
		
		</table>
	

<br><br><br><br>
<div>
<b>Not in home? Don't worry. Select the date, we'll not deliver on that day:</b><br><br>
<form action="processing3.jsp" method="get">
<input type="hidden" value="<%=sidval %>" name="sid"/>
<input style="width:200px;" type="date" name="date" required/><br>
<button type="submit" style="width:150px;" value="Stop">Stop all</button>
</form>
</div>
<br><br><br>
<div>
<b>No need of a product? Don't worry. Select the date and product, we'll not deliver that product on that day:</b><br><br>
<% String sql1 = "select sid,prodid,name,variant,price,quantity,period,added_date from product_variants pv,products p,customer_subscription cs,subscription s where cs.cust_email =? and cs.sub_id = s.sid and p.pid=s.productid and s.productid=pv.prodid and s.variant=pv.variants";
	PreparedStatement pr1 = con.prepareStatement(sql1);
	pr1.setString(1,email);
	ResultSet rs1 = pr1.executeQuery();
	rs1.next();
	%>
<form action="processing2.jsp" method="get">
<select style="width:200px;" name="value" required>
<option value="">--select product--</option>
<% 

		for(int i=0;;i++)
		{%>
		
	   <option value="<%= rs1.getString("sid")%>,<%= rs1.getString("prodid")%>,<%= rs1.getString("variant")%>" ><%= rs1.getString("name")+"("+ rs1.getString("variant")+"ml)" %></option>
		
	<% if(!rs1.next()){break;}
		}%>
</select><br>
<input style="width:200px;" type="date" name="date" required/><br>
<button type="submit"  style="width:150px;" value="Stop">Stop a product</button>
</form>
</div>
<br><br><br>
<div>
<% String sql2 = "select address,city,pincode from customer where email=?";
	String sql4 = "select delivery,outlet from customer_subscription where cust_email=?";
	PreparedStatement pr2 = con.prepareStatement(sql2);
	PreparedStatement pr4 = con.prepareStatement(sql4);
	pr2.setString(1,email);
	pr4.setString(1,email);
	ResultSet rs2 = pr2.executeQuery();
	ResultSet rs4 = pr4.executeQuery();
	rs2.next();
	rs4.next();
	%>
 <b>Your current delivery address:</b><br><br>
 <p><%=rs2.getString("address") %><br><%=rs2.getString("city") %><br><%=rs2.getString("pincode") %>
 <br>outlet id: <b><%=rs4.getString("outlet") %></b><br>Delivery Staff id: <b><%=rs4.getString("delivery") %></b></p>
 
</div>
<br>
<div class="calculatebtn">
<b>Amount to be paid at the end of your subscription:</b> &nbsp;&nbsp;
<button id="calbtn" type="button" style="width:100px;" value="calculate">Calculate</button>
</div>
<div class="totalamnt">
<b>Amount to be paid at the end of your subscription:</b> &nbsp;&nbsp;
<i>Rs. <%=session.getAttribute("total") %></i>
<form action="pay.jsp" method="post">
<input type="hidden" name="sid" value="<%= sidval %>" />
<input type="hidden" name="totalpay" value="<%=session.getAttribute("total") %>"/>&nbsp;&nbsp;&nbsp;
<p>Remaining days: <%= session.getAttribute("remdays")%>
</form>
</div>
</b><br><br>



	
<a href="#" class="gotop"><i class="icon-double-angle-up"></i></a>
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="assets/js/jquery.js"></script>
	<script src="assets/js/bootstrap.min.js"></script>
	<script src="assets/js/jquery.easing-1.3.min.js"></script>
    <script src="assets/js/jquery.scrollTo-1.4.3.1-min.js"></script>
    <script src="assets/js/shop.js"></script>
   <%}%>
	
</div>	
	
	
	

</div>



</div><!-- /container -->

<%} %>

<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
	$("#calbtn").on("click",function(){

	    $(".calculatebtn").css("display","none")
	    $(".totalamnt").css("display","block")

	});
</script>
</body>
</html>