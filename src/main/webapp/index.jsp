<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ApnaJob - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            background: linear-gradient(135deg, #ffe2d1, #cbb2fe);
            min-height: 100vh;
            font-family: 'Poppins', sans-serif;
        }

        .navbar {
            background: transparent;
        }

        .navbar-brand {
            font-weight: 700;
            font-size: 28px;
        }

        .hero {
            text-align: center;
            padding: 80px 20px;
            color: #222;
        }

        .hero h1 {
            font-weight: 700;
            font-size: 2rem;
        }

        .btn-orange {
            background-color: #ff4b00;
            color: white;
            font-weight: 600;
            border-radius: 25px;
            padding: 10px 20px;
            text-decoration: none;
            transition: 0.3s;
        }

        .btn-orange:hover {
            background-color: #e03e00;
        }

        .search-bar {
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }

        .search-bar input {
            width: 50%;
            padding: 12px;
            border-radius: 50px 0 0 50px;
            border: none;
            outline: none;
        }

        .search-bar button {
            border-radius: 0 50px 50px 0;
            background-color: #1a1b4b;
            color: white;
            border: none;
            padding: 12px 25px;
            transition: 0.3s;
        }

        .search-bar button:hover {
            background-color: #0e0f3b;
        }

        @media (max-width: 768px) {
            .search-bar input {
                width: 70%;
            }

            .hero h1 {
                font-size: 1.6rem;
            }

            .navbar .btn {
                margin-top: 5px;
                display: block;
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg px-4">
        <a class="navbar-brand" href="#">Dream<span class="text-primary">Job</span>.in</a>
        <div class="ms-auto">
            <a href="registerCandidate.jsp" class="btn btn-orange me-2">Register as Candidate</a>
            <a href="registerEmployer.jsp" class="btn btn-orange me-2">Register as Employer</a>
            <a href="login.jsp" class="btn btn-light border">Login / Register</a>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero">
        <h1>Join <span class="text-primary">ApnaJob.in</span> and explore<br> 
            a multitude of job opportunities waiting for you
        </h1>
        <p class="mt-3 text-muted">
            Find Free Jobs and Career Opportunities on ApnaJob.in – Your Path to a Skilled Workforce.<br>
            Effortless Hiring: Discover and Recruit Top Talent. Explore Job Opportunities Today!
        </p>

        <!-- Search Bar -->
        <form action="searchJobs.jsp" method="get" class="search-bar">
            <input type="text" name="query" placeholder="Job title, keywords" required>
            <button type="submit">Find Jobs</button>
        </form>

        <!-- Post Job Button -->
        <div class="mt-4">
            <a href="postJob.jsp" class="btn btn-orange">Post a Job</a>
        </div>
    </section>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
