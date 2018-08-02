<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" import="java.io.*" import="java.util.Arrays"%>
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
String[] period = request.getParameterValues("period");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
        "root", "nhkmysql");
String email = (String)session.getAttribute("email");
String tempsql = "select sid from subscription order by sid desc;";
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(tempsql);
rs.next();
int sid = Integer.parseInt(rs.getString("sid"))+1;
for(int i=0;i<products.length;i++)
{
	int[] a = new int[30];
	for(int j=0;j<30;j++)
	{
		if((j%Integer.parseInt(period[i]))==0)
		{
			a[j] = Integer.parseInt(quantity[i]);
		}
		else
		{
			a[j] = 0;
		}
	}
	String status = Arrays.toString(a);	

String sql1 = "insert into subscription(sid,productid,variant,quantity,period,status) values (?,?,?,?,?,?)";
PreparedStatement pr1 = con.prepareStatement(sql1);
pr1.setString(1,String.valueOf(sid));
pr1.setString(2,products[i]);
pr1.setString(3,variants[i]);
pr1.setInt(4,Integer.parseInt(quantity[i]));
pr1.setInt(5,Integer.parseInt(period[i]));
pr1.setString(6,status);
int k = pr1.executeUpdate();
}

String tempsql2 = "select d.oid,staff_id from delivery1 as d,outlet as o,customer as c where c.email=? and c.pincode=o.pin and  o.oid=d.oid;";
PreparedStatement pr2 = con.prepareStatement(tempsql2);
pr2.setString(1,(String)session.getAttribute("email"));
ResultSet rs2= pr2.executeQuery();
rs2.next();
String staff_id = rs2.getString("staff_id");
String oid = rs2.getString("oid");
String sql = "insert into customer_subscription values(?,?,?,?)";
PreparedStatement pr = con.prepareStatement(sql);
pr.setString(1,(String)session.getAttribute("email"));
pr.setString(2,String.valueOf(sid));
pr.setString(3,staff_id);
pr.setString(4,oid);
int j = pr.executeUpdate();

	response.sendRedirect("subtry1.jsp");

%>

</body>
</html>