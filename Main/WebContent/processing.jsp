<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.Arrays" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int quan = Integer.parseInt(request.getParameter("quantity"));    
String prodid = request.getParameter("prodid");
int price = Integer.parseInt(request.getParameter("price"));
int time = Integer.parseInt(request.getParameter("period"));
String sid = request.getParameter("sid");
int[] a = new int[30];
int count;
int[] b = new int[30];
for(int i=0;i<30;i++)
{
	if((i%time)==0)
	{
		a[i] = quan;
	}
	else
	{
		a[i] = 0;
	}
}
String arr = Arrays.toString(a);	

Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
        "root", "nhkmysql");
String sql = "update subscription set quantity = ? , period = ?, status = ? where productid = ? and sid = ?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setInt(1,quan);
ps.setInt(2,time);
ps.setString(3,arr);
ps.setString(4,prodid);
ps.setString(5,sid);
int i = ps.executeUpdate();
if(i>0)
{
	response.sendRedirect("totalcalc.jsp?sid=" + sid);
}
else
{
	out.println("Error in updating");
}

%>
</body>
</html>