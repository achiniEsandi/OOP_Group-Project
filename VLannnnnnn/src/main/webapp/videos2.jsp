<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                <li class="nav-item"><a class="nav-link active" href="videos2.jsp">Home</a></li>
                 <li class="nav-item"><a class="nav-link" href="payment.html">Go premium</a></li>
                <li class="nav-item"><a class="nav-link" href="#"
						onclick="document.getElementById('listVideosForm').submit();">Browse Videos</a>
						<form id="listVideosForm" method="POST" action="displayVideo"
							style="display: none;">
							<input type="submit" value="List All Videos" class="list-button" />
						</form></li>
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

<!-- Video Thumbnails Section -->
<div class="container my-5">
    <h2 class="text-center mb-4">Trending Videos</h2>
    <div class="row">
        <!-- Video 1 -->
        <div class="col-md-4 mb-4">
            <div class="card video-thumbnail">
                <img src="edu1.jpg" class="card-img-top" alt="Video Title 1">
                <div class="card-body">
                    <h5 class="card-title"> "Journey Through Education"</h5>
                    <p class="card-text">Explore the world of knowledge with insights on education, learning, and academic success. Dive into engaging content that will broaden your horizons..</p>
                    <a href="#" class="btn btn-primary">Watch Now</a>
                </div>
            </div>
        </div>
        <!-- Video 2 -->
        <div class="col-md-4 mb-4">
            <div class="card video-thumbnail">
                <img src="sport1.jpg" class="card-img-top" alt="Video Title 2">
                <div class="card-body">
                    <h5 class="card-title">Epic Moments in Sports</h5>
                    <p class="card-text"> Relive the excitement of the biggest games and unforgettable sports moments. From thrilling goals to epic wins, this video captures it all.</p>
                    <a href="#" class="btn btn-primary">Watch Now</a>
                </div>
            </div>
        </div>
        <!-- Video 3 -->
        <div class="col-md-4 mb-4">
            <div class="card video-thumbnail">
                <img src="entertainment1.jpg" class="card-img-top" alt="Video Title 3">
                <div class="card-body">
                    <h5 class="card-title">Cinema Magic: Must-See Movies</h5>
                    <p class="card-text">Join the adventure and experience the magic of the movies. From blockbusters to timeless classics, this video is a must-watch for every cinema lover.</p>
                    <a href="#" class="btn btn-primary">Watch Now</a>
                </div>
            </div>
        </div>
    </div>
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

