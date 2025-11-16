<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Error</title>
<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<style>
    body {
        background-color: #f8d7da;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        font-family: Arial, sans-serif;
    }
    .error-card {
        background-color: #fff;
        padding: 30px;
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        text-align: center;
        max-width: 400px;
    }
    .error-card h1 {
        color: #dc3545;
        font-size: 3rem;
    }
    .error-card p {
        color: #333;
        font-size: 1.2rem;
    }
</style>
</head>
<body>
    <div class="error-card">
        <h1>Oops!</h1>
        <p>Something went wrong. Please try again.</p>
        <a href="register.jsp" class="btn btn-danger mt-3">Go Back</a>
    </div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
