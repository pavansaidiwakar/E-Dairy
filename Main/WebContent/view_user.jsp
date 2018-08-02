<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
    <%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="javax.servlet.http.HttpUtils.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#customers {
    font-family: Rockwell;
    border-collapse: collapse;
    width: 100%;
}

#customers td, #customers th {
    border: 1px solid #ddd;
    padding: 8px;
}



#customers th {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: left;
    background-color: #9912a0;
    color: white;
}
</style>
<link href="home.css" rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<style>
.nav{
float:right;
}
</style>	
</head>
<body>

 

	<% 
	

	
	Connection con= null;
	PreparedStatement ps = null;
	PreparedStatement cs = null;
	ResultSet rs = null;
	ResultSet temp = null;
	try{

	String driverName = "com.mysql.jdbc.Driver";
	String url = "jdbc:mysql://localhost:8081/diary";
	String user = "root";
	String dbpsw = "nhkmysql";
	Class.forName(driverName);
	con = DriverManager.getConnection(url, user, dbpsw);
	String sql = "SELECT * FROM customer";
	ps = con.prepareStatement(sql);
	rs = ps.executeQuery();%>
	<table id="customers">
	<a href="admin_afterlogin.jsp?check=0"> <h3 style="font-family: Rockwell;text-align:left;">Go Back </h3></a>
	<h1 style="font-family: Rockwell;text-align:center;"> LIST OF USERS</h1>
  <tr>
    <th>Name</th>
    <th>Mobile</th>
    <th>Email_ID</th>
   
    
    <th>DOB</th>
    <th>Sex </th>
    <th>Address </th>
    <th>City</th>
    <th>Pin-Code</th>
  </tr>
	<% 
	while(rs.next())
	{
	%><tr>
    <td><%=rs.getString("name") %></td>
    <td><%=rs.getString("main_mobile") %></td>
    <td><%=rs.getString("email") %></td>
    <td><%=rs.getString("dob") %></td>
    <td><%=rs.getString("sex") %></td>
    <td><%=rs.getString("address") %></td>
    <td><%=rs.getString("city") %></td>
    <td><%=rs.getString("pincode") %></td>
   
  </tr>
		
		
	<% 
	}%></table><% 
	
	
}catch(Exception e)
{
	out.println(e);
}finally{
	if( ps != null)
		ps.close();
	if(rs != null)
		rs.close();
	if( con != null )
		con.close(); 
}
	%>
</body>
</html>