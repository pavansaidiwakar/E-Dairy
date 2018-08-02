<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*" %>
<%@ page import="java.util.Arrays" %>
<%@ page import ="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
int count = 0;

String sid = request.getParameter("sid");
Class.forName("com.mysql.jdbc.Driver");
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:8081/diary",
        "root", "nhkmysql");
String sql = "select count(*) from subscription where sid =?";
PreparedStatement st = con.prepareStatement(sql);
st.setString(1,sid);
ResultSet rs = st.executeQuery();
if(rs.next())
	count = rs.getInt("count(*)");
System.out.println(count);

String sql2 = "select price,status from product_variants pv, subscription s where s.productid = pv.prodid and s.variant=pv.variants and s.sid = ?";
PreparedStatement st2 = con.prepareStatement(sql2);
st2.setString(1,sid);
ResultSet rs2 = st2.executeQuery();
int b[] = new int[30];
String[] items;
int sum[] = new int[20];
int total = 0;
rs2.next();




for(int x=0;x<count;x++)
{
	items = rs2.getString("status").replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");
	for (int i = 0; i < items.length; i++) {
	    try {
	        b[i] = Integer.parseInt(items[i]);
	    } catch (NumberFormatException nfe) {
	        //NOTE: write something here if you need to recover from formatting errors
	    };
	}
	for(int y=0;y<30;y++){
		if(b[y]!=0)
		sum[x]+= rs2.getInt("price") * b[y];
	}
	if(!rs2.next())
		break;
}
for(int s=0;s< sum.length;s++)
	total = total+sum[s];
session.setAttribute("total",total);


String sql3 = "select added_date from subscription where sid= ?";
PreparedStatement st3 = con.prepareStatement(sql3);
st3.setString(1,sid);
ResultSet rs3 = st3.executeQuery();
rs3.next();
java.sql.Timestamp start_date = rs3.getTimestamp("added_date");
Calendar calendar = Calendar.getInstance();
java.util.Date now = calendar.getTime();
java.sql.Timestamp current_date = new java.sql.Timestamp(now.getTime());
long diff = current_date.getTime() - start_date.getTime();
int j = 30 - (int)(diff / (1000*60*60*24));
session.setAttribute("remdays",j);
response.sendRedirect("subtry1.jsp");
%>
</body>
</html>