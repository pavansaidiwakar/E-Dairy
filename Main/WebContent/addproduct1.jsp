<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
    String pid = request.getParameter("pid");    
    String name = request.getParameter("name");
    String type = request.getParameter("type");
    String shelf_life = request.getParameter("shelf_life");
    String variant = request.getParameter("variant");    
    String price= request.getParameter("price");
    String variant1 = request.getParameter("variant1");    
    String price1= request.getParameter("price1");
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    
    String sql = "insert into products (pid,name,type,shelf_life) values (?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,pid);
    ps.setString(2,name);
    ps.setString(3,type);
    ps.setString(4,shelf_life);
   int i = ps.executeUpdate();
    String sql1 = "insert into product_variants (prodid,variants,price) values (?,?,?)";
    PreparedStatement ps1 = con.prepareStatement(sql1);
    ps1.setString(1,pid);
    ps1.setString(2,variant);
    ps1.setString(3,price);
    int i1 = ps1.executeUpdate();
    String sql2 = "insert into product_variants (prodid,variants,price) values (?,?,?)";
    PreparedStatement ps2 = con.prepareStatement(sql1);
    ps2.setString(1,pid);
    ps2.setString(2,variant1);
    ps2.setString(3,price1);
    int i2 = ps2.executeUpdate();
    if (i > 0 && i1>0 && i2>0) {
        //session.setAttribute("userid", user);
        
        response.sendRedirect("admin_afterlogin.jsp?check=ap1");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	
        response.sendRedirect("admin_afterlogin.jsp?check=ap0");
    }
%>