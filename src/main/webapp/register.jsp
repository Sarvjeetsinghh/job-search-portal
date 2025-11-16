<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Candidate Registration</title>
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet">
	<style>

/* Global */
body {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	background: linear-gradient(135deg, #b3e5fc, #e0f7fa);
	color: #002b5c;
	overflow-x: hidden;
}
</style>


</head>
<body>

<%@ include file="header.jsp" %>

	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card p-4 shadow-sm">
					<h3 class="text-center mb-4">Candidate Registration</h3>
					<form action="register" method="post">
						<div class="mb-3">
							<label for="name" class="form-label">Name:</label> <input
								type="text" class="form-control" id="name" name="name" required>
						</div>

						<div class="mb-3">
							<label for="email" class="form-label">Email:</label> <input
								type="email" class="form-control" id="email" name="email"
								required>
						</div>

						<div class="mb-3">
							<label for="password" class="form-label">Password:</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>

						<div class="mb-3">
							<label for="phone" class="form-label">Phone:</label> <input
								type="text" class="form-control" id="phone" name="phone">
						</div>

						<div class="mb-3">
							<label for="gender" class="form-label">Gender:</label> <select
								class="form-select" id="gender" name="gender">
								<option selected disabled>Select Gender</option>
								<option value="Male">Male</option>
								<option value="Female">Female</option>
								<option value="Other">Other</option>
							</select>
						</div>



						<div class="mb-3">
							<label for="category" class="form-label">Category:</label> <select
								class="form-select" id="category" name="category" required>
								<option selected disabled>Select Category</option>
								<option value="Sales / Marketing">Sales / Marketing</option>
								<option value="Developer / Technology / IT">Developer /
									Technology / IT</option>
								<option value="Finance / Banking">Finance / Banking</option>
								<option value="Customer Service / Support">Customer
									Service / Support</option>
								<option value="Healthcare / Medical">Healthcare /
									Medical</option>
								<option value="Hospitality / Tourism / Culinary Arts">Hospitality
									/ Tourism / Culinary Arts</option>
							</select>
						</div>


						<div class="d-grid">
							<button type="submit" class="btn btn-primary">Register</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
