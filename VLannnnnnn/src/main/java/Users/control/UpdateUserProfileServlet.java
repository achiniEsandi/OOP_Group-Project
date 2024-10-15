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

@WebServlet("/UpdateUserProfileServlet")
public class UpdateUserProfileServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        user loggedInUser = (user) session.getAttribute("user");
        
        if (loggedInUser == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        // Retrieve the user details from the form
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String ageStr = request.getParameter("Age");
        String gender = request.getParameter("Gender");
        String phone = request.getParameter("Phone");
        String email = loggedInUser.getEmail(); // Use the email from the session
        String address = request.getParameter("Address");

        int age = 0;
        if (ageStr != null && !ageStr.isEmpty()) {
            try {
                age = Integer.parseInt(ageStr);
            } catch (NumberFormatException e) {
                response.getWriter().write("Invalid age input.");
                return;
            }
        }

        // Update the user details in the database
        String jdbcURL = "jdbc:mysql://127.0.0.1:3306/vid_system"; 
        String dbUser = "root"; 
        String dbPassword = "#Bgb54213#"; 

        try (Connection connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword)) {
            String sql = "UPDATE users SET firstName=?, LastName=?, Age=?, Gender=?, Phone=?, Address=? WHERE email=?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setString(1, firstName);
                statement.setString(2, lastName);
                statement.setInt(3, age);
                statement.setString(4, gender);
                statement.setString(5, phone);
                statement.setString(6, address);
                statement.setString(7, email); // Use the logged-in user's email

                int rowsUpdated = statement.executeUpdate();
                if (rowsUpdated > 0) {
                    // Update the user object in session
                    loggedInUser.setfirstName(firstName);
                    loggedInUser.setLastName(lastName);
                    loggedInUser.setAge(age);
                    loggedInUser.setGender(gender);
                    loggedInUser.setPhone(phone);
                    loggedInUser.setAddress(address);
                    
                    // Redirect to profile page
                    session.setAttribute("user", loggedInUser);
                    response.sendRedirect("userProfile.jsp");
                } else {
                    response.getWriter().write("No user found with the given email.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("Database error: " + e.getMessage());
        }
    }
}
