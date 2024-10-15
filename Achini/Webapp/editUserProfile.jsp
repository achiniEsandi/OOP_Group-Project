<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background-image: url('background.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            padding-top: 20px;
        }
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
    </style>
</head>
<body>
    <div class="container bg-secondary p-4">
        <div class="p-3 text-center" style="background-color: #000045; color:aliceblue;">
            <h1>Edit User Profile</h1>
        </div>

        <div class="row mt-3 profile-container">
            <!-- Form for editing user details on the left -->
            <div class="col-md-8 bg-secondary p-4">
               <form action="UpdateUserProfileServlet" method="POST">
                    <!-- Hidden input for userId -->
                    <input type="hidden" name="userId" value="${sessionScope.user.id}">
                    
                    <h3>User Details</h3>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="firstName" class="form-label">First Name</label>
                            <input type="text" id="firstName" name="firstName" class="form-control" value="${sessionScope.user.firstName}">
                        </div>
                        <div class="col-md-6">
                            <label for="lastName" class="form-label">Last Name</label>
                            <input type="text" id="lastName" name="lastName" class="form-control" value="${sessionScope.user.lastName}">
                        </div>
                    </div>
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="Age" class="form-label">Age</label>
                            <input type="text" id="Age" name="Age" class="form-control" value="${sessionScope.user.age}">
                        </div>
                        <div class="col-md-6">
                            <label for="Gender" class="form-label">Gender</label>
                            <input type="text" id="Gender" name="Gender" class="form-control" value="${sessionScope.user.gender}">
                        </div>
                    </div>

                    <div class="row mb-3">
                        <div class="col-md-6">
                            <label for="Phone" class="form-label">Phone</label>
                            <input type="text" id="Phone" name="Phone" class="form-control" value="${sessionScope.user.phone}">
                        </div>
                        <div class="col-md-6">
                            <label for="email" class="form-label">Email</label>
                            <input type="text" id="email" name="email" class="form-control" value="${sessionScope.user.email}" disabled>
                        </div>
                    </div>
                    <div class="mb-3">
                        <label for="Address" class="form-label">Address</label>
                        <textarea id="Address" name="Address" class="form-control">${sessionScope.user.address}</textarea>
                    </div>
                    <button type="submit" class="btn btn-primary">Save</button>
                </form>
            </div>
            
            <!-- Profile picture on the right -->
            <div class="col-md-4 text-center">
                <img src="profile-pic-placeholder.jpg" alt="Profile Picture" class="profile-pic mb-3">
                <p><strong><%= session.getAttribute("user.firstName") != null ? session.getAttribute("user.firstName") + " " + session.getAttribute("user.lastName") : "N/A" %></strong></p>
            </div>
        </div>
    </div>

    <footer class="bg-dark text-white text-center py-4 mt-5">
        <div class="container">
            <p>© 2024 VideoLane. All rights reserved.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
