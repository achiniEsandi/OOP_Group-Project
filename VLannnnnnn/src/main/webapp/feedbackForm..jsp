<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="We value your feedback! Help us improve your experience with VideoLane.">
    <meta name="keywords" content="feedback, review, comments, videos, VideoLane">
    <title>Feedback - VideoLane</title>
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
        .feedback-section {
            background-color: rgba(0, 0, 0, 0.7);
            color: white;
            padding: 60px 0;
        }
        .feedback-section h2 {
            font-size: 3rem;
            margin-bottom: 30px;
        }
        .form-control {
            background-color: rgba(255, 255, 255, 0.8);
        }
        .form-control:focus {
            background-color: white;
        }
        .submit-btn {
            background-color: #28a745;
            border: none;
        }
        .submit-btn:hover {
        
            background-color: #218838;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">VideoBrowse</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="#">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Browse Videos</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Upload</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
                <li class="nav-item"><a class="nav-link active" href="#">Feedback</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Feedback Section -->
<section class="feedback-section">
    <div class="container">
        <h2 class="text-center">We Value Your Feedback</h2>
        <p class="text-center">Help us improve your experience with VideoLane by providing your valuable feedback.</p>
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <form action="submitFeedback" method="POST"  onsubmit="return validateForm()">
                    <!-- Name -->
                    <div class="mb-3">
                        <label for="name" class="form-label">Your Name</label>
                        <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
                    </div>
                    <!-- Email -->
                    <div class="mb-3">
                        <label for="email" class="form-label">Your Email</label>
                        <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" required>
                    </div>
                    <!-- Rating -->
                    <div class="mb-3">
                        <label for="rating" class="form-label">Rate Us</label>
                        <select class="form-select" id="rating" name="rating" required>
                            <option selected disabled>Choose...</option>
                            <option value="5">5 - Excellent</option>
                            <option value="4">4 - Very Good</option>
                            <option value="3">3 - Good</option>
                            <option value="2">2 - Fair</option>
                            <option value="1">1 - Poor</option>
                        </select>
                    </div>
                    <!-- Comments -->
                    <div class="mb-3">
                        <label for="comments" class="form-label">Your Comments</label>
                        <textarea class="form-control" id="comments" name="comments" rows="5" placeholder="Share your thoughts..." required></textarea>
                    </div>
                    <!-- Submit Button -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-success submit-btn btn-lg">Submit Feedback</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>


			    <script>
	    function validateForm() {
	        // Get the email, password, and confirm password fields
	        var email = document.getElementById('email').value;
	
	        // Email validation regex pattern
	        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	        // Check if email matches the pattern
	        if (!emailPattern.test(email)) {
	            alert("Please enter a valid email address.");
	            return false;
	        }
	
	        
	
	        // Additional validations can be added here
	        
	        return true; // Allow the form to be submitted if all checks pass
	    }
	</script>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
    <p>© 2024 VideoLane. All rights reserved.</p>
    <a href="#" class="text-white">Privacy Policy</a> |
    <a href="#" class="text-white">Terms of Service</a> |
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
