<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%
    String admin_id = request.getParameter("admin_id");    
    String pwd = request.getParameter("pwd");
    String name;
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
            "root", "nhkmysql");
    String sql = "select * from admin where admin_id=? and pwd=?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1,admin_id);
    ps.setString(2,pwd);
    ResultSet rs;
    rs = ps.executeQuery();
    if (rs.next()) {
    	name = rs.getString(2);
        session.setAttribute("name",name);
       
        
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        response.sendRedirect("admin_afterlogin.jsp?check=0");
    } else {
    	response.sendRedirect("adminlogin.jsp?flag=1");
    }
%>