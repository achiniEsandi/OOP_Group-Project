<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Display</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="text-center">Video Title</h2>
        <video controls>
            <source src="video_url.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>

        <!-- Like and Dislike Buttons -->
        <form action="LikeDislikeServlet" method="post" class="mt-3">
            <input type="hidden" name="videoId" value="1">
            <button type="submit" name="action" value="like" class="btn btn-success">Like</button>
            <button type="submit" name="action" value="dislike" class="btn btn-danger">Dislike</button>
        </form>

        <!-- Display Comments -->
        <div class="mt-4">
            <h4>Comments</h4>
            <ul class="list-group">
                <%
                    // JDBC code to fetch comments for the specific video
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/feedbackDB", "root", "Pajerov78");
                        String sql = "SELECT * FROM comments WHERE video_id = ?";
                        stmt = conn.prepareStatement(sql);
                        stmt.setInt(1, 1); // Assuming videoId is 1
                        rs = stmt.executeQuery();
                        while (rs.next()) {
                            int commentId = rs.getInt("id");
                            String commentText = rs.getString("comment");
                            %>
                            <li class="list-group-item">
                                <%= commentText %>
                                <!-- Edit Form -->
                                <form action="CommentServlet" method="post" style="display:inline;">
                                    <input type="hidden" name="videoId" value="1">
                                    <input type="hidden" name="commentId" value="<%= commentId %>">
                                    <input type="text" name="comment" value="<%= commentText %>" required>
                                    <button type="submit" name="action" value="edit" class="btn btn-primary">Edit</button>
                                </form>
                            </li>
                            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                            if (conn != null) conn.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </ul>
        </div>

        <!-- Comment Form -->
        <div class="mt-4">
            <form action="CommentServlet" method="post">
                <input type="hidden" name="videoId" value="1">
                <textarea name="comment" class="form-control" rows="3" placeholder="Add a comment..." required></textarea>
                <button type="submit" name="action" value="add" class="btn btn-primary mt-2">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
