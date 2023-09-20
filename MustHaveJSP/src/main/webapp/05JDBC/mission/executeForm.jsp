<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Execute Form</title></head>
<body>
<h2>select 정보 입력</h2>
<form action="executeQuery.jsp" method="post">
    테이블이름 :<input type="text" name="tableName">
    <br>
    가져올 열<input type="text" name="columnName">
    <br>
    <input type="submit" value="select">
    </form>
</body>
</html>