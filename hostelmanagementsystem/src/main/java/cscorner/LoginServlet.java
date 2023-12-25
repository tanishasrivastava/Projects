package cscorner;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Replace these values with your actual username and password
        String expectedUsername = "admin";
        String expectedPassword = "hola";

        String username = request.getParameter("txtName");
        String password = request.getParameter("txtPwd");

        if (expectedUsername.equals(username) && expectedPassword.equals(password)) {
            // Authentication successful
            response.sendRedirect("welcome.jsp");
        } else {
            // Authentication failed
            response.sendRedirect("login.jsp");
        }
    }
}