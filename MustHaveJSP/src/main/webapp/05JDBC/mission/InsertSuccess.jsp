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
	<h2>데이터 삽입</h2>
	<%

    String dataName = request.getParameter("dataName");
    String tableName = request.getParameter("tableName");
    String insertName = request.getParameter("insertName");
	String valueName = request.getParameter("valueName");
	
	

	
	%>
	
</body>
</html>