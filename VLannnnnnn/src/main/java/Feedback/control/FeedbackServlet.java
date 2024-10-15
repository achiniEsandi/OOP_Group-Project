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

@WebServlet("/submitFeedback")
public class FeedbackServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int rating = Integer.parseInt(request.getParameter("rating"));
        String comments = request.getParameter("comments");

        // Classify feedback based on rating
       // String feedbackType = classifyFeedback(rating);

        // Database connection
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to the database
            conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

            // SQL query to insert feedback into the database
            String sql = "INSERT INTO feedback (name, email, rating, comments ) VALUES (?, ?, ?, ? )";

            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setInt(3, rating);
            pstmt.setString(4, comments);
            //pstmt.setString(5, feedbackType);

            // Execute the query
            pstmt.executeUpdate();

            // Redirect to success page or admin dashboard
            response.sendRedirect("videos.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("error.html");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    /*private String classifyFeedback(int rating) {
        if (rating >= 4) return "positive";
        else if (rating == 3) return "neutral";
        else return "negative"
    }*/
}
