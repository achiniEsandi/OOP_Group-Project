package Feedback.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/DeleteFeedbackServlet")
public class DeleteFeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve the feedback ID from the form
        String id = request.getParameter("id");

        try {
            // Database connection details
            String jdbcURL = "jdbc:mysql://127.0.0.1:3306/vid_system";
            String dbUser = "root";
            String dbPassword = "#Bgb54213#";
            
            // Establish a connection to the database
            Connection connection = DriverManager.getConnection(jdbcURL,dbUser,  dbPassword);

            // Create the SQL query to delete feedback
            String sql = "DELETE FROM feedback WHERE id = ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, Integer.parseInt(id));

            // Execute the delete operation
            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                // Feedback successfully deleted
                request.setAttribute("message", "Feedback deleted successfully.");
            } else {
                // No feedback found with the given ID
                request.setAttribute("message", "Error: Feedback not found.");
            }

            // Close the connection
            statement.close();
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("message", "An error occurred while deleting feedback.");
        }

        // Redirect back to the admin dashboard or feedback list page
        request.getRequestDispatcher("admin.jsp").forward(request, response);
    }
}
