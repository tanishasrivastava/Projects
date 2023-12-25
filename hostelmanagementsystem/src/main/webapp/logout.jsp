<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>

<%
    // Invalidate the session to logout the user
    session.invalidate();

    // Redirect to the homepage
    response.sendRedirect("homepage.html");
%>
