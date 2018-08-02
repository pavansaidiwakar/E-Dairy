<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::SIGN-UP</title>


</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>

<div class="navbar" id="myTopnav">
  <a href="afterlogin1.jsp">Home</a>
  <a href="about_us.jsp">About us</a>
  
  
</div>


	
	
 <div class="container" style="width:800px; margin:0;margin-left:330px;margin-top:40px;">
<form action="registration.jsp" id="form2" >
   
    <h3 align="center" style="font-family:Rockwell">Your Personal Details</h3>
    
      <input type="text" id="inputFname" pattern="[a-zA-z]+"  title="Enter only alphabets" name="name" placeholder="First Name*" required><br>
      
      <input type="email" placeholder="Email* " name="email" required><br>
      
        <select name="sex">
        <option value="">--Gender--</option>
  <option value="M">Male</option>
  <option value="F">Female</option>
  
</select><br>
    
      <input type="password" placeholder="Password*" name="pwd" required><br>
    
      <input type="text" pattern="[7-9]{1}[0-9]{9}" placeholder="Mobile Number*" oninvalid="setCustomValidity('Please enter 10 digit mobile number ')" onchange="try{setCustomValidity('')}catch(e){}" name="mobile" maxlength="10" required><br>
    
    <input type="date" name="dob" placeholder="Date Of Birth" required><br>
    
    
      <textarea placeholder="Address" name="address"></textarea><br>
    
        <select name="city">
  <option value="Bengaluru">Bengaluru</option>
  <option value="Bengaluru Rural">Bengaluru Rural</option>
  <option value="Bengaluru North">Bengaluru North</option>
  <option value="Bengaluru East">Bengaluru East</option>
</select><br>
      
    
    
      <input type="text" pattern="[4-5]{1}[0-9]{5}" placeholder="Pin-Code*" title="Enter a six digit PIN" name="pin" required><br>
  
  
  
     
  
  
  
     <button  style="width:100%" type="submit" name="submitAccount"  form="form2" >Register</button>
     <% if(session.getAttribute("error")!= null){
     %><p>User already exists</p>
     <%}%>
  </form>
</div>






















	
</body>
</html>