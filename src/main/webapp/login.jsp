<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login - DreamJob</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 10px 40px rgba(0,0,0,0.2);
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-5">
                <div class="card login-card">
                    <div class="card-body p-5">
                        <h3 class="text-center text-primary mb-4">
                            <i class="bi bi-box-arrow-in-right"></i> Login to DreamJob
                        </h3>

                        <!-- ✅ Unified Login Form -->
                        <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                            
                            <div class="mb-3">
                                <label class="form-label fw-bold">I am a</label>
                                <select name="userType" class="form-select" required>
                                    <option value="">-- Select User Type --</option>
                                    <option value="candidate">Job Seeker / Candidate</option>
                                    <option value="employer">Employer / Recruiter</option>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Email Address</label>
                                <input type="email" name="email" class="form-control" 
                                       placeholder="Enter your email" required>
                            </div>

                            <div class="mb-3">
                                <label class="form-label fw-bold">Password</label>
                                <input type="password" name="password" class="form-control" 
                                       placeholder="Enter your password" required>
                            </div>

                            <div class="d-grid mb-3">
                                <button type="submit" class="btn btn-primary btn-lg">
                                    Login
                                </button>
                            </div>

                            <div class="text-center">
                                <small class="text-muted">
                                    Don't have an account? 
                                    <a href="${pageContext.request.contextPath}/register.jsp" class="text-decoration-none fw-bold">
                                        Register here
                                    </a>
                                </small>
                            </div>
                        </form>

                        <!-- ✅ Error Message -->
                        <% if (request.getParameter("error") != null) { %>
                            <div class="alert alert-danger mt-3 text-center" role="alert">
                                <i class="bi bi-exclamation-triangle-fill"></i>
                                <%= request.getParameter("error").replace("+", " ") %>
                            </div>
                        <% } %>

                        <!-- ✅ Success Message -->
                        <% if ("success".equals(request.getParameter("msg"))) { %>
                            <div class="alert alert-success mt-3 text-center" role="alert">
                                <i class="bi bi-check-circle-fill"></i>
                                Registration successful! Please login now.
                            </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</body>
</html>