package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/gugudan3")
public class Gugudan3 extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html; charset=utf-8");
		PrintWriter out = resp.getWriter();
		String snum = req.getParameter("num");
		int col = 5;
		try { 
			if (snum != null) {
				col = Integer.parseInt(snum);
			}
			out.println("<table border='3'>");
			for (int i = 1; i <= 9; i++) {
				
				for (int j = 2; j <= 9; j+=col) {
					out.print("<tr>");
					for (int k = 0; k < col; k++) {
						if ( 10 <= j+k) {
							out.print("<br>");
							break;
						}
						
						out.print("<td>");
						out.printf("%d*%d=%d", (j+k), i, (j+k)*i);
						out.print("</td>");
						
						if (k < col -1) out.print("     ");
						else			out.print("<br>");
					}out.print("</tr>");
				}
				out.println();
				}
			out.println("</table>");
		} catch(Exception e) {
			out.close();
		}
	}
}
