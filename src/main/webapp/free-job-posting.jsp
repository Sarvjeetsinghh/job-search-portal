<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.*, jakarta.servlet.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Free Job Posting | DreamJob</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #f5f7fa, #c3cfe2);
            font-family: 'Poppins', sans-serif;
        }
        .post-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .btn-primary {
            background: #004aad;
            border: none;
            transition: 0.3s;
        }
        .btn-primary:hover {
            background: #00357a;
            transform: scale(1.03);
        }
        h2 {
            color: #004aad;
            font-weight: 600;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

    <!-- ====== Job Posting Form ====== -->
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-md-7">
                <div class="post-card">
                    <h2 class="text-center mb-4">🚀 Post a Free Job</h2>
                    <form action="FreeJobPostingServlet" method="post">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Job Title</label>
                            <input type="text" name="title" class="form-control" placeholder="Enter job title" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Company Name</label>
                            <input type="text" name="company" class="form-control" placeholder="Enter company name" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Job Location</label>
                            <input type="text" name="location" class="form-control" placeholder="e.g., Delhi, Bangalore" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Salary (₹)</label>
                            <input type="number" name="salary" class="form-control" placeholder="Enter salary" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Website / Apply Link</label>
                            <input type="url" name="website" class="form-control" placeholder="https://company.com/apply" required>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Job Description</label>
                            <textarea name="description" class="form-control" rows="4" placeholder="Describe the job role and requirements" required></textarea>
                        </div>
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary px-4 py-2 rounded-pill">
                                Post Job
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
