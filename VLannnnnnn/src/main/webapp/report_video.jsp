<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Report a Video</title>
</head>
<body>
    <h2>Report a Video</h2>
    <form action="ReportVideoServlet" method="post">
        <label for="videoName">Video Name:</label>
        <input type="text" name="videoName" required><br>

        <label for="issueType">Issue Type:</label>
        <select name="issueType" required>
            <option value="Sexual content">Sexual content</option>
            <option value="Violent or repulsive content">Violent or repulsive content</option>
            <option value="Hateful or abusive content">Hateful or abusive content</option>
            <option value="Harassment or bullying">Harassment or bullying</option>
            <option value="Harmful or dangerous acts">Harmful or dangerous acts</option>
            <option value="Misinformation">Misinformation</option>
            <option value="Child abuse">Child abuse</option>
            <option value="Promotes terrorism">Promotes terrorism</option>
            <option value="Spam or misleading">Spam or misleading</option>
            <option value="Legal issue">Legal issue</option>
            <option value="Captions issue">Captions issue</option>
        </select><br>

        <button type="submit">Submit Report</button>
    </form>
</body>
</html>