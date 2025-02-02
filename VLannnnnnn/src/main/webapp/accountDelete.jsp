<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Account Deletion Confirmation</title>
    
    <!-- Bootstrap 5.3 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        .fs {
            width: 100%;
            max-width: 400px;
            border: 3px solid #000; /* Adjust the thickness (3px) and color (#000) */
            padding: 15px;
        }

        body {
            background-image: url('backgroundAccountDelete.jpg');
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-size: cover;
            padding-top: 20px;
        }

        div, h2, h3, p, form {
            color: black;
        }
    </style>
    
</head>
<body>
    <div class="container text-center">
        <h2 class="text-danger mb-4">You are about to delete your account!</h2>

        <p class="text-start">
            Are you sure you want to delete your account? Instead, you could deactivate it for 3 months and decide later whether to delete it or not.<br><br>
            By deleting your account:
        </p>

        <ul class="text-start list-styled">
            <li>Your profile, saved videos, comments, likes/dislikes, and followers will be permanently removed.</li>
            <li>You won't be able to access the Data download tool.</li>
        </ul>

        <p class="text-start">After deleting your account:</p>

        <ul class="text-start list-styled">
            <li>You can use the same username and password to create an account if they are not taken by other users.</li>
        </ul>

        <center>
        <form id="accountActionForm" method="post" action="AccountActionServlet">
            <fieldset class="fs">
                <p>Do you want to proceed with the deletion?</p>
                <button type="button" class="btn btn-danger" onclick="performAction('delete')">Yes, Delete</button>
                <button type="button" class="btn btn-warning" onclick="performAction('deactivate')">Deactivate instead</button>
            </fieldset>
        </form>
        </center>

        <script>
            function performAction(action) {
                if (action === 'delete') {
                    if (confirm("Are you sure you want to delete your account? This action cannot be undone.")) {
                        document.getElementById('accountActionForm').action = "AccountActionServlet?action=delete";
                        document.getElementById('accountActionForm').submit();
                    }
                } else if (action === 'deactivate') {
                    if (confirm("Are you sure you want to deactivate your account? You can reactivate it later.")) {
                        document.getElementById('accountActionForm').action = "AccountActionServlet?action=deactivate";
                        document.getElementById('accountActionForm').submit();
                    }
                }
            }
        </script>
    </div>

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
