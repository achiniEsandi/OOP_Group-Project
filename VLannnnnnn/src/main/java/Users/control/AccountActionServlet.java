package Users.control;

import javax.servlet.ServletException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Users.Model.user;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AccountActionServlet")
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

        String jdbcURL = "jdbc:mysql://127.0.0.1:3306/vid_system"; 
        String dbUser = "root"; 
        String dbPassword = "#Bgb54213#"; 

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            if ("delete".equals(action)) {
                String sqlDelete = "DELETE FROM users WHERE email = ?";
                try (PreparedStatement statement = connection.prepareStatement(sqlDelete)) {
                    statement.setString(1, email);
                    statement.executeUpdate();
                }
                session.invalidate(); // Log out the user
                response.sendRedirect("videos.jsp");
            } 
            
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
