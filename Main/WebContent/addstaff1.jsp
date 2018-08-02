<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
    String name = request.getParameter("name");    
    String email = request.getParameter("email");
    String pwd = request.getParameter("pwd");
    String mobile = request.getParameter("mobile");
    String dob = request.getParameter("dob");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String pin = request.getParameter("pin");
    String dept = request.getParameter("dept");
    String salary = request.getParameter("salary");
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    
    String sql = "insert into staff (name,pwd,mobile,email,dob,address,dept,salary) values (?,?,?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,name);
    ps.setString(2,pwd);
    ps.setString(3,mobile);
    ps.setString(4,email);
    ps.setString(5,dob);
    ps.setString(6,address);
    ps.setString(7,dept);
    ps.setString(8,salary);
    int i = ps.executeUpdate();
    if (i > 0) {
        //session.setAttribute("userid", user);
        
        response.sendRedirect("admin_afterlogin.jsp?check=as1");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	
        response.sendRedirect("admin_afterlogin.jsp?check=as0");
    }
%>