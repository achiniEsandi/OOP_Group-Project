package com.videoLane;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AccountActionServlet extends HttpServlet {
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        user loggedInUser = (user) session.getAttribute("user");

        if (loggedInUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String action = request.getParameter("action");
        String email = loggedInUser.getEmail(); // Using email to identify the user

        String jdbcURL = "jdbc:mysql://localhost:3306/videolane2"; // Update with your DB URL
        String dbUser = "root"; // Update with your DB username
        String dbPassword = "Dillie@2003"; // Update with your DB password

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            if ("delete".equals(action)) {
                String sqlDelete = "DELETE FROM users WHERE email = ?";
                try (PreparedStatement statement = connection.prepareStatement(sqlDelete)) {
                    statement.setString(1, email);
                    statement.executeUpdate();
                }
                session.invalidate(); // Log out the user
                response.sendRedirect("videos.jsp");
            } /*else if ("deactivate".equals(action)) {
                String sqlDeactivate = "UPDATE users SET active = 0 WHERE email = ?";
                try (PreparedStatement statement = connection.prepareStatement(sqlDeactivate)) {
                    statement.setString(1, email);
                    statement.executeUpdate();
                }
                session.invalidate(); // Log out the user
                response.sendRedirect("homepage.jsp");
            }*/
            
            else {
            	 session.invalidate(); // Log out the user
                 response.sendRedirect("videos.jsp");
            }
        } 
        
        catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
