<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.List, com.iardo.model.Job"%>
<%@ page import="jakarta.servlet.http.*"%>

<%@ page import="java.util.List, com.iardo.model.Job"%>

<%
HttpSession sessionObj = request.getSession(false);
if (sessionObj == null || !"employer".equals(sessionObj.getAttribute("userType"))) {
	response.sendRedirect("login.jsp?error=Please+login+first"); // ✅ Fixed
	return;
}

List<Job> jobs = (List<Job>) request.getAttribute("jobs"); // 🔥 FIXED
String employerName = (String) sessionObj.getAttribute("employerName");
%>



<html>
<head>
<title>Employer Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
</head>

<body class="bg-light">

<%@ include file="header.jsp" %>

	<div class="container mt-4">

		<h2 class="mb-3">
			Welcome,
			<%=employerName%></h2>

		<!-- ⭐ BUTTON: Post New Job -->
		<div class="d-flex justify-content-end mb-3">
			<a href="postJob.jsp" class="btn btn-primary btn-lg">Post New Job</a>
		</div>

		<h4>Your Job Posts</h4>

		<%
		if (jobs != null && !jobs.isEmpty()) {
			for (Job job : jobs) {
		%>
		<div class="card p-3 mb-3 shadow-sm">
			<h5><%=job.getTitle()%></h5>
			<p><%=job.getDescription()%></p>
			<small>Location: <%=job.getLocation()%></small><br> <small>Posted:
				<%=job.getPostedDate()%></small>
		</div>
		<%
		}
		} else {
		%>
		<p>No jobs posted yet.</p>
		<%
		}
		%>

	</div>

</body>
</html>
