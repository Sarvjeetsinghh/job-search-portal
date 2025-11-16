<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%
    String employerName = (String) session.getAttribute("employerName");
    if (employerName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employer Dashboard - DreamJob</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #E0F7FF, #B0E3FF);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        .navbar {
            background: linear-gradient(135deg, #007BFF, #00C6FF);
        }

        .navbar-brand {
            font-weight: 600;
            color: #fff !important;
        }

        .navbar .nav-link {
            color: #fff !important;
            margin: 0 10px;
        }

        .dashboard-container {
            flex: 1;
            padding: 40px;
        }

        .welcome-box {
            background: #ffffffb8;
            backdrop-filter: blur(10px);
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
            padding: 30px;
            text-align: center;
            margin-bottom: 30px;
        }

        .welcome-box h2 {
            color: #005EA8;
            font-weight: 600;
        }

        .card {
            border: none;
            border-radius: 20px;
            box-shadow: 0 6px 15px rgba(0,0,0,0.08);
            transition: all 0.3s;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card i {
            font-size: 40px;
            color: #007BFF;
            margin-bottom: 10px;
        }

        footer {
            text-align: center;
            background: #007BFF;
            color: white;
            padding: 10px 0;
            font-size: 14px;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg">
    <div class="container-fluid px-4">
        <a class="navbar-brand" href="#">DreamJob Employer</a>
        <button class="navbar-toggler bg-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="bi bi-list"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item"><a class="nav-link" href="post-job.jsp"><i class="bi bi-briefcase"></i> Post Job</a></li>
                <li class="nav-item"><a class="nav-link" href="available-jobs.jsp"><i class="bi bi-card-list"></i> View Jobs</a></li>
                <li class="nav-item"><a class="nav-link" href="candidates.jsp"><i class="bi bi-people"></i> Candidates</a></li>
                <li class="nav-item"><a class="nav-link" href="logout.jsp"><i class="bi bi-box-arrow-right"></i> Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Dashboard Main -->
<div class="dashboard-container container">
    <div class="welcome-box">
        <h2>Welcome, <%= employerName %> 👋</h2>
        <p class="text-muted">Manage your jobs, view candidates, and grow your team easily.</p>
    </div>

    <div class="row g-4">
        <div class="col-md-4">
            <div class="card p-4 text-center">
                <i class="bi bi-briefcase-fill"></i>
                <h5>Post a New Job</h5>
                <p class="text-muted">Easily create and share new job openings.</p>
                <a href="post-job.jsp" class="btn btn-primary btn-sm mt-2">Post Job</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-4 text-center">
                <i class="bi bi-card-list"></i>
                <h5>Manage Posted Jobs</h5>
                <p class="text-muted">Edit, update, or remove existing job posts.</p>
                <a href="available-jobs.jsp" class="btn btn-primary btn-sm mt-2">View Jobs</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="card p-4 text-center">
                <i class="bi bi-people-fill"></i>
                <h5>View Applicants</h5>
                <p class="text-muted">Check who applied to your job posts.</p>
                <a href="candidates.jsp" class="btn btn-primary btn-sm mt-2">View Candidates</a>
            </div>
        </div>
    </div>
</div>

<footer>
    © 2025 DreamJob Portal | Designed for Employers
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
