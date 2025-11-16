<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>DreamJob - Find Jobs & Career Opportunities</title>
<link rel="icon" type="image/png"
	href="https://www.iardo.in/wp-content/uploads/2024/11/cropped-cropped-logo-scaled-2-75x25.jpg" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap"
	rel="stylesheet">
	
	<!-- Bootstrap Icons CDN -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>

/* Global */
body {
	font-family: 'Poppins', sans-serif;
	margin: 0;
	background: linear-gradient(135deg, #b3e5fc, #e0f7fa);
	color: #002b5c;
	overflow-x: hidden;
}


<%-- text decoration none  --%>


<%-- text decoration none  --%>




/* Hero Section */
.hero {
	text-align: center;
	margin: 80px auto 40px;
	max-width: 900px;
}

.hero h1 {
	font-size: 2.5rem;
	font-weight: 700;
	color: #003366;
}

.hero p {
	color: #002b5c;
	font-size: 1.1rem;
	margin-top: 10px;
	line-height: 1.6;
}


/* Search Bar */
.search-section {
	background: #fff;
	border-radius: 50px;
	padding: 10px 20px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
	max-width: 900px;
	margin: 40px auto;
}

.search-section input {
	border: none;
	outline: none;
	width: 100%;
	font-size: 16px;
}

.search-section button {
	border: none;
	background: blue;
	color: #fff;
	font-weight: 600;
	border-radius: 30px;
	padding: 10px 30px;
	transition: 0.3s;
}

/* Post Job */
.post-btn {
	background-color: blue;
	color: #fff;
	border: none;
	border-radius: 50px;
	padding: 10px 25px;
	font-weight: 600;
	margin-top: 15px;
	transition: 0.3s;
}


/*        Brandambsder css              */

/* css- styling */
/* HERO SECTION */


.hero-section {
    display: flex;
    align-items: center;
    justify-content: space-between;   /* login box ko bilkul right push */
    padding: 20px 60px;
    margin-top: 0;
    gap: 40px;
    width: 100%;
}


/* LEFT IMAGE */
.hero-image img {
    width: 460px;       /* same large size restored */
    height: auto; 
    object-fit: contain;
    border-radius: 10px;
    flex-shrink: 0;     /* IMPORTANT: image ko chhota hone se roke */
}



/* RIGHT SIDE WRAPPER (text + login ko horizontal line me rakhna) */
.hero-right {
    display: flex;
    align-items: flex-start;
    justify-content: space-between;
    width: 100%;                      /* full width so login goes to right */
    gap: 50px;
}


/* TEXT BOX */
.text-box {
    max-width: 430px;
    min-height: 260px;   /* 🔥 vertical height fixed */
    display: flex;
    flex-direction: column;
    justify-content: space-between;  /* content ko evenly spread karega */
}


/* Heading bigger + 2 lines */
.text-box h1 {
    font-size: 2.3rem;
    line-height: 1.3;
    margin: 0 0 10px 0;
}


/* Paragraph 4-line look */
.text-box p {
    font-size: 1.15rem;
    line-height: 1.7;   /* vertical space increase */
}




/* LOGIN BOX (bada + right aligned) */
.login-box {
    width: 330px;
    background: #ffffff;
    padding: 28px;
    border-radius: 12px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.15);
    margin-left: auto;                /* pushes login box to right end */
}

.login-box input {
    width: 100%;
    padding: 12px;
    margin: 10px 0;
}

.login-box button {
    width: 100%;
    padding: 12px;
    background: #0288d1;
    border: none;
    color: #fff;
    border-radius: 6px;
    cursor: pointer;
    font-size: 16px;
    font-weight: 600;
}


/* RESPONSIVE */
@media(max-width: 992px) {
    .hero-section {
        flex-direction: column;
        padding: 30px 20px;
    }

    .hero-right {
        flex-direction: column;
        gap: 20px;
    }

    .login-box {
        margin: 0 auto;
    }

    .hero-image img {
        width: 300px;
    }
}





/* ===== FOOTER STYLES ===== */
.footer {
background:  #00CED1;
;
  color: white;
  padding: 60px 0 0;
  font-family: 'Poppins', sans-serif;
}




/* Footer Container */
.footer-container {
  max-width: 1200px;
  margin: auto;
  display: flex;
  justify-content: space-between;
  align-items: flex-start;
  flex-wrap: wrap;
  gap: 40px;
  padding: 0 30px 40px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.2);
   color: white;
}

