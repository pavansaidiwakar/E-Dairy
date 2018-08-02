<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
      
    String pid = request.getParameter("pid");
    
    

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    
    Statement ps = con.createStatement();
    String sql="delete  from products where pid='"+pid+"'";
    int i = ps.executeUpdate(sql);
	if(i>0)
    	response.sendRedirect("admin_afterlogin.jsp?check=rp1");
	else
		response.sendRedirect("admin_afterlogin.jsp?check=rp0");


    
%>