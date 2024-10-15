<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.videolane.user" %>

<%
    // Retrieve the user object from the session
    user loggedInUser = (user) session.getAttribute("user");
    if (loggedInUser == null) {
        // If no user is logged in, redirect to login page
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .profile-pic {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
        }
        .profile-container {
            display: flex;
            justify-content: space-between;
        }
        
        body {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            padding-top: 20px;
        }
        
    </style>
</head>
<body>
    <div class="container bg-light p-4">
        <div class="p-3 text-center" style="background-color: #000045; color:white;">
            <h1>User Profile</h1>
        </div>
        <br>
        <!-- Profile content and picture -->
        <div class="profile-container">
            <!-- User details on the left -->
            <div class="col-md-8">
                <h3>User Details</h3>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="firstName">First Name:</label>
                        <p><%= loggedInUser.getfirstName() != null ? loggedInUser.getfirstName() : "N/A" %></p>
                    </div>
                    <div class="col-md-6">
                        <label for="lastName">Last Name:</label>
                        <p><%= loggedInUser.getLastName() != null ? loggedInUser.getLastName() : "N/A" %></p>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="age">Age:</label>
                        <p><%= loggedInUser.getAge() != 0 ? loggedInUser.getAge() : "N/A" %></p>
                    </div>
                    <div class="col-md-6">
                        <label for="gender">Gender:</label>
                        <p><%= loggedInUser.getGender() != null ? loggedInUser.getGender() : "N/A" %></p>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="phone">Phone:</label>
                        <p><%= loggedInUser.getPhone() != null ? loggedInUser.getPhone() : "N/A" %></p>
                    </div>
                    <div class="col-md-6">
                        <label for="address">Address:</label>
                        <p><%= loggedInUser.getAddress() != null ? loggedInUser.getAddress() : "N/A" %></p>
                    </div>
                </div>
                <div class="row mb-3">
                    <div class="col-md-6">
                        <label for="email">Email:</label>
                        <p><%= loggedInUser.getEmail() != null ? loggedInUser.getEmail() : "N/A" %></p>
                    </div>
                </div>
            </div>
            
            <!-- Profile picture on the right -->
            <div class="col-md-4 text-center">
                <img src="userAvartar.jpg" alt="Profile Picture" class="profile-pic mb-3">
                <p><strong><%= loggedInUser.getfirstName() != null ? loggedInUser.getfirstName() + " " + loggedInUser.getLastName() : "N/A" %></strong></p>
            </div>
        </div>

        <div class="text-center mt-4">
            <a href="videos.jsp" class="btn btn-primary">Back To Home</a>
            <a href="editUserProfile.jsp" class="btn btn-primary">Update Profile</a> <br>
            <button class="btn btn-danger mt-3">
                <a href="accountDelete.jsp" style="color: white; text-decoration: none;">Delete Account</a>
            </button>
        </div>

        <footer class="bg-dark text-white text-center py-4 mt-5">
            <div class="container">
                <p>© 2024 VideoLane. All rights reserved.</p>
            </div>
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
