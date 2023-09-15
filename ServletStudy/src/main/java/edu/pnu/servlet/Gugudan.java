package edu.pnu.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/gugudan")
public class Gugudan extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/plain; charset=utf-8");
        PrintWriter out = resp.getWriter();
        String snum = req.getParameter("num");
        int num =2;
        try {
        	if (snum != null) {
            num = Integer.parseInt(snum);
            }
            for (int i = 1; i <= 9; i++) {
                int result = num * i;
                out.println(num + " * " + i + " = " + result );
            }
        } catch (Exception e) {
        } out.close();
    }
}
