<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String email = request.getParameter("email");    
    String pwd = request.getParameter("pwd");
    String name;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
    String sql = "select * from customer where email=? and password=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,email);
    ps.setString(2,pwd);
    ResultSet rs;
    rs = ps.executeQuery();
    if (rs.next()) {
    	name = rs.getString(1);
        session.setAttribute("email",email);
        session.setAttribute("name",name);
       
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("afterlogin1.jsp");
    } else {
    	response.sendRedirect("index.jsp?flag=1");
    }
%>