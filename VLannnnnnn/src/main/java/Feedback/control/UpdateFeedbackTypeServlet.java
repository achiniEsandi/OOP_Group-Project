package Feedback.control;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UpdateFeedbackTypeServlet")
public class UpdateFeedbackTypeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

            // Get feedback ID from request parameter
            int feedbackId = Integer.parseInt(request.getParameter("id"));

            // Check feedback type checkboxes
            String feedbackType = "";
            if (request.getParameterValues("feedback_type") != null) {
                String[] feedbackTypes = request.getParameterValues("feedback_type");
                feedbackType = String.join(", ", feedbackTypes); // Join selected types
            }

            // Update feedback type in the database
            String sql = "UPDATE feedback SET feedback_type = ? WHERE id = ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, feedbackType);
            pstmt.setInt(2, feedbackId);
            pstmt.executeUpdate();

            // Redirect back to the admin dashboard
            response.sendRedirect("adminDashboard");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error updating feedback type.");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}
