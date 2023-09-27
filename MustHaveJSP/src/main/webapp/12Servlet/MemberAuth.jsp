<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberAuth.jsp</title>
</head>
<body>
	<h2>mvc 패턴으로 회원인증</h2>
	<p>
		<strong>${ authMessage }</strong>
		<br/>
		<a href="./MemberAuth.mvc?id=nakja&pass=1234">회원인증(관리자)</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=musthave&pass=1234">회원인증(회원)</a>
		&nbsp;&nbsp;
		<a href="./MemberAuth.mvc?id=stranger&pass=1234">회원인증(비회원)</a>
	</p>
	
<form method = "get" action="MemberAuth.mvc">
		아이디 :<input type = "text" name = "id"/>
		<br/>
		비밀번호 : <input type ="text" name = "pass"/>
		<br/>
		<input type = "submit" />
</form>
</body>
</html>