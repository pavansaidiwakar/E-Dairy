<!DOCTYPE html>
<head>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link href="styles.css" rel="stylesheet">
<title>eDairy::HOME PAGE</title>


</head>
	<body  onscroll="myFunction()">
<header>
   <h1>DAIRY PRODUCT MANAGEMENT SYSTEM</h1>
</header>


  
  
  
  <div class="navbar" >
  <% if(session.getAttribute("email")!=null){
	%>
  <a href="afterlogin1.jsp">Home</a>
  <%}else{%> 
  <a href="index.html">Home</a>
  <%} %>
  
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

<p>
<h2>Overview</h2>
Dairy products are those food products which are derived from or containing milk or its derivatives. A dairy is a business enterprise that involves production, processing and marketing of dairy products like milk, butter, cheese, ghee, sweets, ice-creams etc. Dairy product management system is an application to maintain day to day transactions in dairy. It is used to register all the details of  staff and customers. It enables staff to maintain the records such as number of milk units sold, availability of products, transactions made on a particular day and customer details accurately. Customer can order the products online and get products delivered to the doorstep. It  gives an overview of the different products available at the dairy to the customer. It provides different subscription plans for customers to opt in and just pay monthly bill. It saves the valuable time of the customer as the products are delivered to home daily. If the customer needs any extra products he can order them through instant order.












<h2> Functionality</h2>
Functional requirements are those requirements that are used to illustrate the internal working nature of a system, the description of a system the explanation of each subsystem. The functional requirements identified in each module are:
<br>
<h3>1.	ADMIN</h3>
	Manage staff: The system should allow manager to add a new staff or modify the existing details.
<br>	Manage products: Based on the trend, various new products could be added to the products list and their details accordingly. The specifications of existing products could be changed.
<br>	Manage outlets: As and when new outlets are established, admin could add their details to the database or modify existing ones.
<br>	Report generation: Report should be generated based on the sales of products on daily basis or specified duration of time.
<br>
<br>
<h3>2.	STAFF</h3>
<br>Manage milk vendors: The system should allow the staff to register new milk vendors or modify the details of existing milk vendor's details.
<br>Manage delivery staff: The system should allow the staff to register new delivery staff or modify the details of existing delivery staff's details.
<br>Manage inventory: Maintains the information about the available stock.
<br>Approve subscriptions and bulk orders: Verifies the details given by customers and approves subscriptions and bulk orders.
<br>View feedbacks: Feedback given by the customers can be viewed by the admin and can be marked as checked representing the necessary actions have been taken care of.
<br>
<br>
<h3>3.	CUSTOMER</h3>
<br>Product info: All the product/item details can be viewed by customers.
<br>Regular orders: Customers can get subscribed to monthly plans. Required products are added to his subscription and it can be customised.
<br>Bulk Orders: A bulk order can be placed for the products prior to some limited time in order to get delivered. 
<br><br>




</p>
<br><br><br>
	<div align="center" style="font-family:Castellar;">
<h2>DONE BY</h2><h2>
<b>PAVAN SAI DIWAKAR</b> &
<b>NITHIN H K</b><br><br>
</h2>
@rvce,2017
<br>
<script type="text/javascript">
	function search(){ 
	window.location.replace("search.jsp?name=" + document.getElementById("search").value);
	}
</script>

</div>	
<br>
<br><br><br>



















	<script>
var navbar = document.getElementById("myTopnav");
var sticky = navbar.offsetTop;

function myFunction() {
  if (window.pageYOffset >= sticky) {
    navbar.classList.add("sticky")
  } else {
    navbar.classList.remove("sticky");
  }
}
</script>

<footer>DAIRY PRODUCT MANAGEMENT SYSTEM</footer>
</body>
</html>