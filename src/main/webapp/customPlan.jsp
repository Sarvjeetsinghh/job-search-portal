<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Customize Your Plan</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
     body {
    background-color: #ffffff; /* main background white */
    font-family: 'Poppins', sans-serif;
}

.custom-form-section {
    max-width: 600px;
    margin: 80px auto;
    background: #ffffff;       /* white form */
    border-radius: 10px;
    padding: 40px 35px;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05); /* very light shadow */
    border: 1px solid #eee;
}
     

        .custom-form-section h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #005f73;
        }

        .form-label {
            font-weight: 600;
        }

        .btn-custom {
            background-color: #0288d1;
            color: white;
            width: 100%;
            font-weight: 600;
            border-radius: 10px;
            transition: 0.3s;
        }

        .btn-custom:hover {
            background-color: #0277bd;
        }
    </style>
</head>
<body>

<section class="custom-form-section">
    <h2>Customize Your Plan</h2>
    <form action="CustomPlanServlet" method="post">
        <div class="mb-3">
            <label class="form-label">Full Name</label>
            <input type="text" class="form-control" name="fullName" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Company Name</label>
            <input type="text" class="form-control" name="companyName" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Email</label>
            <input type="email" class="form-control" name="email" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Mobile Number</label>
            <input type="text" class="form-control" name="mobile" maxlength="10" required>
        </div>

        <button type="submit" class="btn btn-custom">Submit</button>
    </form>
</section>

</body>
</html>