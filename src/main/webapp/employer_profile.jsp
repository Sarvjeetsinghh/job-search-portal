<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*,jakarta.servlet.*" %>
<%
    HttpSession sessionObj = request.getSession(false);
    if (sessionObj == null || sessionObj.getAttribute("employerId") == null) {
        response.sendRedirect("employer_login.jsp?error=Please+login+first");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employer Dashboard - DreamNaukriCareer</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap" rel="stylesheet">
    <style>
        body {
            background-color: #f5f8fd;
            font-family: 'Poppins', sans-serif;
        }

        /* Navbar */
        .navbar {
            background: linear-gradient(135deg, #004080, #007bff);
        }
        .navbar-brand {
            font-weight: 600;
            font-size: 1.5rem;
        }

        /* Profile Card */
        .profile-card {
            max-width: 700px;
            margin: 30px auto;
            border-radius: 15px;
            background: #fff;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
            overflow: hidden;
        }
        .profile-header {
            background: linear-gradient(135deg, #004080, #007bff);
            color: white;
            padding: 30px 20px;
            text-align: center;
        }
        .profile-header i {
            font-size: 60px;
        }
        .profile-body {
            padding: 25px;
        }
        .info-item {
            margin-bottom: 15px;
            font-size: 16px;
        }
        .info-item i {
            color: #007bff;
            margin-right: 10px;
        }

        /* Logout Button */
        .btn-logout {
            background-color: #dc3545;
            color: white;
            border-radius: 25px;
        }
        .btn-logout:hover {
            background-color: #b02a37;
        }

        /* Post Job Form */
        .job-form {
            background: #fff;
            border-radius: 15px;
            padding: 30px;
            max-width: 800px;
            margin: 50px auto;
            box-shadow: 0 6px 15px rgba(0,0,0,0.1);
        }
        .job-form h4 {
            color: #003366;
            margin-bottom: 25px;
            font-weight: 600;
        }
        .footer {
            text-align: center;
            padding: 15px;
            background: #004080;
            color: white;
            margin-top: 50px;
        }
    </style>
</head>
<body>

<!-- ✅ Optional Header Include -->
<%@ include file="header.jsp" %>

<!-- ✅ Navigation Bar -->
<nav class="navbar navbar-expand-lg navbar-dark">
    <div class="container">
        <a class="navbar-brand" href="#">DreamNaukriCareer</a>
        <div class="d-flex">
            <a href="LogoutServlet" class="btn btn-logout"><i class="bi bi-box-arrow-right"></i> Logout</a>
        </div>
    </div>
</nav>

<!-- ✅ Employer Profile Card -->
<div class="profile-card mt-4">
    <div class="profile-header">
        <i class="bi bi-person-circle"></i>
        <h3 class="mt-2"><%= sessionObj.getAttribute("employerName") %></h3>
        <p class="mb-0">Employer Dashboard</p>
    </div>
    <div class="profile-body">
        <div class="info-item"><i class="bi bi-envelope"></i><b>Email:</b> <%= sessionObj.getAttribute("employerEmail") %></div>
        <div class="info-item"><i class="bi bi-telephone"></i><b>Contact:</b> <%= sessionObj.getAttribute("contact") %></div>
        <div class="info-item"><i class="bi bi-briefcase"></i><b>Designation:</b> <%= sessionObj.getAttribute("designation") %></div>
        <div class="info-item"><i class="bi bi-building"></i><b>Company:</b> <%= sessionObj.getAttribute("companyName") %></div>
    </div>
</div>

<!-- ✅ Job Posting Form -->
<div class="job-form">
    <h4><i class="bi bi-file-earmark-plus"></i> Post a New Job</h4>
    <form action="AddJobServlet" method="post">
        <div class="row g-3">
            <div class="col-md-6">
                <label class="form-label">Job Title</label>
                <input type="text" name="title" class="form-control" placeholder="e.g. Java Developer" required>
            </div>
            <div class="col-md-6">
                <label class="form-label">Category</label>
                <select name="category" class="form-select" required>
                    <option value="">-- Select Category --</option>
                    <option value="IT & Software">IT & Software</option>
                    <option value="Marketing">Marketing</option>
                    <option value="Finance">Finance</option>
                    <option value="Human Resources">Human Resources</option>
                    <option value="Design">Design</option>
                    <option value="Education">Education</option>
                </select>
            </div>
            <div class="col-12">
                <label class="form-label">Job Description</label>
                <textarea name="description" class="form-control" rows="4" placeholder="Write about job responsibilities..." required></textarea>
            </div>
            <div class="col-md-6">
                <label class="form-label">Salary (per month)</label>
                <input type="text" name="salary" class="form-control" placeholder="e.g. ₹30000 - ₹50000">
            </div>
            <div class="col-md-6">
                <label class="form-label">Location</label>
                <input type="text" name="location" class="form-control" placeholder="e.g. Pune, Maharashtra" required>
            </div>
        </div>
        <div class="text-center mt-4">
            <button type="submit" class="btn btn-primary px-5 py-2"><i class="bi bi-send"></i> Post Job</button>
        </div>
    </form>
</div>

<!-- ✅ Footer -->
<div class="footer">
    © 2025 DreamNaukriCareer | All Rights Reserved
</div>

</body>
</html>
