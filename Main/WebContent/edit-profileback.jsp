<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
    String name = request.getParameter("name");    
    String email = (String)session.getAttribute("email");
    String pwd = request.getParameter("pwd");
    String mobile = request.getParameter("mobile");
    String dob = request.getParameter("dob");
    
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    String sql = "select email from customer where email = ?";
    PreparedStatement pr = con.prepareStatement(sql);
    pr.setString(1,email);
    ResultSet rs = pr.executeQuery();
    if(rs.next())
    {
    String sql1 = "update customer set name = ?,password = ?,main_mobile = ?,dob = ? where email = ?";
    PreparedStatement ps = con.prepareStatement(sql1);
    ps.setString(1,name);
    ps.setString(2,pwd);
    ps.setString(3,mobile);
    ps.setString(4,dob);
    ps.setString(5,email);
    int i = ps.executeUpdate();
    if (i > 0) {
        
        response.sendRedirect("afterlogin1.jsp");
       
    } else {
    	
        response.sendRedirect("edit-profile1.jsp?flag=2");
    }}
%>