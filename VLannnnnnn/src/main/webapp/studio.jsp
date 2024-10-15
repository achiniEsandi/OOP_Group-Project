<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Explore and watch your favorite videos anytime, anywhere with VideoBrowse.">
<meta name="keywords" content="videos, browse, watch, upload, entertainment">
<title>Studio</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
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

/*  <!--Studio  --> */
/* .container-1-8, .container-2-8, .container-5-8 {
	padding: 15px;
	border: 1px solid #ccc;
	height: 100vh;
	overflow-y: auto;
}
 */
 
.container-1-8 {
	width: 12.5%;
}

.container-2-8 {
	width: 25%;
	background-color: #333338;
	margin-bottom: 20px;
	margin-top: 20px;
	border-radius: 15px;
}

.container-5-8 {
	width: 62.5%;
}

.diagram-container {
	display: flex;
}

.diagram-section {
	text-align: center;
	margin-bottom: 20px;
}

.diagram-section h5 {
	margin-top: 10px;
}

.diagram-section img {
	max-width: 100%;
}

.videoCard {
	background-color: #333338;
	margin-bottom: 20px;
	margin-top: 10px;
	padding: 20px;
	align-items: center;
	border-radius: 15px;
}

.card-title{
	    color: #ffffff;
}
 h2{
    color: #ffffff;
	margin: 0%;
	font-size: 27px;
}

h3 {
	color: #acaaaa;
	margin: 0%;
	font-size: 20px;
}

.date {
	text-align: right;
}

/* .catDate {
	justify-content: space-between;
} */

.card-text {
	display: flex;
	justify-content: space-between;
}

.left-text {
	float: left;
}

.right-text {
	float: right;
}

/* For edit delete button */
.btn {
	display: inline-block;
	padding: 10px 20px;
	font-size: 16px;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	border-radius: 5px;
	transition: background-color 0.3s ease;
}

.edit-btn {
	width: 80px;
	height: 34px;
	background-color: green;
	text-align: center;
	margin: 5px;
	padding: 5px;
	color: white;
}

.edit-btn:hover {
	background-color: darkgreen;
}

.delete-btn {
	width: 80px;
	height: 34px;
	background-color:  rgb(174, 6, 6);;
	color: white;
	text-align: center;
	margin: 5px;
	padding: 5px;
}

.delete-btn:hover {
	background-color: darkred;
}

/* CSS for the form button */
form input[type="submit"].btn.btn-secondary {
    font-size: 18px; /* Adjust the font size */
    padding: 10px 20px; /* Adjust the padding */
    background-color: #6c757d; /* Secondary button color */
    border: none;
    color: white;
    cursor: pointer;
    margin-left: 15px;
    border-radius: 5px; /* Optional: to round the corners */
}

/* CSS for the link button */
a.btn.btn-info {
    font-size: 18px; /* Adjust the font size */
    padding: 10px 20px; /* Adjust the padding */
    background-color: #17a2b8; /* Info button color */
    border: none;
    color: white;
    text-decoration: none; /* Remove underline */
    display: inline-block;
    text-align: center;
     margin-left: 15px;
    border-radius: 5px; /* Optional: to round the corners */
}

