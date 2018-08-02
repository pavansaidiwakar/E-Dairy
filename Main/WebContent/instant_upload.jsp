<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" import="java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
String[] products = request.getParameterValues("products"); 
String[] variants = request.getParameterValues("variants"); 
String[] quantity = request.getParameterValues("quantity"); 
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
        "root", "nhkmysql");
String email = (String)session.getAttribute("email");
String tempsql = "select inst_id from transactions_details order by inst_id desc";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(tempsql);
rs.next();
int inst_id = Integer.parseInt(rs.getString("inst_id"))+1;


String sql1 = "insert into transactions(cust_email,type,id,amount) values (?,?,?,?)";
PreparedStatement pr1 = con.prepareStatement(sql1);
pr1.setString(1,email);
pr1.setString(2,"instant order");
pr1.setString(3,String.valueOf(inst_id));
pr1.setInt(4,Integer.parseInt(request.getParameter("sumtotal")));
int k = pr1.executeUpdate();


String sql = "insert into transactions_details values(?,?,?,?)";
int itemsno = Integer.parseInt(request.getParameter("itemsNo"));
PreparedStatement pr = con.prepareStatement(sql);
for(int i=0;i<itemsno;i++)
{
pr.setString(1,String.valueOf(inst_id));
pr.setString(2,products[i]);
pr.setString(3,variants[i]);
pr.setString(4,quantity[i]);
int j = pr.executeUpdate();
}

	response.sendRedirect("bill.jsp");

%>

</body>
</html>