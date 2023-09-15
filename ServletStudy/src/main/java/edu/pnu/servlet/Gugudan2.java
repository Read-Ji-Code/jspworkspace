package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gugudan2")
public class Gugudan2 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String dir = req.getParameter("dir");
		try {
			dir = "hor";
			if (dir.equals("ver")) { 
			
				for (int i = 2; i <= 9; i++) {
					for (int j = 1; j <= 9; j++) {
						int result = i * j;
						out.println(i + " * " + j + " = " + result + "<br>");
					}
					out.println("<br>");
					out.println("<br>");
				}
			}
			else if(dir.equals("hor")) {
				out.println("<table border='3'>");
				for (int i = 1; i <= 9; i++) {
					out.print("<tr>");
					for (int j = 2; j <= 9; j++) {
						int result = i * j;
						out.print("<td>");
						out.print(j + " * " + i + " = " + result);
						out.print("</td>");
					}	
					out.print("</tr>");
					
					
				}
				 out.println("</table>");
			}
		} catch (Exception e) {
		}
		out.close();

	}
}
