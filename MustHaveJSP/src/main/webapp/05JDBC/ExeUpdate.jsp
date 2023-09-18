<%@ page import ="java.sql.PreparedStatement" %>
<%@ page import = "java.sql.Connection" %>
<%@page import = "common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head><title>JDBC</title></head>
<body>
	<h2>회원 추가 테스트(executeUpdate() 사용)</h2>
	<%
	JDBConnect jdbc = new JDBConnect();
	Connection con = jdbc.getConnection();
	
// 	String id = "test1";
// 	String pass = "1111";
// 	String name = "테스트1회원";
	
// 	String sql = "insert into member values (?, ?, ?, curdate)";
// 	PreparedStatement psmt = jdbc.con.prepareStatement(sql);
// 	psmt.setString(1,id);
// 	psmt.setString(2,pass);
// 	psmt.setString(3,name);
	
// 	int inResult = psmt.executeUpdate();
// 	out.println(inResult + "행이 입력되었습니다.");

	int cnt = 0;
	
	String [] ids = {"musthave", "willhave", "dohave"};
	String [] names = {"머스트해브", "윌해브", "두해브"};
	
	String sql = "insert into member values (?, ?, ?, curdate)";
	PreparedStatement psmt = con.prepareStatement(sql);
	for (int i = 0; i <ids.length; i++) {
		psmt.setString(1, ids[i]);
		psmt.setString(2, "1234");
		psmt.setString(3, names[i]);
		
		cnt += psmt.executeUpdate();
	}
	out.println("member테이블에 " +cnt + "행 입력됨.");
	psmt.close();
	jdbc.close();
	%>
</body>
</html>