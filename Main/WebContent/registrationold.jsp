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
    String pincode = request.getParameter("pin");
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    String sql = "select email from customer where email = ?";
    PreparedStatement pr = con.prepareStatement(sql);
    pr.setString(1,email);
    ResultSet rs = pr.executeQuery();
    if(rs.next() && email.equals(rs.getString("email")))
    {
    	session.setAttribute("error",12);
    	response.sendRedirect("register1.html");
    		
    }
    else{
    String sql1 = "insert into customer(name,email,password,main_mobile,dob,address,city,pincode) values (?,?,?,?,?,?,?,?)";
    PreparedStatement ps = con.prepareStatement(sql1);
    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,pwd);
    ps.setString(4,mobile);
    ps.setString(5,dob);
    ps.setString(6,address);
    ps.setString(7,city);
    ps.setString(8,pincode);
    int i = ps.executeUpdate();
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("index.html");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	out.println("<p>registration unsuccessful. Retry......</p>");
        response.sendRedirect("register.jsp");
    }}
%>