/* Logo */
.footer-logo-col {
  flex: 1 1 200px;
  min-width: 180px;
}
.footer-logo {
  width: 140px;
  border-radius: 8px;
  display: block;
}

/* Right-side Columns */
.footer-links {
  flex: 3;
  display: flex;
  justify-content: flex-start;
  flex-wrap: wrap;
  gap: 30px;
  list-style: none;
  padding:0;
  margin:0;
  
}

.footer-col {
  min-width: 180px;
}

/* Headings */
.footer-col h4 {
  font-size: 18px;
  color: #ffffff;
  margin-bottom: 20px;
  text-transform: uppercase;
  letter-spacing: 0.5px;
  position: relative;
}

/* 🔸 Remove Underline */
.footer-col h4::after {
  display: none;
}

/* Lists */
.footer-col {
  text-align: left; /* headings aur list left align */
}

.footer-col ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.footer-col ul li {
  margin: 8px 0; /* spacing between links */
}

.footer-col ul li a {
 color: #b8d2d9;
 
  text-decoration: none;
  font-size: 15px;
  transition: 0.3s;
  display: inline-block; /* hover padding work kare */
}

.footer-col ul li a:hover {
  color: #00bcd4;
  padding-left: 5px; /* hover me thoda shift */
}


/* Social Icons */
.social-links {
  display: flex;
  justify-content: flex-start;  /* same left alignment as text */
  gap: 30px;                    /* icons ke beech gap */
  margin-top: 100px;             /* resources ke niche space */
            /* thoda bottom me push */
}

.social-links a {
  display: inline-flex;
  justify-content: center;
  align-items: center;
  background: #00bcd4;
  color: #fff;
  width: 36px;
  height: 36px;
  border-radius: 50%;
  transition: 0.3s;
}

.social-links a:hover {
  background: #0097a7;
  transform: scale(1.1);
}




