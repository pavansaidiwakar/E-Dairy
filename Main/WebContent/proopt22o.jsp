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
		    background-color:white;
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
    </style>

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
<%  StringBuffer url = request.getRequestURL();
	String query = request.getQueryString();
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
%>

<div>

<form  target="_blank"  action="carttemp.jsp" method="GET" id="form1" >
	 <%
		String sql1 = "SELECT * FROM products";
	 	String sql2 = "SELECT * FROM product_variants";
		Statement st1 = con.createStatement();
		Statement st2 = con.createStatement();
		ResultSet rs1 = st1.executeQuery(sql1);
		ResultSet rs2 = st2.executeQuery(sql2);
		String previous = "nhk"; //some value for initialization;
		int flag = 0;
		int flag2 = 0;
		boolean flag3 = true;
		rs2.next(); %>
		<div style="width:1210px; border:0px;" class="product_container">
		
		<% while( flag3=rs1.next() ){ 
		if(flag2==0){
		%> <h5><%=rs1.getString("type")%></h5><ul style="display:inline;list-style-type:none;">
		<%}if(flag2!=0 && !previous.equals(rs1.getString("type"))){ %>
		</ul><ul style="display:inline;list-style-type:none;"><h5><%=rs1.getString("type")%></h5>
		<%}%> 
		<li>
		<div class="card1" style="width:280px;height:350px;float:left;border:2px solid grey; box-shadow: 5px 5px 2.5px #888888;margin-left:15px;margin-top:15px;text-align:center;"> 
		  <img style="width:280px;height:200px;" src=<%= rs1.getString("image_link")%> alt=""/>
				<div style="background-color:#d4ddd5;height:135px;width:275px;margin-left:-5px;margin-top:7px;">
					<br>
					<p><b><%= rs1.getString("name") %></b></p>
					
					<select  style="width:100px;" name=<%= rs1.getString("pid") %> >
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
		  	</div>
		  
		 <!--   <input type="submit" class="button" value="Book">-->
		</div>
		
		</li>
		<% previous = rs1.getString("type"); flag2 = 1;} %>
		<%if(flag3){ %></ul><%} %>
		<input style:"width:50px; align:center;"  type="submit" value="View Cart" form="form1"/>
		</div>	
		
		
		
		</form>



</div>


<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>









	


</body>
</html>