<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::edit-profile</title>

<script  src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>

<div class="navbar" >
  <a href="afterlogin1.jsp">Home</a>
  <a href="about_us.jsp">About us</a>
  <a href="feedback1.jsp">Feedback</a>
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
      <a href="loader1.jsp?type=other products">Other Products</a>    </div>
  </div>
  &nbsp;&nbsp;&nbsp;&nbsp;
  <input style="width:400px;" type="text" name="search" placeholder="Search.." id="search">
  <input  type="submit" value="GO" onclick="search()" style="width:60px;" >
  <span style="float:right;">
  		<div class="dropdown">  
    	<button class="dropbtn"> Welcome  <%=session.getAttribute("name")%>  
      <i class="fa fa-caret-down"></i>
    </button>
    <div class="dropdown-content">
    <%session.setAttribute("calledpage",request.getRequestURL() + "?" + request.getQueryString()); %>
      <a href="edit-profile.jsp?flag=1">EDIT</a>
      <a href="logout.jsp">LOGOUT</a>
    </div>
  </div>
  
  </span>
</div>



	</div>
<%
   
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    String sql1 = "select * from customer where email=?";
    PreparedStatement ps = con.prepareStatement(sql1);
    ps.setString(1,(String)session.getAttribute("email"));
    ResultSet rs = ps.executeQuery();
    if (rs.next()) {
%>	
 <div class="container" style="width:800px; margin:0;margin-left:330px;margin-top:40px;">
<form action="edit-profileback.jsp" id="form2" >
<%
 	if(request.getParameter("flag").equals("0"))
 	{
 		%><p>Profile details changed successfully!!</p><%
 		response.sendRedirect((String)session.getAttribute("calledpage"));
 	}
 	else if(request.getParameter("flag").equals("2"))
	{
		%><p>Error in changing profile details</p><%
	}
    } %>    
    <h3 align="center" style="font-family:Rockwell">Edit Your Personal Details</h3>
    
      <input style="width:100%" type="text" id="inputFname" name="name" placeholder="Name*" value="<%= rs.getString("name")%>" required><br>
      
      <input  style="width:100%" type="email" placeholder="Email* " name="email" value="<%= rs.getString("email")%>" title="Email ID cannot be changed" disabled required><br>
    
      <input  style="width:100%" id="password" type="password" placeholder="Password*" name="pwd" value="<%= rs.getString("password")%>"required><br>
      <input  style="width:100%" id="confirm_password" type="password" placeholder="Re-type Password*" required><br>
    	<span id='message'></span>
      <input  style="width:100%" type="text" pattern="[7-9]{1}[0-9]{9}" placeholder="Mobile Number*" name="mobile" maxlength="10" value="<%= rs.getString("main_mobile")%>"required><br>
    
    <input  style="width:100%" type="date" name="dob" placeholder="Date Of Birth" value="<%= rs.getString("dob")%>"required><br>
    
    
      <input type="text"  style="width:100%; height:45px;" placeholder="Address" name="address" value="<%= rs.getString("address")%>" disabled title="Address cannot be changed"><br>
    
        <select style="width:100%" name="city" disabled title="City cannot be changed">
  <option value="Bengaluru">Bengaluru</option>
  <option value="Bengaluru Rural">Bengaluru Rural</option>
  <option value="Bengaluru North">Bengaluru North</option>
  <option value="Bengaluru East">Bengaluru East</option>
</select><br>
      
    
    
      <input  style="width:100%" type="text" pattern="[4-5]{1}[0-9]{5}" placeholder="Pin-Code*" name="pin" value="<%= rs.getString("pincode")%>" required disabled title="Pincode cannot be changed"><br>
  
  
  
     <button  id="submit" style="width:100%" type="submit" form="form2" >Update</button>
     <span id="incorrect"></span>
     
 
  </form>
</div>
<script type="text/javascript">
$('#password, #confirm_password').on('keyup', function () {
  if ($('#password').val() == $('#confirm_password').val()) {
    $('#message').html('Matching').css('color', 'green');
  } else 
    $('#message').html('Not Matching').css('color', 'red');
});

$('#submit').on('click', function () {
	  if ($('#message').text()=='Not Matching') {
	    $('#submit').attr("disabled", "disabled");
	    $('#incorrect').text('Re-type password is not matching with password');
	}
	 });

$('#confirm_password').on('change blur input', function () {
	  if ( $('#submit').attr("disabled")== 'disabled') {
		  $('#incorrect').text('');
		  $('#submit').removeAttr("disabled");
	}
	 
	  });

</script>






















	
</body>
</html>