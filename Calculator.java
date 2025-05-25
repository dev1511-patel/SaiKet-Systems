package edu.jspiders.servlets;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
@SuppressWarnings("serial")
@WebServlet("/Calculator")
public class Calculator extends HttpServlet {
		protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        double num1 = Double.parseDouble(request.getParameter("num1"));
        double num2 = Double.parseDouble(request.getParameter("num2"));
        String operation = request.getParameter("operation");

        double result = 0;

        try {
            switch (operation) {
                case "add": result = num1 + num2; break;
                case "subtract": result = num1 - num2; break;
                case "multiply": result = num1 * num2; break;
                case "divide":
                    if (num2 == 0) throw new ArithmeticException("Division by zero");
                    result = num1 / num2;
                    break;
            }

            // Redirect to index with result
            response.sendRedirect("index.html?result=" + result);

        } catch (Exception e) {
            response.sendRedirect("index.html?result=Error");
        }
    }

}
