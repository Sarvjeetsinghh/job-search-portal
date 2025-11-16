<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registration Successful</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #D6E4FF, #E6D6FF);
            font-family: 'Poppins', sans-serif;
        }
        .card {
            padding: 40px 50px;
            border-radius: 20px;
            background: #fff;
            box-shadow: 0 8px 30px rgba(0,0,0,0.1);
            text-align: center;
        }
        h2 {
            color: #4C3BCF;
            margin-bottom: 20px;
        }
        a {
            color: #6A5ACD;
            text-decoration: none;
            font-weight: 500;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="card">
    <h2>🎉 Employer Registered Successfully!</h2>
    <p>Your company is now part of our job portal.</p>
    <a href="login.jsp">Click here to login</a>
</div>
</body>
</html>
