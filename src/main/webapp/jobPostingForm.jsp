<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Job Posting Plan</title>
<style>
    body {
        font-family: "Poppins", sans-serif;
        margin: 0;
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        background-color: #fff;
    }

    .container {
        max-width: 700px;
        width: 100%;
        background: #ffffff;
        padding: 40px 30px;
        box-shadow: 0 0 15px rgba(0,0,0,0.1);
        border-radius: 12px;
    }

    h1 {
        font-size: 2rem;
        font-weight: 700;
        margin-bottom: 20px;
    }

    .radio-group {
        margin: 20px 0;
    }

    label {
        font-weight: 500;
        margin-right: 20px;
    }

    input[type="text"], input[type="email"], input[type="number"] {
        width: 100%;
        padding: 12px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 8px;
        font-size: 15px;
        transition: border-color 0.3s;
    }

    input:focus {
        border-color: skyblue;
        outline: none;
    }
button {
    margin-top: 20px;
    width: 100%;
    padding: 14px;
    background: #0288d1;       /* ✅ main blue color */
    color: white;
    font-size: 16px;
    border: none;
    border-radius: 8px;
    cursor: pointer;
    transition: 0.3s;
    font-weight: 600;
}

button:hover {
    background: #0277bd;       /* ✅ darker hover */
}
    
</style>

</head>
<body>

<%
String plan = request.getParameter("plan");
if(plan == null) {
    plan = "Job Posting Plan";
} else if(plan.equals("comprehensive")) {
    plan = "Comprehensive Plan";
} else if(plan.equals("custom")) {
    plan = "Custom Plan";
}
%>

<div class="container">
    <a href="jobPlan.jsp" style="color: #0288d1; text-decoration: none; font-weight: 600;">← Go back</a>
    
    <h1>Hiring made easy with<br><%= plan %> ⚡</h1>

    <div class="radio-group">
        <label><input type="radio" name="userType" checked> New user</label>
        <label><input type="radio" name="userType"> Existing user</label>
    </div>

    <form action="CustomPlanServlet" method="post">
    
        <label>Full Name *</label>
        <input type="text" name="fullname" required>

        <label>Company Name *</label>
        <input type="text" name="company" required>

        <label>Email ID *</label>
        <input type="email" name="email" required>

        <label>Mobile number *</label>
        <input type="number" name="mobile" required>

        <button type="submit">Continue</button>
    </form>
</div>

</body>
</html>