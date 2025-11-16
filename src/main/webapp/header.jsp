
<style>

body {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	background: linear-gradient(135deg, #b3e5fc, #e0f7fa);
	color: #002b5c;
	overflow-x: hidden;
}

/* Navbar */
.navbar {
	padding: 10px 50px;
	background: transparent;
	align-items: center;
}

.navbar-brand img {
	width: 100px;
	height: 100px;
}

.btn-register {
	background-color: blue;
	color: white;
	font-weight: 600;
	border-radius: 25px;
	padding: 8px 20px;
	border: none;
	transition: 0.3s;
	cursor: pointer; /* optional but makes it look clickable */
}

.btn-register:hover {
	background-color: skyblue;
}


/* Navbar Links */
.custom-navbar {
	background: transparent;
	padding: 15px 0;
}

.custom-navbar a {
	text-decoration: none;
	color: #003366;
	font-weight: 500;
	font-size: 15px;
	padding: 8px 16px;
	border-radius: 8px;
	transition: all 0.3s ease;
}

.custom-navbar a:hover {
	background: linear-gradient(135deg, #b3e5fc, #81d4fa);
	color: #001F3F;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

.custom-navbar a.active {
	background: linear-gradient(135deg, #81d4fa, #29b6f6);
	color: #fff;
	font-weight: 600;
}




<%--------------- --%>

/* ===== HEADER / NAVBAR IMPROVED ===== */
.main-header {
    background: linear-gradient(135deg, #b3e5fc, #e0f7fa);
    position: relative;
    z-index: 100;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.08);
    
}

/* Logo */
.logo-img {
    width: 70px;
    height: auto;
    border-radius: 10px;
}

/* Bottom Nav Links wrapper */
.custom-navbar-wrapper {
    background: rgba(255, 255, 255, 0.85);
    backdrop-filter: blur(6px);
    border-top: 1px solid rgba(0, 0, 0, 0.05);
}

/* Slight hover highlight for entire header section */
.main-header:hover {
    box-shadow: 0 4px 18px rgba(0, 0, 0, 0.15);
}


.heading-link {
text-decoration: none;
}


</style>


<!-- Header / Navbar -->
<header class="main-header shadow-sm">
    <nav class="navbar navbar-expand-lg px-4 py-3">
        <div class="container-fluid d-flex align-items-center justify-content-between flex-wrap">

            <!-- Logo & Title -->
            <div class="d-flex align-items-center gap-3">
                <a class="navbar-brand fw-bold fs-4" href="home.jsp">
                    <img src="WhatsApp_Image_2025-11-04_at_20.31.46_58eea606-removebg-preview.png"
                        alt="DreamJob Logo" class="logo-img">
                </a>
                <h1 class="m-0">
                    <a href="home.jsp" class="heading-link">Dream Naukri</a>
                </h1>
            </div>

            <!-- Right Buttons -->
            <div class="d-flex align-items-center gap-3 flex-wrap ">
                <a href="register.jsp" class="btn-register" style="text-decoration: none">Register as Candidate</a>
                <a href="employer-register.jsp" class="btn-register" style="text-decoration: none">Register as Employer</a>
                <a href="login.jsp" class="btn-register" style="text-decoration: none">Login / Register</a>
            </div>
        </div>
    </nav>

    <!-- Navbar Links -->
    <div class="custom-navbar-wrapper py-2">
        <div class="container text-center">
            <div class="d-flex justify-content-center flex-wrap gap-3 custom-navbar">
                <a href="home.jsp" class="active">Home</a>
                <a href="gov-jobs.jsp">Gov Jobs & Blogs</a>
                <a href="AvailableJobs.jsp">Available Jobs</a>
                <a href="free-job-posting.jsp">Free Job Posting</a>
                <a href="candidates.jsp">Candidates</a>
                <a href="employers.jsp">Employers</a>
                <a href="job-profile.jsp">Job Profile</a>
                <a href="contact.jsp">Contact Us</a>
                <a href="about.jsp">About Us</a>
            </div>
        </div>
    </div>
</header>

</body>
</html>