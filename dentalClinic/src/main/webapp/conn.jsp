









<%@page import="java.sql.*" %>
<%@page import="java.sql.DriverManager"%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dental Clinic</title>

</head>
<body>	



<%
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3406/dental","root","");
%>


</body>
</html>