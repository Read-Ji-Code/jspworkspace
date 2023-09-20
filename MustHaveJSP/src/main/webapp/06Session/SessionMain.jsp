<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%
SimpleDateFormat dateFormat = new SimpleDateFormat("HH:mm:ss");
long creationTime = session.getCreationTime();
String creationTimeStr = dateFormat.format(new Date(creationTime));

long lastTime = session.getLastAccessedTime();
String lastTimeStr = dateFormat.format(new Date(lastTime));
   %>
<html>

<head><title>Session</title></head>
<body>
	<h2>Session확인</h2>
	<ul>
	<li> 세션유지시간 : <%=session.getMaxInactiveInterval() %> </li>
	<li> 아이디 : <%=session.getId() %> </li>
	<li> 최초 요청 : <%=creationTimeStr %> </li>
	<li> 마지막 : <%= lastTimeStr %></li>
	</ul>
</body>
</html>