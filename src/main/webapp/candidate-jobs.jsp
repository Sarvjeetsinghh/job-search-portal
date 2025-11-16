<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*, com.iardo.model.Job" %>

<html>
<head>
    <title>Jobs for You</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container my-5">
    <h2 class="text-center mb-5 fw-bold text-primary">Jobs Matching Your Category</h2>
    <div class="row">
        <%
            List<Job> jobs = (List<Job>) request.getAttribute("jobs");
            if(jobs != null && !jobs.isEmpty()) {
                for(Job job : jobs) {
        %>
        <div class="col-md-4 mb-3">
            <div class="card p-3">
                <h5><%= job.getTitle() %></h5>
                <p><strong>Category:</strong> <%= job.getCategory() %></p>
                <p><strong>Location:</strong> <%= job.getLocation() %></p>
                <p><%= job.getDescription() %></p>
            </div>
        </div>
        <%      }
            } else { %>
        <p class="text-center">No jobs found in your category.</p>
        <% } %>
    </div>
</div>
</body>
</html>
