<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
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


String val=request.getParameter("value");
SimpleDateFormat in = new SimpleDateFormat("yyyy-MM-dd");
String parameter = request.getParameter("date");
java.util.Date del_datetemp = in.parse(parameter);
java.sql.Date del_date = new java.sql.Date(del_datetemp.getTime());


String[] value = val.split(",");
String sid = value[0];
String prodid = value[1];
String variant = value[2];
String sql1 = "select added_date,status from subscription where productid=? and sid=? and variant=?";
PreparedStatement ps1 = con.prepareStatement(sql1);
ps1.setString(1,prodid);
ps1.setString(2,sid);
ps1.setString(3,variant);
ResultSet rs = ps1.executeQuery();
rs.next();
String[] atemp = rs.getString("status").replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "").split(",");
int a[] = new int[30];
for (int i = 0; i < atemp.length; i++) {
    try {
        a[i] = Integer.parseInt(atemp[i]);
    } catch (NumberFormatException nfe) {
        //NOTE: write something here if you need to recover from formatting errors
    };
}
java.sql.Timestamp start_date = rs.getTimestamp("added_date");
java.sql.Date date = java.sql.Date.valueOf(start_date.toLocalDateTime().toLocalDate());
System.out.println("h="+date);

long diff = del_date.getTime() - date.getTime();
int j = (int)(diff / (1000*60*60*24));
System.out.println("j="+j);
if(a[j]!=0)
{
	a[j]=0;
}
String arr = Arrays.toString(a);	


String sql2 = "update subscription set status = ? where productid = ? and sid = ? and variant = ?";
PreparedStatement ps2 = con.prepareStatement(sql2);
ps2.setString(1,arr);
ps2.setString(2,prodid);
ps2.setString(3,sid);
ps2.setString(4,variant);
int i = ps2.executeUpdate();
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