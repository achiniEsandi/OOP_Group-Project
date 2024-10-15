<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Explore and watch your favorite videos anytime, anywhere with VideoBrowse.">
    <meta name="keywords" content="videos, browse, watch, upload, entertainment">
    <title>Upload Video</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
   
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet">
<style>

	body {
            background: url('background.jpg') no-repeat center center fixed;
            background-size: cover;
            margin: 0;
            padding: 0;
            height: 100%;
            width: 100%;
        }
 /*        
        @keyframes float {
            0% { transform: translateY(0); }
            50% { transform: translateY(-10px); }
            100% { transform: translateY(0); }
        }
        .hero { color: white; padding: 100px 0; text-align: center; }
        .hero h1 { font-size: 4rem; }
        .video-thumbnail { transition: transform 0.2s; animation: float 3s ease-in-out infinite; }
        .video-thumbnail:hover { transform: scale(1.05); } */
        
/*  .form-container {
	max-width: 500px;
	margin: auto;
	background-color: #f8f9fa;
	padding: 20px;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form-container h2 {
	color: #007bff;
}

.form-container .form-group label {
	color: #495057;
}

.form-container .form-control, .form-container .form-control-file {
	border: 1px solid #ced4da;
	color: #495057;
}

.form-container .btn-primary {
	background-color: #007bff;
	border-color: #007bff; 
} */
</style>
<meta charset="UTF-8">
<title>Upload Video</title>
</head>
<body>

	<!-- Navbar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">VideoBrowse</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
					<li class="nav-item"><a class="nav-link" href="#"
						onclick="document.getElementById('listVideosForm').submit();">Browse
							Videos</a>
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

	<br>

	<br>

	<br>

	<br>

	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${videosX != null}">
					<form action="updateVideo" method="post"
						enctype="multipart/form-data">
				</c:if>
				<c:if test="${videosX == null}">
					<form action="insertVideo" method="post"
						enctype="multipart/form-data">
				</c:if>
				<caption>
					<h2>
						<c:if test="${videosX != null}">
			                Update Video
			            </c:if>
						<c:if test="${videosX == null}">
			                Add New Video
			            </c:if>
					</h2>
				</caption>

				<c:if test="${videosX != null}">
					<input type="hidden" name="id"
						value="<c:out value='${videosX.id}' />" />
				</c:if>

				<div class="form-group">
					<label for="title">Title</label> <input type="text"
						class="form-control" id="title" name="title"
						value="<c:out value='${videosX.title}' />" required>
					<div class="invalid-feedback">Please enter a title.</div>
				</div>
				<div class="form-group">
					<label for="category">Category</label> <select class="form-control"
						id="catogary" name="catogary" required>
						<option value="" disabled selected>Select a catogary</option>
						<option value="Funny"
							<c:if test="${videosX.catogary == 'Funny'}">selected</c:if>>Funny</option>
						<option value="Tutorial"
							<c:if test="${videosX.catogary == 'Tutorial'}">selected</c:if>>Tutorial</option>
						<option value="Music"
							<c:if test="${videosX.catogary == 'Music'}">selected</c:if>>Music</option>
						<option value="News"
							<c:if test="${videosX.catogary == 'News'}">selected</c:if>>News</option>
						<option value="Sports"
							<c:if test="${videosX.catogary == 'Sports'}">selected</c:if>>Sports</option>
						<option value="Movies"
							<c:if test="${videosX.catogary == 'Movies'}">selected</c:if>>Movies</option>
					</select>
					<div class="invalid-feedback">Please select a category.</div>
				</div>
				<div class="form-group">
					<label for="fVideo">Video</label> <input type="file"
						class="form-control-file" id="fVideo" name="fVideo" accept=".mp4"
						required <c:if test="${videosX != null}">disabled</c:if>>
					<small>Current file: <c:out value='${videosX.filePath}' /></small>
					<div class="invalid-feedback">Please upload a video file.</div>
				</div>
				<%-- <div class="form-group">
					<label for="fVideo">Video</label> <input type="file"
						class="form-control-file" id="fVideo" name="fVideo" required
						<c:if test="${videosX != null}">disabled</c:if>> <small>Current
						file: <c:out value='${videosX.filePath}' />
					</small>
					<div class="invalid-feedback">Please upload a video file.</div>
				</div> --%>
				<div class="form-group">
					<label for="description">Description</label> <input type="text"
						class="form-control" id="description" name="description"
						value="<c:out value='${videosX.description}' />" required>
					<div class="invalid-feedback">Please enter a description.</div>
				</div>
				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>

	<!-- validation -->
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<script>	

	
    (function() {
        'use strict';
        window.addEventListener('load', function() {
            var forms = document.getElementsByClassName('needs-validation');
            var validation = Array.prototype.filter.call(forms, function(form) {
                form.addEventListener('submit', function(event) {
                    if (form.checkValidity() === false) {
                        event.preventDefault();
                        event.stopPropagation();
                    }
                    form.classList.add('was-validated');
                }, false);
            });
        }, false);
    })();

    //mp4 only
    document.getElementById('fVideo').addEventListener('change', function() {
        var file = this.files[0];
        var filePath = file.name;
        var allowedExtension = /(\.mp4)$/i;

        if (!allowedExtension.exec(filePath)) {
            this.value = '';
            alert('Please upload a file with .mp4 extension.');
            document.querySelector('.invalid-feedback').style.display = 'block';
        } else {
            document.querySelector('.invalid-feedback').style.display = 'none';
        }
    });
</script>


</body>
</html>
