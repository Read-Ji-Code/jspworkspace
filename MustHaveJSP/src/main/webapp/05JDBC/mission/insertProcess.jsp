<%@page import="java.sql.Date"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>검증</h2>
	<%
	String user_id = request.getParameter("user");
	String user_pw = request.getParameter("password");

	
	%>
	
</body>
</html>