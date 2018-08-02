<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%!String[] cartitems;
   String[] variants = new String[20];%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::WELCOME,,,HOME PAGE</title>
 <script  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>

</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>
<%  StringBuffer url = request.getRequestURL();
	String query = request.getQueryString();
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
%>
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
      <a href="edit-profile.jsp?flag=1">EDIT</a>
      <a href="logout.jsp">LOGOUT</a>
    </div>
  </div>
  
  </span>
</div>

<div>
	 <%  if( session.getAttribute("name").equals(null))
		{response.sendRedirect("index.jsp?flag=0");}
	else{%>
	<%  if(request.getParameterValues("selected")==null)
	{%><h3>CART(0 items selected)</h3>
	<div style="height:300px; text-align:center;"> 
	<p style="height:120px;"><h3>No items were added to cart</h3></p>
	</div>
	<% }
	else{
		
	cartitems = request.getParameterValues("selected");
	for(int x=0;x<cartitems.length;x++)
	{
		System.out.println(request.getParameter(cartitems[x]));
		variants[x] = (String)request.getParameter(cartitems[x]);
	}
	%>
	<h3>CART(<%= cartitems.length %> items selected)</h3>
	<br><br>
	<form id="form2" action="checkoutnew.jsp" method="get">
	<table align="center" cellpadding="10"  border="0" style="background-color:transparent;">
		<tr>
			<th width="50"><b>Sl No</b></th>
			<td width="200"><b>Item</b></td>
			<th width="100"><b>Variant</b></th>
			<th width="100"><b>Unit Price</b></th>
			<th width="80"><b>Quantity</b></th>
			<th width="80" align="right"><b>Sub Total</b></th>
			<th width="50"></th>
		</tr>
	
	<%
	String sql = "SELECT pid,name,type,variants,price  FROM  products as p,product_variants as pv WHERE p.pid = ? AND pv.variants = ?";
	PreparedStatement ps = con.prepareStatement(sql);
	int length = cartitems.length;
	for(int i=0;i<cartitems.length;i++)
	{
		ps.setString(1,cartitems[i]);
		//ps.setInt(2,Integer.parseInt(variants[i]));
		ps.setString(2,variants[i]);
		//out.println(request.getParameter(cartitems[i]));
		ResultSet rs = ps.executeQuery();
		rs.next();
		
	
		
	%>
	   <tr>
			<td align="center"><%= i+1%></td>
			<td><%= rs.getString("name") %></td>
			<td align="center"><%= rs.getString("variants") %>ml</td>
			<td align="center"><%= rs.getString("price") %></td>
			<td align="center"><input  type="number"   name="quantity" style="width:50px; border:0px; " value="1" min="1"/></td>
			<td align="center"><%= rs.getString("price") %></td>
			<%if(i==0 && i==(cartitems.length-1)){ %>
				<td align="right"><a href=<%= url+"?"+query.replace("selected="+rs.getString("pid"),"") %>>X</a></td>
			<%}else if(i==0){%>
				<td align="right"><a href=<%= url+"?"+query.replace("selected="+rs.getString("pid")+"&","") %>>X</a></td>
			<%}else{ %>
				<td align="right"><a href=<%= url+"?"+query.replace("&selected="+rs.getString("pid"),"") %>>X</a></td>
			<%} %>
		</tr>
		<% session.setAttribute(rs.getString("pid"),rs.getString("variants"));%>
	<% }%>
	
	
	</table>
	
	  </div>
	   
	  <div  style="margin-left:300px;height:200px; width:920px;">
	 <a href=<%= url %>><button type="button" style="width:100px;margin-top:100px;margin-left:120px;">Empty cart</button></a>
	  
	  
	 
	 <div  style="height:150px; width:300px; float:right; position:relative; top:15px; right:120px;" >
	 <p><h4><b>Subtotal   Rs.&nbsp;&nbsp;<span class="sum"></span> </b></h4></p>
	 <p><h5>Delivery charge Rs. 30</h5></p>
	 <p><h2><b>Total Rs.&nbsp;&nbsp;<span class="sumtotal"></span></b></h2></p>
	 <% session.setAttribute("itemsNo",length);%>
	  <!--  session.setAttribute("totalprice",);
	 -->
	 <% for(int x=0;x<cartitems.length;x++){ %>
	 <input type="hidden" name="products" value="<%= cartitems[x]%>"/>
	  <input type="hidden" name="variants" value="<%= variants[x]%>"/>
	  <%} %>
	 <input type="hidden" name="itemsNo" value="<%= cartitems.length%>"/>
	 <input type="hidden" id="totalsum" name="sumtotal"/>
	<button type="submit" style="float:right;" form="form2">Checkout</button></a>
	</form> 
	 </div>
	  </div> 
	  <%} %> 
	</div>	
	
	
	

</div>



</div><!-- /container -->
<%} %>
<script type="text/javascript">
	var totalsum = 0;
$("table input").on('change blur input', function () {
    var val = this.value;
    var sum = 0;
    $(this).closest('tr').find('td:eq(5)').text(function () {
        return (+$.trim($(this).siblings(':eq(3)').text()) * +val)
    });
    $('table  tr td:nth-of-type(6)').each(function () {
        sum += parseFloat($(this).text()) || 0;
    });
    $('.sum').text(sum);
    $('.sumtotal').text(sum+30);
    totalsum = sum+30;
    $("#totalsum").val(totalsum);
});
function call(a){ 
	window.location.replace("checkoutnew.jsp?sumtotal="+ totalsum + "&itemsNo=" + a );
	}

</script>


<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>
</body>
</html>