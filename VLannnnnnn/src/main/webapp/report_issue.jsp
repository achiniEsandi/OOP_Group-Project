<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Explore and watch your favorite videos anytime, anywhere with VideoBrowse.">
    <meta name="keywords" content="videos, browse, watch, upload, entertainment">
    <title>Video Browsing System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
        
         div,h2,h3,p,form{
            color:white;
        }
        
        @keyframes float {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }
        .hero { color: white; padding: 100px 0; text-align: center; }
        .hero h1 { font-size: 4rem; }
        .video-thumbnail { transition: transform 0.2s; animation: float 3s ease-in-out infinite; }
        .video-thumbnail:hover { transform: scale(1.05); }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">VideoLane</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Go premium</a></li>
                <li class="nav-item"><a class="nav-link" href="studio.jsp">Browse Videos</a></li>
                <li class="nav-item"><a class="nav-link" href="videoUpload.jsp">Upload</a></li>
                <li class="nav-item"><a class="nav-link" href="videos.jsp">Logout</a></li>
                <li class="nav-item"><a class="nav-link" href="userProfile.jsp">My profile</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Hero Section -->
<section class="hero">
    <div class="container">
        <h1>Welcome to VideoLane</h1>
        <p>Explore and watch your favorite videos anytime, anywhere!</p>
        <a href="#" class="btn btn-primary btn-lg">Browse Now</a>
    </div>
</section>

<!-- Main Content -->
<div class="container my-5">
    <h2 class="text-center mb-4">Report Issue</h2>
    <form action="reportIssue" method="post">
        <div class="form-group">
            <label for="video_name">Video Name:</label>
            <input type="text" class="form-control" name="video_name" id="video_name" required>
        </div>
        <div class="form-group">
            <label for="issue_type">Issue Type:</label>
            <select class="form-control" name="issue_type" id="issue_type" required>
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
            </select>
        </div><br>
        <button type="submit" class="btn btn-primary">Report</button>
    </form>
</div>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
    <p>© 2024 VideoLane. All rights reserved.</p>
    <a href="#" class="text-white">Privacy Policy</a> | 
    <a href="#" class="text-white">Terms of Service</a> | 
    <a href="feedbackForm..jsp" class="text-white">Feedback</a> |
    <a href="#" class="text-white">Contact Us</a>
    <div class="social-media mt-2">
        <a href="#" class="text-white me-2">Facebook</a>
        <a href="#" class="text-white me-2">Twitter</a>
        <a href="#" class="text-white">Instagram</a>
    </div>
</footer>

<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
