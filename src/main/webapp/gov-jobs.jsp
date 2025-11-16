<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>DreamJob - Government Jobs & Blogs</title>
<link rel="icon" type="image/png"
    href="https://www.iardo.in/wp-content/uploads/2024/11/cropped-cropped-logo-scaled-2-75x25.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Google Fonts -->
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700&display=swap" rel="stylesheet">

<!-- Icons -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
body {
    font-family: 'Poppins', sans-serif;
    background: linear-gradient(135deg, #e0f7fa, #b3e5fc);
    color: #002b5c;
    overflow-x: hidden;
    margin-top: 100px; /* For fixed header */
}

/* Hero Section */
.hero {
    text-align: center;
    padding: 100px 20px 60px;
    background: linear-gradient(135deg, #81d4fa, #29b6f6);
    color: #fff;
    border-radius: 20px;
    margin-bottom: 40px;
}

.hero h1 {
    font-size: 3rem;
    font-weight: 700;
}

.hero p {
    font-size: 1.2rem;
    max-width: 700px;
    margin: 15px auto 0;
}

/* Job Cards */
.jobs-section .job-card {
    background: #fff;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.jobs-section .job-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.2);
}

.job-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.job-card .card-body h5 {
    color: #003366;
    font-weight: 600;
    margin-bottom: 10px;
}

.job-card .card-body p {
    color: #004b66;
    font-size: 0.95rem;
}

.job-card .btn {
    border-radius: 25px;
    font-weight: 500;
}

/* Blog Cards */
.blogs-section {
    background: #f0f8ff;
    padding: 60px 20px;
    border-radius: 20px;
}

.blog-card {
    border: none;
    border-radius: 20px;
    overflow: hidden;
    box-shadow: 0 8px 20px rgba(0,0,0,0.1);
    transition: transform 0.3s, box-shadow 0.3s;
}

.blog-card:hover {
    transform: translateY(-6px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.2);
}

.blog-card img {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.blog-card .card-body h5 {
    font-weight: 600;
    color: #003366;
}

.blog-card .card-body p {
    font-size: 0.95rem;
    color: #004b66;
}

/* Footer */
footer {
    background: linear-gradient(135deg, #002b3a, #004d66);
    color: #f0f0f0;
    text-align: center;
    padding: 30px 10px;
    font-size: 0.9rem;
    border-radius: 15px 15px 0 0;
}
</style>
</head>
<body>

<%@ include file="header.jsp" %>


<!-- Government Jobs Section -->
<section class="jobs-section container mb-5">
    <h2 class="text-center mb-5 fw-bold">Latest Government Jobs</h2>
    <div class="row g-4">
        <!-- Job 1 -->
        <div class="col-md-4">
            <div class="job-card">
                <img src="https://cdn.pixabay.com/photo/2016/11/19/14/00/job-1839191_960_720.jpg" alt="UPSC">
                <div class="card-body">
                    <h5>UPSC Civil Services Exam 2025</h5>
                    <p>Apply for India's top administrative roles. Last date: Dec 15, 2025</p>
                    <a href="#" class="btn btn-primary btn-sm">Apply Now</a>
                </div>
            </div>
        </div>
        <!-- Job 2 -->
        <div class="col-md-4">
            <div class="job-card">
                <img src="https://cdn.pixabay.com/photo/2018/01/18/08/56/exam-3083402_960_720.jpg" alt="SSC">
                <div class="card-body">
                    <h5>SSC CHSL 2025</h5>
                    <p>Staff Selection Commission invites applications for CHSL Exam. Last date: Jan 10, 2026</p>
                    <a href="#" class="btn btn-primary btn-sm">View Details</a>
                </div>
            </div>
        </div>
        <!-- Job 3 -->
        <div class="col-md-4">
            <div class="job-card">
                <img src="https://cdn.pixabay.com/photo/2016/11/29/09/08/railway-1867091_960_720.jpg" alt="Railway">
                <div class="card-body">
                    <h5>Indian Railways Recruitment 2025</h5>
                    <p>Various posts open for Engineers, Clerks & Technicians. Apply by Dec 28, 2025.</p>
                    <a href="#" class="btn btn-primary btn-sm">Apply Now</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Blogs Section -->
<section class="blogs-section container mb-5">
    <div class="text-center mb-5">
        <h2 class="fw-bold">Career Guidance & Blogs</h2>
        <p>Get the latest insights, tips, and updates from Dream Naukri experts.</p>
    </div>
    <div class="row g-4">
        <!-- Blog 1 -->
        <div class="col-md-4">
            <div class="card blog-card">
                <img src="https://cdn.pixabay.com/photo/2015/10/27/14/55/writing-1006379_960_720.jpg" alt="Resume Tips">
                <div class="card-body">
                    <h5>How to Build a Strong Resume for Government Jobs</h5>
                    <p>Learn expert-backed resume tips to increase your chances of selection.</p>
                    <a href="#" class="btn btn-outline-primary btn-sm">Read More</a>
                </div>
            </div>
        </div>
        <!-- Blog 2 -->
        <div class="col-md-4">
            <div class="card blog-card">
                <img src="https://cdn.pixabay.com/photo/2016/03/26/22/14/books-1281581_960_720.jpg" alt="Preparation">
                <div class="card-body">
                    <h5>Top 10 Preparation Strategies for SSC & UPSC</h5>
                    <p>Boost your preparation with these proven methods for success.</p>
                    <a href="#" class="btn btn-outline-primary btn-sm">Read More</a>
                </div>
            </div>
        </div>
        <!-- Blog 3 -->
        <div class="col-md-4">
            <div class="card blog-card">
                <img src="https://cdn.pixabay.com/photo/2017/03/30/14/41/job-2183369_960_720.jpg" alt="Interviews">
                <div class="card-body">
                    <h5>Interview Tips for Government Sector Jobs</h5>
                    <p>Learn how to crack government interviews confidently and effectively.</p>
                    <a href="#" class="btn btn-outline-primary btn-sm">Read More</a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer>
    <p>Copyright © 2025 Dream Naukri | Powered by IARDO E-commerce Enabler</p>
</footer>

</body>
</html>
