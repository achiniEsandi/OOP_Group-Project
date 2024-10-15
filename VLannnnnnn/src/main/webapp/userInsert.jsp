<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up!</title>
    <style>
        body{
            background-image: url('background.jpg'); 
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
        }

        div,h2,h3,p,form{
            color:white;
        }
    </style>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-6">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <h2 class="text-center">Sign Up</h2>
                <p class="text-center">Let's get started!</p>
                <form action="userInsert" method="POST" id="signUp" onsubmit="return validateForm()">
                    <fieldset class="border p-5">
                        <div class="mb-3 text-start">
                            <label for="name" class="form-label">Name</label>
                            <input type="text" id="name" class="form-control" name="name" placeholder="Enter user name" required>
                        </div>
                        <div class="mb-3 text-start">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" id="email" class="form-control" name="email" placeholder="Enter email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,3}" required>
                        </div>
                        <div class="mb-3 text-start">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" id="password" class="form-control" name="password" placeholder="Enter password" required>
                        </div>
                        <!-- Confirm Password Field -->
                        <div class="mb-3 text-start">
                            <label for="confirm_password" class="form-label">Confirm Password</label>
                            <input type="password" id="confirm_password" class="form-control" name="confirm_password" placeholder="Confirm your password" required>
                        </div>
                        
                        <button type="submit" name="submit" class="btn btn-primary w-100">Sign Up</button>
                        
                    </fieldset>
                </form>
                <p class="text-center mt-3">Already have an account? <a href="login.jsp">Log In</a></p>
            </div>
        </div>
    </div>
    
			    <script>
	    function validateForm() {
	        // Get the email, password, and confirm password fields
	        var email = document.getElementById('email').value;
	        var password = document.getElementById('password').value;
	        var confirmPassword = document.getElementById('confirm_password').value;
	
	        // Email validation regex pattern
	        var emailPattern = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
	
	        // Check if email matches the pattern
	        if (!emailPattern.test(email)) {
	            alert("Please enter a valid email address.");
	            return false;
	        }
	
	        // Check if passwords match
	        if (password !== confirmPassword) {
	            alert("Passwords do not match.");
	            return false;
	        }
	
	        // Additional validations can be added here
	        
	        return true; // Allow the form to be submitted if all checks pass
	    }
	</script>
    
    
    
    <!-- Footer (Full width, outside container) -->
    <footer class="bg-dark text-white text-center py-4 mt-5">
        <div class="container">
            <p>© 2024 VideoLane. All rights reserved.</p>
            <a href="#" class="text-white">Privacy Policy</a> | 
            <a href="#" class="text-white">Terms of Service</a> | 
            <a href="#" class="text-white">Contact Us</a>
            <div class="social-media mt-2">
                <a href="#" class="text-white me-2">Facebook</a>
                <a href="#" class="text-white me-2">Twitter</a>
                <a href="#" class="text-white">Instagram</a>
            </div>
        </div>
    </footer>

    <!-- Bootstrap 5.3 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
