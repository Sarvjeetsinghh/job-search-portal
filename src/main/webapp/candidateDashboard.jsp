<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session == null || !"candidate".equals(session.getAttribute("userType"))) {
        response.sendRedirect("login.jsp?error=Please login first!");
        return;
    }
    String userEmail = (String) session.getAttribute("userEmail");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Candidate Dashboard - DreamJob</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f5f7fa;
            font-family: "Poppins", sans-serif;
        }

        /* Sidebar */
        .sidebar {
            position: fixed;
            top: 0;
            left: 0;
            height: 100%;
            width: 250px;
            background: #0d6efd;
            color: white;
            padding-top: 60px;
            transition: all 0.3s;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            display: block;
            padding: 15px 25px;
            font-size: 16px;
            transition: background 0.2s;
        }

        .sidebar a:hover {
            background: rgba(255, 255, 255, 0.2);
        }

        .sidebar .active {
            background: #0b5ed7;
        }

        /* Navbar */
        .navbar {
            background: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        /* Content */
        .main-content {
            margin-left: 250px;
            padding: 30px;
        }

        .card-job {
            border: none;
            border-radius: 15px;
            box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s;
        }

        .card-job:hover {
            transform: translateY(-5px);
        }

        .card-job .btn {
            border-radius: 20px;
        }

        /* Responsive sidebar */
        @media (max-width: 991px) {
            .sidebar {
                width: 100%;
                height: auto;
                position: relative;
            }
            .main-content {
                margin-left: 0;
            }
        }
    </style>
</head>
<body>



    <!-- ✅ Sidebar -->
    <div class="sidebar">
        <a href="#" class="active"><i class="bi bi-speedometer2 me-2"></i> Dashboard</a>
        <a href="searchJobs.jsp"><i class="bi bi-search me-2"></i> Search Jobs</a>
        <a href="myApplications.jsp"><i class="bi bi-briefcase me-2"></i> My Applications</a>
        <a href="candidateProfile.jsp"><i class="bi bi-person-circle me-2"></i> My Profile</a>
        <a href="notifications.jsp"><i class="bi bi-bell me-2"></i> Notifications</a>
        <a href="settings.jsp"><i class="bi bi-gear me-2"></i> Settings</a>
    </div>

    <!-- ✅ Main Content -->
    <div class="main-content">
        <div class="container-fluid">
            <h3 class="fw-bold text-primary mb-4">Welcome, Candidate 👋</h3>
            

            <!-- Suggested Jobs Section -->
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h5 class="fw-semibold">Recommended Jobs</h5>
                <a href="searchJobs.jsp" class="text-decoration-none text-primary">View All</a>
            </div>

            <div class="row g-4">
                <!-- Job Card 1 -->
                <div class="col-md-6 col-lg-4">
                    <div class="card card-job p-3">
                        <div class="d-flex justify-content-between">
                            <h5 class="fw-bold">Java Developer</h5>
                            <span class="badge bg-success">Full Time</span>
                        </div>
                        <p class="text-muted mb-1">TCS Pvt Ltd, Pune</p>
                        <p><i class="bi bi-geo-alt"></i> Pune, Maharashtra</p>
                        <p><i class="bi bi-currency-rupee"></i> 6 - 10 LPA</p>
                        <a href="#" class="btn btn-primary w-100 mt-2">Apply Now</a>
                    </div>
                </div>

                <!-- Job Card 2 -->
                <div class="col-md-6 col-lg-4">
                    <div class="card card-job p-3">
                        <div class="d-flex justify-content-between">
                            <h5 class="fw-bold">React Developer</h5>
                            <span class="badge bg-warning text-dark">Remote</span>
                        </div>
                        <p class="text-muted mb-1">Infosys, Bengaluru</p>
                        <p><i class="bi bi-geo-alt"></i> Remote / WFH</p>
                        <p><i class="bi bi-currency-rupee"></i> 8 - 12 LPA</p>
                        <a href="#" class="btn btn-primary w-100 mt-2">Apply Now</a>
                    </div>
                </div>

                <!-- Job Card 3 -->
                <div class="col-md-6 col-lg-4">
                    <div class="card card-job p-3">
                        <div class="d-flex justify-content-between">
                            <h5 class="fw-bold">Data Analyst</h5>
                            <span class="badge bg-info text-dark">Hybrid</span>
                        </div>
                        <p class="text-muted mb-1">Cognizant, Mumbai</p>
                        <p><i class="bi bi-geo-alt"></i> Mumbai, Maharashtra</p>
                        <p><i class="bi bi-currency-rupee"></i> 5 - 9 LPA</p>
                        <a href="#" class="btn btn-primary w-100 mt-2">Apply Now</a>
                    </div>
                </div>
            </div>

            <!-- My Applications Section -->
            <div class="mt-5">
                <h5 class="fw-semibold mb-3">My Recent Applications</h5>
                <div class="table-responsive shadow-sm">
                    <table class="table table-hover align-middle">
                        <thead class="table-primary">
                            <tr>
                                <th>Job Title</th>
                                <th>Company</th>
                                <th>Status</th>
                                <th>Date Applied</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Java Developer</td>
                                <td>TCS Pvt Ltd</td>
                                <td><span class="badge bg-warning text-dark">Under Review</span></td>
                                <td>2025-11-10</td>
                            </tr>
                            <tr>
                                <td>React Developer</td>
                                <td>Infosys</td>
                                <td><span class="badge bg-success">Selected</span></td>
                                <td>2025-11-06</td>
                            </tr>
                            <tr>
                                <td>Python Developer</td>
                                <td>Wipro</td>
                                <td><span class="badge bg-danger">Rejected</span></td>
                                <td>2025-11-02</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
