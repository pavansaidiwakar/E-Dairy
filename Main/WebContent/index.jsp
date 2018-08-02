<!DOCTYPE html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>HOME PAGE</title>
<style type="text/css">
#anc{
	color:black;
	text-decoration: none;
}
#anc:visited {
    color: black;
    background-color: transparent;
    text-decoration: none;
}
#anc:hover {
    color: white;
    background-color: transparent;
    text-decoration: underline;
}

</style>

</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>	
</header>

<div class="navbar" >
  <a href="index.html">Home</a>
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
      
      <a href="loader1.jsp?type=milk products">Milk Products</a>
      <a href="loader1.jsp?type=other productsr">Other Products</a>    </div>
  </div>
</div>
<div class="slideshow-container">

<div class="mySlides fade">
  <div class="numbertext">1 / 6</div>
  <img src="7.png" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">2 / 6</div>
  <img src="2.png" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">3 / 6</div>
  <img src="3.png" style="width:100%">
  <div class="text">Caption Three</div>
</div>
<div class="mySlides fade">
  <div class="numbertext">4 / 6</div>
  <img src="4.png" style="width:100%">
  <div class="text">Caption Text</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">5 / 6</div>
  <img src="5.png" style="width:100%">
  <div class="text">Caption Two</div>
</div>

<div class="mySlides fade">
  <div class="numbertext">6 / 6</div>
  <img src="6.png" style="width:100%">
  <div class="text">Caption Three</div>
</div>

</div>
<br>

<div style="text-align:center">
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
  <span class="dot"></span> 
</div>

<script>
var slideIndex = 0;
showSlides();

function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
       slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";  
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 6000); // Change image every 2 seconds
}
</script>

	</div>
	<br><br>
    <form action="login.jsp" method="get">
  <div class="container" style="width:420px; margin:0 auto;"  >
  	
  	<span style="text-align:center"><h1>LOGIN</h1><span>
  	<%if(request.getParameter("flag").equals("1")){%>
  		<p style="align:center; color:red;">Invalid credentials!!</p>
  	<%} %>
    <input type="email" placeholder="E-Mail" name="email" required>

    
    <input type="password" placeholder="Password" name="pwd" required>
        
    <button type="submit">Login</button>
    <a href="register1.jsp"><h4>Not yet registered! Sign up now</h4></a>
  </div>

</form>
<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>	
<br><br>
<footer>DAIRY PRODUCT MANAGEMENT SYSTEM
<br>
<a id="anc" href="adminlogin.jsp?flag=0">ADMIN</a>&nbsp;&nbsp;&nbsp;&nbsp;
<a id="anc" href="stafflogin.jsp?flag=0">STAFF</a>


</footer>
</body>
</html>