<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구구단</title>
</head>
<body>
    <%
    String snum = request.getParameter("dan");
    if (snum != null) {
        int num = Integer.parseInt(snum);
        for (int i = 1; i <= 9; i++) {
            int result = num * i;
            out.println(num + " * " + i + " = " + result + "<br>");
        }
    } else {
        out.println("단수를 입력하세요.");
    }
    %>
</body>
</html>
