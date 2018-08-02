<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
      
    String id = request.getParameter("staff_id");
    
    

    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    
    Statement ps = con.createStatement();
    String sql="delete  from staff where staff_id='"+id+"'";
    int i = ps.executeUpdate(sql);
	if(i>0)
    	response.sendRedirect("admin_afterlogin.jsp?rs1");
	else
		response.sendRedirect("admin_afterlogin.jsp?rs0");


    
%>