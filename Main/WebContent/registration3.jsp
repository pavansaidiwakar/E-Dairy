<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
    String purpose = request.getParameter("purpose");    
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    String sql1 = "insert into bulk_orders(purpose,address,city,pincode,cp_name,cp_email,cp_mobile) values (?,?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql1);
    ps.setString(1,purpose);
    ps.setString(2,address);
    ps.setString(3,city);
    ps.setString(4,pincode);
    ps.setString(5,name);
    ps.setString(6,email);
    ps.setString(7,mobile);
   
    int i = ps.executeUpdate();
    if (i > 0) {
        response.sendRedirect("bulkorder.jsp?submit=1");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	
    	response.sendRedirect("bulkorder.jsp?submit=2");
    }
%>