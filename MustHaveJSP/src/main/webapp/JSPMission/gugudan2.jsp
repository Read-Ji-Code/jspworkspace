<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<title>구구단2</title>
</head>
<body>
	<%
	String snum = request.getParameter("col");
	if ( snum != null) {
		 int col = Integer.parseInt(snum);
	out.println("<table border='3'>");
	for (int i = 2; i < 10; i+=col) {
		for (int j = 1; j <10; j++) {
			out.print("<tr>");
			for (int k = 0; k < col; k++) {
			
			
			if ( 10 <= i+k) {
				out.print("<br>");
				break;
			}
			out.print("<td>");
			out.print((i + k) + " × " + j + " = " + (i + k) * j);
			out.print("</td>");
			if (k < col -1) out.print("\t");
			else			out.print("<br>");
		}out.print("</tr>");
	
	}
	out.println();
	}out.println("</table>");
	}else {
		out.println("col 수를 입력하세요");
	}

	%>

</body>
</html>