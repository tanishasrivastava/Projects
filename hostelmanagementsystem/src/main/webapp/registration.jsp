<%@ page import="java.io.*,java.util.*" %>
<%@ page import="javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>

<%
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    // JDBC code to insert data into the database
    String jdbcUrl = "jdbc:mysql://localhost:3306/hostel_management";
    String dbUsername = "tanishasrivastava";
    String dbPassword = "#081120040t";

    try (Connection connection = DriverManager.getConnection(jdbcUrl, dbUsername, dbPassword)) {
        String query = "INSERT INTO students (name, email) VALUES (?, ?)";
        try (PreparedStatement preparedStatement = connection.prepareStatement(query)) {
            preparedStatement.setString(1, firstName + " " + lastName);
            preparedStatement.setString(2, email);
            preparedStatement.executeUpdate();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    // For demonstration purposes, create and add cookies
    Cookie firstNameCookie = new Cookie("firstName", firstName);
    Cookie lastNameCookie = new Cookie("lastName", lastName);
    Cookie emailCookie = new Cookie("email", email);

    response.addCookie(firstNameCookie);
    response.addCookie(lastNameCookie);
    response.addCookie(emailCookie);

    // Redirect to registration success page
    response.sendRedirect("registration-success.jsp");
%>
