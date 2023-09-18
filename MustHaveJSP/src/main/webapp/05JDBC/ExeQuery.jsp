<%@page import="java.sql.Date"%>
<%@ page import = "java.sql.ResultSet" %>
<%@ page import = "java.sql.Connection" %>
<%@ page import = "java.sql.Statement" %>
<%@ page import = "common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head><title>JDBC</title></head>
<body>
	<h2> 회원 목록 조회 테스트 (executeQuery() 사용)</h2>	
	<%
	JDBConnect jdbc = new JDBConnect();
	Connection con = jdbc.getConnection();
	{
	
		String sql = "select id, pass, name, regidate from member";
		Statement stmt = con.createStatement();
		
		ResultSet rs = stmt.executeQuery(sql);
		while (rs.next()) {
			String id = rs.getString(1);
			String pw = rs.getString(2);
			String name = rs.getString("name");
			Date regidate = rs.getDate("regidate");
			
			
			out.println("<td>");
			out.println(String.format("%s %s %s %s", id, pw, name, regidate) + "<br/>");
			out.println("<td>");
			out.println("<tr>"); 
			
		}
		rs.close();
		stmt.close();
		out.println("</table>");
	}
	
	{
		String sql = "select title, content, id, postdate from board";
		Statement stmt = con.createStatement();
		ResultSet rs = stmt.executeQuery(sql);
	
		while (rs.next()) {
			String title = rs.getString(1);
			String content = rs.getString(2);
			String id = rs.getString(3);
			Date postdate = rs.getDate(4);
			out.println(String.format("%s %s %s %s", title, content, id, postdate) + "<br/>");
			
		}
		rs.close();
		stmt.close();
	}
	
	jdbc.close();
	%>


</body>
</html>