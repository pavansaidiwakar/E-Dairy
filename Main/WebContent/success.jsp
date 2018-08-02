<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
    if ((session.getAttribute("email") == null) || (session.getAttribute("email") == "")) {
%>
You are not logged in<br/>
<a href="home.html">Please Login</a>
<%} else {
%>
Welcome <%=session.getAttribute("email")%><br>
<img src="2.jpg" alt="underprocess">
<a href='logout.jsp'>Log out</a>
<%
    }
%>