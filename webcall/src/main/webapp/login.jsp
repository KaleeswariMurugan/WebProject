<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<%@page import="java.sql.*" %>
<body>
<%
String un=request.getParameter("t1");
String pswd=request.getParameter("t2");
try
{
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webtest","root","kalees0504");
	Statement stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("SELECT * FROM webtest.userdetails");
	String l="";
	while(rs.next())
	{
		if(un.equals(rs.getString(1)))
		{
			l="yes";
			break;
		}
	}
	if(l.equals("yes"))
	{
		response.sendRedirect("welcome.html");
	}
	else
	{
		response.sendRedirect("login.html");
	}
}
catch(Exception e)
{
	System.out.println(e);
}
%>
</body>
</html>