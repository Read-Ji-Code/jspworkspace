<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@page import = "common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>JDBC</title></head>
<body>
	<h2>게시판 추가 테스트 </h2>
	<%
	JDBConnect jdbc = new JDBConnect(application);
	Connection con = jdbc.getConnection();
	int cnt = 0;
	
	String [] ids = {"musthave", "willhave", "dohave"};
	
	String sql = "insert into board (title, content, id) values (?, ?, ?)";
	PreparedStatement psmt =con.prepareStatement(sql);
	
	for (int i = 0; i < ids.length; i++) {
		for (int j = 1; j < 10; j++) {
			psmt.setString(1, "제목" + j + "입니다.");
			psmt.setString(1, "내용" + j + "입니다.");
			psmt.setString(3, ids[i]);
			
			cnt += psmt.executeUpdate();
		}
		out.println("board 테이블 사용자 id[" +ids[i] +"]에 " + cnt + "행 입력함.");
	}
	psmt.close();
	jdbc.close();
	%>
</body>
</html>