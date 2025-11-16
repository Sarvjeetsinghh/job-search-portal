<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*, com.iardo.model.Job,com.iardo.dao.CandidateDAO" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Available Jobs - Dream Naukri</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #e0f7fa, #b3e5fc);
            margin-top: 100px; /* For fixed header */
        }

        .job-card {
            background: #fff;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 20px;
            box-shadow: 0 6px 20px rgba(0, 123, 255, 0.15);
            transition: transform 0.3s;
        }

        .job-card:hover {
            transform: translateY(-5px);
        }

        .job-card h5 {
            font-weight: 700;
            color: #003366;
        }

        .job-card p {
            color: #555;
            font-size: 0.95rem;
        }

        .filter-select {
            max-width: 300px;
            margin: 20px auto;
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<section class="container my-5">
    <h2 class="text-center mb-4 fw-bold text-primary">Available Jobs by Category</h2>

    <!-- Category Filter -->
    <div class="text-center filter-select">
        <select id="categorySelect" class="form-select shadow-sm rounded-pill px-3 py-2">
            <option value="">-- Select Job Category --</option>
            <option value="IT">IT</option>
            <option value="Finance">Finance</option>
            <option value="Marketing">Marketing</option>
            <option value="HR">HR</option>
            <option value="Sales">Sales</option>
        </select>
    </div>

    <!-- Jobs Container -->
    <div id="jobsContainer" class="row justify-content-center text-center">
        <p class="text-muted">Select a category to see available jobs.</p>
    </div>
</section>

<script>
document.getElementById("categorySelect").addEventListener("change", function () {
    const category = this.value;
    const jobsContainer = document.getElementById("jobsContainer");

    if (!category) {
        jobsContainer.innerHTML = `<p class='text-muted'>Select a category to see available jobs.</p>`;
        return;
    }

    // Fetch jobs dynamically using servlet
    fetch(`AvailableJobsServlet?category=${category}`)
        .then(response => response.json())
        .then(data => {
            if (data.length === 0) {
                jobsContainer.innerHTML = `<p class='text-danger fw-bold'>🚫 No jobs available in ${category}</p>`;
            } else {
                jobsContainer.innerHTML = data.map(job => `
                    <div class="col-md-4 mb-4">
                        <div class="job-card">
                            <h5>${job.title}</h5>
                            <p><strong>Company:</strong> ${job.company}</p>
                            <p><strong>Location:</strong> ${job.location}</p>
                            <p><strong>Salary:</strong> ₹${job.salary}</p>
                            <a href="job-details.jsp?id=${job.id}" class="btn btn-outline-primary rounded-pill mt-2">View Details</a>
                        </div>
                    </div>
                `).join("");
            }
        })
        .catch(err => {
            console.error(err);
            jobsContainer.innerHTML = `<p class='text-danger'>Error loading jobs.</p>`;
        });
});
</script>

</body>
</html>
