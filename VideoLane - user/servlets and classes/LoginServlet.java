package com.videoLane;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

//@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        String jdbcURL = "jdbc:mysql://localhost:3306/videolane2";
        String jdbcUsername = "root";
        String jdbcPassword = "Dillie@2003";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword)) {
                // Query to fetch all user details
                String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
                try (PreparedStatement statement = connection.prepareStatement(sql)) {
                    statement.setString(1, email);
                    statement.setString(2, password); // Consider using a hashing function for password
                    ResultSet resultSet = statement.executeQuery();

                    if (resultSet.next()) {
                        // Create user object and populate it with user details
                        user loggedInUser = new user();
                        loggedInUser.setId(resultSet.getInt("id"));
                        loggedInUser.setName(resultSet.getString("name"));
                        loggedInUser.setEmail(resultSet.getString("email"));
                        loggedInUser.setPassword(resultSet.getString("password"));
                        loggedInUser.setfirstName(resultSet.getString("firstName"));
                        loggedInUser.setLastName(resultSet.getString("LastName"));
                        loggedInUser.setAge(resultSet.getInt("Age"));
                        loggedInUser.setGender(resultSet.getString("Gender"));
                        loggedInUser.setPhone(resultSet.getString("Phone"));
                        loggedInUser.setAddress(resultSet.getString("Address"));

                        // Store user object in session
                        HttpSession session = request.getSession();
                        session.setAttribute("user", loggedInUser);

                        // Redirect to profile page or home page
                        response.sendRedirect("homePage.jsp");
                    } else {
                        // If invalid credentials
                        response.sendRedirect("login.jsp?error=Invalid credentials");
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=Database error");
        }
    }
}
