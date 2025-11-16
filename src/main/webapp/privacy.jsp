<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Privacy Policy - Dream Naukri</title>

<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">

<style>
body {
  font-family: 'Poppins', sans-serif;
  background: linear-gradient(135deg, #b3e5fc, #e0f7fa); /* same light sky-blue theme */
  color: #002b5c;
  margin: 0;
  padding: 0;
}

/* Main Container */
.policy-container {
  max-width: 900px;
  background: rgba(255, 255, 255, 0.9);
  margin: 60px auto;
  padding: 40px 50px;
  border-radius: 12px;
  box-shadow: 0 0 20px rgba(0,0,0,0.1);
  color: #003366;
  line-height: 1.8;
}

/* Headings */
.policy-container h1 {
  text-align: center;
  color: #003366;
  font-weight: 700;
  margin-bottom: 10px;
}

.policy-container h3 {
  color: #005f8c;
  margin-top: 30px;
  font-weight: 600;
}

.policy-container p, 
.policy-container li {
  font-size: 15px;
  color: #002b5c;
}

.policy-container ul {
  margin-left: 25px;
}

.back-home {
  text-align: center;
  margin-top: 40px;
}

.back-home a {
  background-color: #007bff;
  color: #fff;
  padding: 10px 25px;
  border-radius: 30px;
  text-decoration: none;
  transition: 0.3s;
}

.back-home a:hover {
  background-color: #005f8c;
}
</style>
</head>

<body>

<%@ include file="header.jsp" %>

<div class="policy-container">
  <h1>Privacy Policy - Dream Naukri</h1>
  <p><strong>Effective Date:</strong> 10 November 2025</p>

  <p>Dream Naukri ("we", "our", "us") is committed to protecting the privacy of users who visit our website and use our services. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit Dream Naukri.</p>

  <h3>1. Information We Collect</h3>
  <p>We may collect the following types of information:</p>
  <ul>
    <li><strong>Personal Information</strong></li>
    <ul>
      <li>Name</li>
      <li>Phone Number</li>
      <li>Email Address</li>
      <li>Resume / CV details</li>
      <li>Education and Work Experience</li>
    </ul>
    <li><strong>Non-Personal Information</strong></li>
    <ul>
      <li>Browser type</li>
      <li>IP address</li>
      <li>Device information</li>
      <li>Website usage data</li>
    </ul>
  </ul>

  <h3>2. How We Use Your Information</h3>
  <ul>
    <li>Creating your user account</li>
    <li>Job application and job matching services</li>
    <li>Sending job alerts, updates, and notifications</li>
    <li>Improving our website and services</li>
    <li>Customer support and communication</li>
  </ul>

  <h3>3. Sharing of Information</h3>
  <p>We DO NOT sell or share your personal information with third parties except:</p>
  <ul>
    <li>Employers or recruiters when you apply for a job</li>
    <li>Legal authorities if required by law</li>
    <li>Service providers helping us operate the website</li>
  </ul>

  <h3>4. Cookies</h3>
  <p>We use cookies to:</p>
  <ul>
    <li>Improve user experience</li>
    <li>Track website usage</li>
    <li>Personalize content</li>
  </ul>
  <p>You can disable cookies through your browser settings.</p>

  <h3>5. Data Security</h3>
  <p>We follow standard security practices to protect your data. However, no data transmission over the internet is 100% secure. We cannot guarantee complete security.</p>

  <h3>6. Third-Party Links</h3>
  <p>Our website may contain external links. We are not responsible for the privacy practices of those websites.</p>

  <h3>7. Children's Privacy</h3>
  <p>We do not knowingly collect personal information from individuals under the age of 13.</p>

  <h3>8. Changes to This Policy</h3>
  <p>We may update this Privacy Policy from time to time. Any changes will be posted on this page.</p>

  <h3>9. Contact Us</h3>
  <p>If you have questions about this Privacy Policy, you can contact us at:</p>
  <p><strong>Email:</strong> dreamnaukricareer@gmail.com<br>
     <strong>Phone:</strong> +91 8929180307</p>

  <p>Thank you for trusting Dream Naukri.</p>

  <div class="back-home">
    <a href="home.jsp">← Back to Home</a>
  </div>
</div>

</body>
</html>