a.btn.btn-info:hover, form input[type="submit"].btn.btn-secondary:hover {
    background-color: #138496; /* Darken the button color on hover */
}
 
 h5 {
    color: white; /* Sets text color to white */
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
                <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="document.getElementById('listVideosForm').submit();">Browse Videos</a>
						<form id="listVideosForm" method="POST" action="displayVideo"
							style="display: none;">
							<input type="submit" value="List All Videos" class="list-button" />
						</form></li>
					<li class="nav-item"><a class="nav-link" href="videoUpload.jsp">Upload</a></li>
                <li class="nav-item"><a class="nav-link" href="#">About</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Login</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Register</a></li>
            </ul>
            
        </div>
    </div>
</nav> 
<div class="container-fluid mt-5">
		<div class="diagram-container">
			<div class="container-1-8">
				<!-- Content for 1/8 width -->
				<div class="diagram-section">

					<h5 >Category</h5>
					<img src="path/to/your/image1.png" alt=" ">
					<div id="list-example" class="list-group">
						<a class="list-group-item list-group-item-action"
							href="#list-item-1">Funny</a> 
						<a class="list-group-item list-group-item-action"
							href="#list-item-2">Tutorial</a> 
						<a class="list-group-item list-group-item-action"
							href="#list-item-3">Music</a> 
						<a class="list-group-item list-group-item-action"
							href="#list-item-4">News</a>
						<a class="list-group-item list-group-item-action"
							href="#list-item-4">Sports</a>
						<a class="list-group-item list-group-item-action"
							href="#list-item-4">Movies</a>
					</div>
				</div>
			</div>
			<div class="container-5-8">
				<!-- Core MVC Components in 5/8 width -->
				

				<form method="POST" action="displayVideo">
					<table>
						<tr>
							<td colspan="2"><input type="submit"
								value="List All Videos" class="btn btn-secondary" /></td>
						</tr>
					</table>
				</form>
				
				<a href="videoUpload.jsp" class="btn btn-info">Add Video</a>
				<a href="report_issue.jsp" class="btn btn-info">Report Video</a>
				
				<div class="container">
					<c:forEach var="Vid" items="${videosX}">
						<div class="videoCard">
							<!-- <div class= "videoPlayer">
								
							</div> -->
							<video width="850" height="500" controls>

								<source src="<c:out value="${Vid.filePath}"/>" type="video/mp4">

							</video>
							
							<div class="card-body">
								<h2 class="card-title">
									<c:out value="${Vid.title}" />
								</h2>
								<h3 class="card-text">Description : 
									<c:out value="${Vid.description}" />
								</h3>
								<h3 class="card-text">
									<span class="left-text">Category :<c:out value="${Vid.catogary}" /></span>
									<span class="right-text"><c:out value="${Vid.date}" /></span>
								</h3>

								<a href="editVideo?id=<c:out value='${Vid.id}' />"
									class="btn edit-btn">Edit</a><!--  &nbsp;&nbsp;&nbsp;&nbsp; -->
								<a href="deleteVideo?id=<c:out value='${Vid.id}' />"
									class="btn delete-btn">Delete</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<br>
				<br>

			</div>
			<div class="container-2-8">
				<!-- Content for 2/8 width -->
				<div class="diagram-section">
					<h5></h5>
					<!-- <img src="path/to/your/image2.png" alt="2/8 Section"> -->
				</div>
			</div>
		</div>
	</div>
	
	
	<nav aria-label="Page navigation example">
  <ul class="pagination justify-content-center">
    <li class="page-item disabled">
      <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
    </li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item">
      <a class="page-link" href="#">Next</a>
    </li>
  </ul>
</nav>

<!-- Footer -->
<footer class="bg-dark text-white text-center py-4">
    <p>� 2024 VideoBrowse. All rights reserved.</p>
    <a href="#" class="text-white">Privacy Policy</a> | 
    <a href="#" class="text-white">Terms of Service</a> | 
    <a href="#" class="text-white">Contact Us</a>
    <div class="social-media mt-2">
        <a href="#" class="text-white me-2">Facebook</a>
        <a href="#" class="text-white me-2">Twitter</a>
        <a href="#" class="text-white">Instagram</a>
    </div>
</footer>

        <script>
        document.addEventListener('play', function(event) {
            var videos = document.getElementsByTagName('video');
            for (var i = 0; i < videos.length; i++) {
                if (videos[i] !== event.target) {
                    videos[i].pause();
                }
            }
        }, true);
    </script>
<!-- Bootstrap JS and dependencies -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/js/bootstrap.bundle.min.js"></script>
</body>
</html>
