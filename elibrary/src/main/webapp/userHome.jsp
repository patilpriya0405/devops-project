<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Page</title>
</head>
<body>
	<%
	String uname=session.getAttribute("um").toString();
	String usertype = session.getAttribute("ut").toString();
	
	int ut=Integer.parseInt(usertype);
	
	try
	{ 
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/elibrary","root","root");
		PreparedStatement stmt = con.prepareStatement("select * from usermenu where userRole="+ut);
		
		ResultSet rs =stmt.executeQuery();
		
		while(rs.next())
		{
			out.println("<a href="+rs.getString("url")+">"+rs.getString("MenuItem")+"</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
		}
		
	}catch(Exception e)
	{
		out.println(e.toString());
	}
	%>
</body>
</html>