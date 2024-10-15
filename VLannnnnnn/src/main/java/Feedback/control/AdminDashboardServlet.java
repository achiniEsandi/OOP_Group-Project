package Feedback.control;
import Report.Model.ReportIssue;
import Report.Model.ReportIssueDAO;
import Report.Model.DbUtil;
import Report.control.*;
import Feedback.Model.*;









import java.io.IOException;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

@WebServlet("/adminDashboard")
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set content type to HTML
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Start HTML response
        out.println("<html><head>");
        out.println("<title>Admin Dashboard</title>");
        out.println("<link href='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css' rel='stylesheet'>");
        out.println("</head><body>");
        out.println("<div class='container mt-5'>");
        out.println("<h2 class='text-center'>Feedback Dashboard</h2>");

        // Form to add new feedback type
        out.println("<form action='adminDashboard' method='POST' class='mb-4'>");
        out.println("<div class='row'>");
        out.println("<div class='col-md-4'>");
        out.println("<select class='form-select' name='feedback_type' required>");
        out.println("<option selected disabled>Choose Feedback Type</option>");
        out.println("<option value='Positive'>Positive</option>");
        out.println("<option value='Negative'>Negative</option>");
        out.println("<option value='Neutral'>Neutral</option>");
        out.println("</select>");
        out.println("</div>");
        out.println("<div class='col-md-2'>");
        out.println("<button type='submit' class='btn btn-primary'>Enter</button>");
        out.println("</div>");
        out.println("</div>");
        out.println("</form>");

        out.println("<table class='table table-bordered table-hover mt-3'>");
        out.println("<thead><tr><th>ID</th><th>Name</th><th>Email</th><th>Rating</th><th>Comments</th><th>Feedback Type</th><th>Submission Date</th></tr></thead><tbody>");

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

            // Query to retrieve all feedback entries
            String sql = "SELECT * FROM feedback";
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            // Iterate through the result set and display feedback data in table rows
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("name") + "</td>");
                out.println("<td>" + rs.getString("email") + "</td>");
                out.println("<td>" + rs.getInt("rating") + "</td>");
                out.println("<td>" + rs.getString("comments") + "</td>");
                out.println("<td>" + rs.getString("feedback_type") + "</td>");
                out.println("<td>" + rs.getTimestamp("submission_date") + "</td>");
                out.println("</tr>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<p>Error retrieving feedback data.</p>");
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Close HTML table and body
        out.println("</tbody></table>");
        out.println("</div>");
        out.println("<script src='https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js'></script>");
        out.println("</body></html>");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String feedbackType = request.getParameter("feedback_type");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish connection to the database
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

            // Insert feedback type into the database
            String sql = "INSERT INTO feedback (feedback_type) VALUES (?)"; // Adjust the table name as necessary
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, feedbackType);
            pstmt.executeUpdate();

            // Redirect back to the dashboard
            response.sendRedirect("admin");
        } catch (Exception e) {
            e.printStackTrace();
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
