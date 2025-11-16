<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Job Profile - Dream Naukri</title>
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #e0f7fa, #b3e5fc);
            font-family: 'Poppins', sans-serif;
            margin-top: 100px; /* So fixed header does not overlap */
        }

        .profile-card {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            max-width: 800px;
            margin: 0 auto;
            box-shadow: 0 8px 25px rgba(0, 123, 255, 0.2);
        }

        .profile-card h2 {
            color: #003366;
            font-weight: 700;
            margin-bottom: 15px;
        }

        .profile-card p {
            color: #555;
            font-size: 1rem;
            margin: 5px 0;
        }

        .profile-actions .btn {
            border-radius: 25px;
            padding: 10px 25px;
            font-weight: 600;
            transition: 0.3s;
        }

        .profile-actions .btn:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>


<%@ include file="header.jsp" %>

<section class="container my-5">
    <div class="profile-card text-center">
        <h2>John Doe</h2>
        <p><strong>Email:</strong> john.doe@example.com</p>
        <p><strong>Phone:</strong> +91 9876543210</p>
        <p><strong>Current Job:</strong> Software Developer</p>
        <p><strong>Skills:</strong> Java, Spring Boot, React, SQL</p>
        <p><strong>Location:</strong> Delhi, India</p>

        <div class="profile-actions mt-4 d-flex justify-content-center gap-3 flex-wrap">
            <a href="#" class="btn btn-primary shadow">Edit Profile</a>
            <a href="#" class="btn btn-outline-primary shadow">Upload Resume</a>
            <a href="#" class="btn btn-success shadow">View Applied Jobs</a>
        </div>
    </div>
</section>

</body>
</html>