/* Footer Bottom Bar */
.footer-bottom {
  display: flex;
  justify-content: space-between;
  align-items: center;
  flex-wrap: wrap;
  text-align: center;
  border-top: 1px solid rgba(255, 255, 255, 0.2);
  padding: 20px 40px;
  background: linear-gradient(135deg, #001d28, #00394a);
  font-size: 14px;
  color: #a8c5ca;
}
.footer-bottom .left {
  margin: 0;
}
.footer-bottom .right a {
  color: #a8c5ca;
  text-decoration: none;
  margin: 0 5px;
}
.footer-bottom .right a:hover {
  color: #00bcd4;
}



/* Responsive */
@media (max-width: 768px) {
  .footer-container {
    flex-direction: column;
    align-items: center;
    text-align: center;
  }
  .footer-links {
    flex-direction: column;
    align-items: center;
  }
  
  .footer-bottom {
    flex-direction: column;
    gap: 10px;
  }
}











<%--three textimg css --%>

.text-gradient {
  background: linear-gradient(90deg, #004d73, #007bff);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}

.section-title {
  color: #004d73;
  position: relative;
}
.section-title::after {
  content: "";
  display: block;
  width: 80px;
  height: 3px;
  background: linear-gradient(90deg, #ff4b2b, #ff416c);
  margin-top: 8px;
  border-radius: 5px;
}

/* ===== CATEGORY CARD ===== */
.category-card {
  background: white;
  border-radius: 10px;
  padding: 15px;
  width: 180px;
  text-align: center;
  transition: all 0.3s ease-in-out;
  cursor: pointer;
  border: 2px solid transparent;
  box-shadow: 0 2px 10px rgba(0,0,0,0.05);
}
.category-card i {
  font-size: 2.5rem;
  color: #007bff;
  transition: all 0.3s ease-in-out;
}
.category-card h5 {
  font-weight: 600;
  color: #003366;
  margin-top: 10px;
}
.category-card p {
  color: #777;
  font-size: 0.9rem;
}
.category-card:hover {
  transform: translateY(-8px);
  border-color: #007bff;
  box-shadow: 0 8px 25px rgba(0, 123, 255, 0.25);
}
.category-card:hover i {
  color: #0056b3;
  text-shadow: 0 0 8px rgba(0, 123, 255, 0.6);
}

/* ===== Transparent Image Style ===== */
.img-transparent {
  max-width: 100%;
  border: none;
  border-radius: 0;
  background: transparent;
  box-shadow: none;
  transition: transform 0.3s ease-in-out;
}

.img-transparent:hover {
  transform: scale(1.03);
}


<%-- featured-jobs --%>

</style>
</head>

<body>

<%@ include file="header.jsp" %>

<%@ include file="payment.jsp" %>



<div class="hero-section">

    <!-- LEFT SIDE IMAGE -->
    <div class="hero-image">
        <img src="WhatsApp_Image_2025-11-14_at_15.28.22_c279ad63-removebg-preview.png">
    </div>

    <!-- RIGHT SIDE TEXT + LOGIN BOX -->
    <div class="hero-right">

        <!-- TEXT -->
    <div class="text-box">
  <h1>Dream Naukri: Filling gaps in Hiring and Being Hired</h1>

<p>
    Just like Piyush Chawla's ball finds a way to knockout 🎯
    Apply for jobs with <b>Dream Naukri</b> and enjoy the music of success...
    We are working for your <b>Dreams!</b> 💫
</p>
  
</div>
    

        <!-- LOGIN BOX -->
        <div class="login-box">
            <h3>Login / Sign Up</h3>
            <form>
                <input type="text" placeholder="Enter Username">
                <input type="password" placeholder="Enter Password">
                <button>Login</button>
            </form>
            <p style="text-align:center; margin-top:10px;">
                <a href="#">Forgot Password?</a><br>
                New user? <a href="#" style="font-weight:600;">Sign Up</a>
            </p>
        </div>

    </div>

</div>



	<!-- Hero Section -->
	<div class="hero container">
		<h1>Join Dream Naukri Where Career Aspirations Meet Opportunity</h1>
		<p>Unlock your potential, achieve your dreams with Dream Naukri
			connecting talent with tomorrow's leaders. Elevate your career
			journey with Dream Naukri - The Gateway to Professional Success.</p>
	</div>

	<!-- Search Section -->
	<div class="search-section">
		<input type="text" placeholder="Job title, keywords...">
		<button class="clr">Find Jobs</button>
	</div>

	<!-- Post Job -->
	<div class="text-center">
		<a href="${pageContext.request.contextPath}/login.jsp" class="post-btn text-decoration-none d-inline-block">Post a Job</a>
	</div>


<%@ include file="jobPlan.jsp" %>
	
	
	
<%--------------add more --------------- --%>

<!-- ====== POPULAR JOB CATEGORIES ====== -->
<section class="container my-5">
  <h3 class="text-center fw-bold mb-5 display-6 text-gradient">🔥 Popular Job Categories</h3>
  <div class="d-flex flex-wrap justify-content-center gap-4">
    <div class="category-card">
      <i class="bi bi-briefcase-fill"></i>
      <h5>Sales / Marketing</h5>
      <p>(152 open positions)</p>
    </div>
    <div class="category-card">
      <i class="bi bi-laptop-fill"></i>
      <h5>Developer / Technology / IT</h5>
      <p>(120 open positions)</p>
    </div>
    <div class="category-card">
      <i class="bi bi-bank"></i>
      <h5>Finance / Banking</h5>
      <p>(80 open positions)</p>
    </div>
    <div class="category-card">
      <i class="bi bi-headset"></i>
      <h5>Customer Service / Support</h5>
      <p>(70 open positions)</p>
    </div>
    <div class="category-card">
      <i class="bi bi-person-workspace"></i>
      <h5>Healthcare / Medical</h5>
      <p>(45 open positions)</p>
    </div>
    <div class="category-card">
      <i class="bi bi-cup-hot-fill"></i>
      <h5>Hospitality / Tourism / Culinary Arts</h5>
      <p>(35 open positions)</p>
    </div>
  </div>
</section>

<!-- ====== SEARCH JOBS ====== -->
<section class="container my-5 d-flex flex-wrap align-items-center justify-content-between gap-5">
  <div class="col-md-6">
    <h2 class="fw-bold section-title">Search Hundreds of Jobs Near You 🔍</h2>
    <p>Explore a world of career opportunities with top companies hiring daily. Gain insights into job roles, salary trends, and tailor-made openings that match your goals.</p>
    <ul>
      <li>Instantly matched job openings based on your skills.</li>
      <li>Verified employers offering top opportunities.</li>
      <li>Let <b>Dream Naukri</b> guide you to your next big step.</li>
    </ul>
<a href="register.jsp" class="btn btn-lg rounded-pill shadow" 
   style="background-color: #007bff; color: white;">
    🚀 Register Now as a Candidate
</a>
  </div>
  <div class="col-md-5 text-center">
    <img src="search-removebg-preview.png" alt="Search Jobs" class="img-fluid img-transparent">
  </div>
</section>

<!-- ====== MAXIMIZE PROFILE ====== -->
<section class="container my-5 d-flex flex-wrap align-items-center justify-content-between gap-5">
  <div class="col-md-5 text-center order-md-2">
    <img src="maximize-removebg-preview.png" alt="Profile Optimize" class="img-fluid img-transparent">
  </div>
  <div class="col-md-6 order-md-1">
    <h2 class="fw-bold section-title">Enhance the attractiveness of your profile and draw the attention of employers by meticulously completing it </h2>
    <p>Enhance your profile by achieving a minimum completion rate of 80%! Develop a concise resume that emphasizes your skills and pertinent achievements. Compose an engaging cover letter that demonstrates how your expertise aligns with the organization. Differentiate yourself from competitors with a striking profile that makes a memorable impact.</p>
    <div class="d-flex gap-3 mt-3">
      <a href="#" class="btn btn-primary rounded-pill px-4 shadow">Optimize Profile</a>
      <a href="#" class="btn btn-outline-primary rounded-pill px-4">Add Resume</a>
      <a herf="#" class="btn btn-outline-primary rounded-pill px-4">Resume Builder</a>
    </div>
  </div>
</section>

<!-- ====== APPLY DIRECTLY ====== -->
<section class="container my-5 d-flex flex-wrap align-items-center justify-content-between gap-5">
  <div class="col-md-6">
    <h2 class="fw-bold section-title">Submit Your Application Directly</h2>
    <p>A well-crafted resume ought to highlight your skills and feature concrete achievements pertinent to the position for which you are applying. Additionally, it is advisable to prepare a cover letter that is succinct and expands on how you can apply your abilities within the organization.</p>
<a href="#" class="btn btn-lg rounded-pill shadow mt-3" 
   style="background-color: #007bff; color: white;">
    ✨ Discover Dream Jobs
</a>  </div>
  <div class="col-md-5 text-center">
    <img src="applyjobs-removebg-preview.png" alt="Apply Jobs" class="img-fluid img-transparent">
  </div>
</section>


<%@ include file="featured-jobs.jsp" %>


	<!-- ===== Footer Section ===== -->
<footer class="footer">
  <div class="footer-container">

    <!-- Left: Company Logo -->
    <div class="footer-logo-col">
      <img src="WhatsApp_Image_2025-11-04_at_20.31.46_58eea606-removebg-preview.png" alt="IARDO Logo" class="footer-logo">
    </div>

    <!-- Right: Footer Links -->
    <div class="footer-links">

      <div class="footer-col">
        <h4>Product</h4>
        <ul>
          <li><a href="#">Job Posting</a></li>
          <li><a href="#">Contests</a></li>
          <li><a href="#">Database</a></li>
          <li><a href="#">Enterprise</a></li>
          <li><a href="#">Pricing</a></li>
        </ul>
      </div>

      <div class="footer-col">
        <h4>Get To Know Us</h4>
        <ul>
          <li><a href="#">Careers</a></li>
          <li><a href="#">Contact Support</a></li>
          <li><a href="#">Contact Sales</a></li>
          <li><a href="#">Job Seekers</a></li>
        </ul>
      </div>

      <div class="footer-col">
        <h4>Resources</h4>
        <ul>
          <li><a href="#">Help Center</a></li>
          <li><a href="#">Blogs</a></li>
        </ul>
      
        <div class="social-links">
          <a href="https://www.facebook.com/profile.php?id=61583433993061" target="_blank"><i class="bi bi-facebook"></i></a>
          <a href="https://www.instagram.com/dreamnaukricareer/?hl=en" target="_blank"><i class="bi bi-instagram"></i></a>
          <a href="https://www.linkedin.com/in/dreamnaukri-career-2ba264398/?skipRedirect=true" target="_blank"><i class="bi bi-linkedin"></i></a>
          <a href="https://x.com/dreamnaukri" target="_blank"><i class="bi bi-twitter"></i></a>
        </div>
      </div>

    </div>
  </div>

  <!-- Bottom Copyright Bar -->
  <div class="footer-bottom">
    <p class="left">© 2025 IARDO | All rights reserved.</p>
    <p class="right">
      <a href="privacy.jsp">Privacy Policy</a>| 
      <a href="terms.jsp">Terms & Conditions</a> | 
      <a href="TS.jsp">Terms of Service</a> | 
      <a href="Disclosur.jsp">Disclosure Policy</a>
    </p>
  </div>
</footer>

<%@ include file="chat-widget.jsp" %>



</body>
</html>
