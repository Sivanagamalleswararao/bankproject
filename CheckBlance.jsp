<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<center>
<form action="CheckBlance.jsp">
<input placeholder="Enter Your MobileNumber" name="mobilenumber">
<br>
<input placeholder="Enter Your PIN"name="pin">
<br>
<input type="submit">
</form>
</center>

<%
  String mobilenumber=request.getParameter("mobilenumber");
   String pin=request.getParameter("pin");
   
   String url="jdbc:mysql://localhost:3306/teca41?user=root&password=12345";
   String select="select * from bankdetails where mobilenumber=? and password=?";

try{
	Class.forName("com.mysql.jdbc.Driver");
Connection connection=DriverManager.getConnection(url);
PreparedStatement ps=connection.prepareStatement(select);
ps.setString(1, mobilenumber);
ps.setString(2, pin);
ResultSet rs=ps.executeQuery();
if(mobilenumber!=null){
if(rs.next()){
	out.println("<table><tr><th>id<th><th>name<th><th>amount<th><tr></table>");
	out.println("<tr><td>"+rs.getInt(1)+"</td><td>"+rs.getString(2)+"</td><td>"+rs.getDouble(4)+"</td></tr>");
	
	
}
else{
	out.println("invalid details");
}
}
}
catch(Exception e){
	e.printStackTrace();
	
}


%>


</body>
</html>