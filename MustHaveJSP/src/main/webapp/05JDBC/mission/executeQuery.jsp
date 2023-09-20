<%@page import="java.sql.Date"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import = "common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title>JDBC</title></head>
<body>
	<h2> 출력 </h2>	
	<%
    String url = "jdbc:mysql://localhost:3306/musthave";
    String user = "musthave";
    String password = "tiger";
    String tableName = request.getParameter("tableName");
    String columnName = request.getParameter("columnName");
	
	try {
        Class.forName("com.mysql.cj.jdbc.Driver");
    	Connection con = DriverManager.getConnection(url, user, password);

        String sql = "select " + columnName + " from " + tableName;
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        out.println("<table border='1'>");
        out.println("<tr><th>" + columnName + "</th></tr>");
        while (rs.next()) {
            String columnValue = rs.getString(columnName);
            out.println("<tr><td>" + columnValue + "</td></tr>");
        }
        out.println("</table>");
        
        rs.close();
        stmt.close();
        con.close();
    } catch (Exception e) {
        out.println("오류 발생: " + e.getMessage());
    }
	%>
</body>
</html>