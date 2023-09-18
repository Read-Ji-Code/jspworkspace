<%@page import="java.sql.Date"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
%>
<html>
<head><title>JDBC</title></head>
<body>
	<h2> 회원 목록 조회 테스트 (executeQuery() 사용)</h2>	
	<%
	JDBConnect jdbc = new JDBConnect();
	Connection con = jdbc.getConnection();
	
	
	
	jdbc.close();
	%>
	
</body>
</html>
