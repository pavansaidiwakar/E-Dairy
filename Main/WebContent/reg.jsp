<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>reg</title>
	<style type="text/css">
	body{
		background-image:url("milk2.jpg");
	}
	
	<!--#heading {
	position:absolute;
	left:620px;
	top:65px;
	color:blue;
	font-weight:bold;
	}-->
	
	#middleblock {
	position:absolute;
	width:400px;
	height:480px;
	background-color:#ff794d;
	opacity:0.8;
	border:1px solid orange;
	margin-left:500px;
	margin-top:150px;
	<!--margin-bottom:130px;-->
	text-color:white;
	text-align:left;
	padding-top:20px;
	padding-left:30px;
	}
	
	
	#input{
	width:350px;
	height:25px;
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
	}
	#inputtext{
	
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
	}
	#submit{
	width:355px;
	height:30px;
	box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
	
	}
	
	
	#heading{
	color:white;
	}
	
	
	
	</style>
</head>
<body>
<!--<div id="heading">
<h1>Login</h1>
</div>-->
<div id="middleblock">
<p id="heading"><h1><font face="Rockwell" color="black">REGISTER</font></h1></p>


<form action="registration.jsp" method="GET">
<input id="input" type="text" name="name" placeholder="Your Name" required/><br><br>
<input id="input" type="email" name="email"  placeholder="Your email" required/><br><br>
<input id="input" type="number" name="mobile"  placeholder="Your mobile number" max="9999999999" required/><br><br>
<input id="input" type="date" name="dob"  placeholder="Your date of birth" required/><br><br>
<textarea id="inputtext" rows="4" cols="44" name="address" placeholder="Your address" required></textarea><br><br>
<input id="input" type="password" name="pwd"  placeholder="Set password" required/><br><br>
<input id="input" type="submit" id= "submit" name="register" value="Register"/><br><br>
&nbsp;&nbsp;<a href="home.html"><b><font face="Rockwell" color="white">Go to Login page</font></b></a><br><br>

</div>	
</form>
</div>
</body>
</html>