<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Feedback and Reported Issues Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Admin Dashboard - Manage Feedback and Reported Issues</h1>

        <!-- Feedback Management Section -->
        <h2 class="mt-4">Feedback Management</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Rating</th>
                    <th>Comments</th>
                    <th>Feedback Type</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // JDBC code to fetch all feedback
                    Connection conn = null;
                    PreparedStatement stmt = null;
                    ResultSet rs = null;

                    try {
                        // Load MySQL JDBC Driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        // Establish connection to the database
                        conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

                        // Query to select all feedback
                        String sql = "SELECT * FROM feedback";
                        stmt = conn.prepareStatement(sql);
                        rs = stmt.executeQuery();

                        // Iterate over each feedback record
                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String email = rs.getString("email");
                            int rating = rs.getInt("rating");
                            String comments = rs.getString("comments");
                            String feedbackType = rs.getString("feedback_type");

                            %>
                            <tr>
                                <td><%= id %></td>
                                <td><%= name %></td>
                                <td><%= email %></td>
                                <td><%= rating %></td>
                                <td><%= comments %></td>
                                <td>
                                    <form action="UpdateFeedbackTypeServlet" method="post">
                                        <input type="hidden" name="id" value="<%= id %>">
                                        <div>
                                            <input type="checkbox" name="feedbackType" value="positive" <% if(feedbackType.equals("positive")) out.print("checked"); %>> Positive
                                            <input type="checkbox" name="feedbackType" value="neutral" <% if(feedbackType.equals("neutral")) out.print("checked"); %>> Neutral
                                            <input type="checkbox" name="feedbackType" value="negative" <% if(feedbackType.equals("negative")) out.print("checked"); %>> Negative
                                        </div>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                    <form action="DeleteFeedbackServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="<%= id %>">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
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
            </tbody>
        </table>

        <!-- Reported Issues Management Section -->
        <h2 class="mt-4">Reported Issues Management</h2>
        <table class="table table-bordered table-striped">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Video Name</th>
                    <th>Issue Type</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // JDBC code to fetch all reported issues
                    Connection conn2 = null;
                    PreparedStatement stmt2 = null;
                    ResultSet rs2 = null;

                    try {
                        // Establish connection to the database (reuse feedbackDB connection or use a separate DB if necessary)
                        conn2 = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/vid_system", "root", "#Bgb54213#");

                        // Query to select all reported issues
                        String sql2 = "SELECT * FROM reported_issues";
                        stmt2 = conn2.prepareStatement(sql2);
                        rs2 = stmt2.executeQuery();

                        // Iterate over each reported issue record
                        while (rs2.next()) {
                            int reportId = rs2.getInt("id");
                            String videoName = rs2.getString("video_name");
                            String issueType = rs2.getString("issue_type");
                            String status = rs2.getString("status");

                            %>
                            <tr>
                                <td><%= reportId %></td>
                                <td><%= videoName %></td>
                                <td><%= issueType %></td>
                                <td>
                                    <form action="UpdateReportStatusServlet" method="post">
                                        <input type="hidden" name="id" value="<%= reportId %>">
                                        <select name="status" class="form-select">
                                            <option value="pending" <% if(status.equals("pending")) out.print("selected"); %>>Pending</option>
                                            <option value="resolved" <% if(status.equals("resolved")) out.print("selected"); %>>Resolved</option>
                                            <option value="dismissed" <% if(status.equals("dismissed")) out.print("selected"); %>>Dismissed</option>
                                        </select>
                                </td>
                                <td>
                                    <button type="submit" class="btn btn-primary">Update</button>
                                    </form>
                                    <form action="DeleteReportServlet" method="post" style="display:inline;">
                                        <input type="hidden" name="id" value="<%= reportId %>">
                                        <button type="submit" class="btn btn-danger">Delete</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        try {
                            if (rs2 != null) rs2.close();
                            if (stmt2 != null) stmt2.close();
                            if (conn2 != null) conn2.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
