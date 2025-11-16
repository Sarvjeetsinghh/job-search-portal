<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    HttpSession sessionObj = request.getSession(false);
    
    // 🔥 Session check - agar null hai to login page pe redirect
    if (sessionObj == null || !"employer".equals(sessionObj.getAttribute("userType"))) {
    response.sendRedirect("login.jsp?error=Please+login+as+employer");  // ✅ Fixed
    return;
}
    
    Integer employerId = (Integer) sessionObj.getAttribute("employerId");
    String employerName = (String) sessionObj.getAttribute("employerName");
%>

<!DOCTYPE html>
<html>
<head>
    <title>Post New Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card shadow">
                <div class="card-body">
                    <h3 class="card-title text-center mb-4">Post a New Job</h3>
                    
                    <form action="postJob" method="post">
                        
                        <div class="mb-3">
                            <label class="form-label">Job Title</label>
                            <input type="text" name="title" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Job Description</label>
                            <textarea name="description" class="form-control" rows="4" required></textarea>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Location</label>
                            <input type="text" name="location" class="form-control" required>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Category</label>
                            <select name="category" class="form-control" required>
                                <option value="">Select Category</option>
                                <option value="IT">IT</option>
                                <option value="Finance">Finance</option>
                                <option value="Marketing">Marketing</option>
                                <option value="Sales">Sales</option>
                                <option value="HR">HR</option>
                                <option value="Other">Other</option>
                            </select>
                        </div>
                        
                        <div class="mb-3">
                            <label class="form-label">Salary</label>
                            <input type="text" name="salary" class="form-control" placeholder="e.g., $50,000 - $70,000" required>
                        </div>
                        
                        <div class="d-grid gap-2">
                            <button type="submit" class="btn btn-primary btn-lg">Post Job</button>
                            <a href="employerDashboard" class="btn btn-secondary">Cancel</a>
                        </div>
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

</body>
</html>