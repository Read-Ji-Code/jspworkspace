<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>표현언어 EL 내장 객체</title>
</head>
<body>
	<h2>ImplicitForwardResult</h2>
	<h3>각 영역에 저장된 속성 읽기</h3>
	<ul>
		<li>페이지영역 : ${pageScope.scopeValue }</li>
		<li>리퀘스트영역 :${requestScope.scopeValue}</li>
		<li>세션영역 : ${sessionScope.scopeValue }</li>
		<li>애플리케이션 : ${applicationScope.scopeValue }</li>
	</ul>
	<h3>영역지정없이속성읽기</h3>
	<ul>
		<li>${scopeValue}</li>
	</ul>
</body>
</html>