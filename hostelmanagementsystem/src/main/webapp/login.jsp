<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>

<%
    
    String expectedUsername = "admin";
    String expectedPassword = "admin123";

    String username = request.getParameter("username");
    String password = request.getParameter("password");

    if (username != null && password != null && username.equals(expectedUsername) && password.equals(expectedPassword)) {
        // Authentication successful
        session.setAttribute("username", username);
        response.sendRedirect("welcome.jsp");
    } else {
        // Authentication failed
        response.sendRedirect("login.html");
    }
%>
