<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>About Us | DreamJob</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #eef2f3, #dfe9f3);
            color: #333;
        }
        .about-header {
            background: linear-gradient(135deg, #004aad, #0078d7);
            color: white;
            padding: 80px 20px;
            text-align: center;
        }
        .about-header h1 {
            font-weight: 700;
            font-size: 2.8rem;
        }
        .about-section {
            padding: 60px 15px;
        }
        .about-section h2 {
            color: #004aad;
            font-weight: 600;
        }
        .feature-box {
            background: #fff;
            border-radius: 20px;
            padding: 30px;
            box-shadow: 0 8px 20px rgba(0,0,0,0.1);
            transition: all 0.3s ease;
        }
        .feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px rgba(0,0,0,0.15);
        }
        .feature-box i {
            color: #004aad;
            font-size: 2rem;
            margin-bottom: 15px;
        }
        .team-card {
            background: #fff;
            border-radius: 15px;
            padding: 25px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            transition: 0.3s;
        }
        .team-card:hover {
            transform: translateY(-5px);
        }
        .team-card img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 15px;
        }
        .team-card h5 {
            color: #004aad;
            font-weight: 600;
        }
    </style>
</head>
<body>


<%@ include file="header.jsp" %>



    <!-- ====== Who We Are Section ====== -->
    <section class="about-section container text-center">
        <div class="row justify-content-center mb-5">
            <div class="col-lg-8">
                <h2>Who We Are</h2>
                <p class="mt-3">
                    DreamJob is a next-generation job search platform built to connect job seekers with employers effortlessly.
                    Our mission is to make hiring faster, transparent, and more human. Whether you’re a fresh graduate or an experienced professional,
                    DreamJob is here to help you discover your next opportunity with ease.
                </p>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-md-4">
                <div class="feature-box h-100">
                    <i class="bi bi-people-fill"></i>
                    <h5>For Job Seekers</h5>
                    <p>Find jobs that truly match your passion and skillset with our intelligent recommendation system and curated listings.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box h-100">
                    <i class="bi bi-building-fill-gear"></i>
                    <h5>For Employers</h5>
                    <p>Post unlimited jobs for free, manage applications, and hire the best candidates — all from one easy-to-use dashboard.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box h-100">
                    <i class="bi bi-shield-check"></i>
                    <h5>Our Commitment</h5>
                    <p>We are committed to creating a trusted platform that values integrity, innovation, and inclusivity in recruitment.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- ====== Our Team Section ====== -->
    <section class="about-section bg-light">
        <div class="container text-center">
            <h2 class="mb-5">Meet Our Team</h2>
            <div class="row g-4 justify-content-center">
                <div class="col-md-3">
                    <div class="team-card">
                        <img src="https://randomuser.me/api/portraits/men/45.jpg" alt="Founder">
                        <h5>Vivek Singh</h5>
                        <p class="text-muted">Founder & Lead Developer</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="team-card">
                        <img src="https://randomuser.me/api/portraits/women/68.jpg" alt="Designer">
                        <h5>Priya Sharma</h5>
                        <p class="text-muted">UI/UX Designer</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="team-card">
                        <img src="https://randomuser.me/api/portraits/men/22.jpg" alt="Backend Dev">
                        <h5>Rohan Mehta</h5>
                        <p class="text-muted">Backend Engineer</p>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="team-card">
                        <img src="https://randomuser.me/api/portraits/women/24.jpg" alt="Marketing">
                        <h5>Neha Patel</h5>
                        <p class="text-muted">Marketing Head</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- ====== Mission Section ====== -->
    <section class="about-section text-center">
        <div class="container">
            <h2>Our Mission</h2>
            <p class="mt-3">
                Our goal is simple — to empower millions of people by bridging the gap between job seekers and employers.
                We believe that the right opportunity can change a life, and DreamJob is here to make that connection happen effortlessly.
            </p>
        </div>
    </section>

    <!-- ====== Footer Note ====== -->
    <footer class="text-center py-4 bg-dark text-white">
        <p class="mb-0">© 2025 DreamJob | Designed with ❤️ by Team DreamJob</p>
    </footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
