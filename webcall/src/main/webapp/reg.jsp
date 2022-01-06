<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register Here</title>
</head>
<%@page import="java.sql.*" %>
<body>
<%
String name=request.getParameter("t");
String un=request.getParameter("t1");
String pswd=request.getParameter("t2");
String mobile=request.getParameter("t3");

System.out.println(un+" "+pswd);
try
{
	  Class.forName("com.mysql.cj.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/webtest","root","kalees0504");
	  Statement stmt=con.createStatement();
	  String sql="INSERT INTO `webtest`.`userdetails` (`name`, `username`, `password`, `mobile`) VALUES ('"+name+"', '"+un+"', '"+pswd+"', '"+mobile+"')";
	  int i=0;
	  i=stmt.executeUpdate(sql);
	  if(i==0)
	  {
		  response.sendRedirect("index.html");
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