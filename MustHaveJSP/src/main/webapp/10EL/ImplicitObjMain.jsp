<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
pageContext.setAttribute("scopevalue","페이지영역");
request.setAttribute("scopeValue", "리퀘스트영역");
session.setAttribute("scopeValue", "세션영역");
application.setAttribute("scopeValue", "애플리케이션영역");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL 내장객체</title>
</head>
<body>
	<h2>ImplicitObjMain페이지</h2>
	<h3>영역 속성읽기</h3>
	<ul>
	<li>페이지영역 : ${pageScope.scopeValue }</li>
	<li>리퀘스트영역 :${requestScope.scopeValue}</li>
	<li>세션영역 : ${sessionScope.scopeValue }</li>
	<li>애플리케이션 : ${applicationScope.scopeValue }</li>
	</ul>
	
	<h3>영역지정없이속성읽기</h3>
	<ul>
		<li>${scopeValue}</li>
	<jsp:forward page = "ImplicitForwardResult.jsp"/></ul>
</body>
</html>