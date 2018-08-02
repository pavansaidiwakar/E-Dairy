<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" import="java.io.*"%>
<%
    String feedback_text = request.getParameter("feedback");    
    
    
 
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
   
    
    
    String sql1 = "insert into feedback(cust_email,feedback_text) values (?,?)";
    PreparedStatement ps = con.prepareStatement(sql1);
    ps.setString(1,(String)session.getAttribute("email"));
    ps.setString(2,feedback_text);
    
    int i = ps.executeUpdate();
    if (i > 0) {
        //session.setAttribute("userid", user);
        response.sendRedirect("afterlogin1.jsp");
       // out.print("Registration Successfull!"+"<a href='index.jsp'>Go to Login</a>");
    } else {
    	out.println("<p>registration unsuccessful. Retry......</p>");
        response.sendRedirect("feedback.html");
    }
%>