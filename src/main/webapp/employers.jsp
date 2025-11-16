<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Employers - Dream Naukri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #b3e5fc);
            margin-top: 100px; /* So fixed header does not overlap */
        }

        .employer-card {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 6px 20px rgba(0, 123, 255, 0.15);
            transition: transform 0.3s;
        }

        .employer-card:hover {
            transform: translateY(-5px);
        }

        .employer-card h5 {
            font-weight: 700;
            color: #003366;
        }

        .employer-card p {
            color: #555;
            font-size: 0.95rem;
        }

        .employer-card a.btn {
            border-radius: 25px;
            padding: 8px 20px;
            font-weight: 600;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>


<section class="container my-5">
    <h2 class="text-center mb-5 fw-bold text-primary">Registered Employers</h2>

    <div class="row justify-content-center">
        <!-- Example employer card -->
        <div class="col-md-4">
            <div class="employer-card text-center">
                <h5>ABC Tech Solutions</h5>
                <p><strong>Email:</strong> hr@abctech.com</p>
                <p><strong>Phone:</strong> +91 9876543210</p>
                <p><strong>Location:</strong> Mumbai, India</p>
                <a href="#" class="btn btn-primary mt-2">View Jobs</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="employer-card text-center">
                <h5>XYZ Innovations</h5>
                <p><strong>Email:</strong> careers@xyzinnovations.com</p>
                <p><strong>Phone:</strong> +91 9123456780</p>
                <p><strong>Location:</strong> Bangalore, India</p>
                <a href="#" class="btn btn-primary mt-2">View Jobs</a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="employer-card text-center">
                <h5>Global Softwares</h5>
                <p><strong>Email:</strong> info@globalsoft.com</p>
                <p><strong>Phone:</strong> +91 9988776655</p>
                <p><strong>Location:</strong> Delhi, India</p>
                <a href="#" class="btn btn-primary mt-2">View Jobs</a>
            </div>
        </div>
    </div>
</section>

</body>
</html>
