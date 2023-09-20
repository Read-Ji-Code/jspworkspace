<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>Insert Form</title></head>
<body>
<h2>로그인 및 select 정보 입력</h2>


<form action ="InsertSuccess.jsp" method ="post">
	id : <input type = "text" name="id" />	
	<br/>
    pass : <input type ="password" name ="password"/>
	<br/>
    name :<input type="text" name="name">
    <br>
    <input type="submit" value="Insert">
    </form>
</body>
</html>