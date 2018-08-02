<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import ="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
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

int quan = Integer.parseInt(request.getParameter("quantity"));    
String prodid = request.getParameter("prodid");
String variant = request.getParameter("variant");
int price = Integer.parseInt(request.getParameter("price"));
int time = Integer.parseInt(request.getParameter("period"));
String sid = request.getParameter("sid");
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
Calendar calendar = Calendar.getInstance();
java.util.Date now = calendar.getTime();
java.sql.Timestamp current_date = new java.sql.Timestamp(now.getTime());
long diff = current_date.getTime() - start_date.getTime();
int j = (int)(diff / (1000*60*60*24));
for(int i=j;i<30 && a[i]>=0 ;i++)
{
	if(a[i]!=0)
	{
		a[i] = quan;
	}
	
}
String arr = Arrays.toString(a);	


String sql2 = "update subscription set quantity = ? , period = ?, status = ? where productid = ? and sid = ?";
PreparedStatement ps2 = con.prepareStatement(sql2);
ps2.setInt(1,quan);
ps2.setInt(2,time);
ps2.setString(3,arr);
ps2.setString(4,prodid);
ps2.setString(5,sid);
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