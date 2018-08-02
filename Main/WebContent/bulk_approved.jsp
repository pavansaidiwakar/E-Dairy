<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
        "root", "nhkmysql");
String[] id = request.getParameterValues("id");
String sql = "update bulk_orders set approved=1 where bulk_id = ?";
PreparedStatement pr = con.prepareStatement(sql);
for(int i=0;i<id.length;i++)
{
pr.setString(1,id[i]);
int j = pr.executeUpdate();
}
response.sendRedirect("view_bulk.jsp?update=1");
%>
</body>
</html>