<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Contact Us | DreamJob</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background: linear-gradient(135deg, #eef2f3, #8e9eab);
            font-family: 'Poppins', sans-serif;
        }
        .contact-container {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            padding: 40px 30px;
            margin-top: 60px;
        }
        .contact-title {
            color: #004aad;
            font-weight: 700;
            font-size: 2rem;
        }
        .form-control {
            border-radius: 10px;
            padding: 12px;
            box-shadow: none !important;
            border: 1px solid #ccc;
        }
        .form-control:focus {
            border-color: #004aad;
            box-shadow: 0 0 0 0.2rem rgba(0,74,173,0.25);
        }
        .btn-custom {
            background-color: #004aad;
            color: white;
            border-radius: 25px;
            padding: 10px 25px;
            transition: 0.3s;
        }
        .btn-custom:hover {
            background-color: #00357a;
            transform: scale(1.05);
        }
        .info-box {
            background: linear-gradient(135deg, #004aad, #0078d7);
            color: #fff;
            border-radius: 20px;
            padding: 30px;
            height: 100%;
        }
        .info-box i {
            font-size: 1.8rem;
            margin-bottom: 15px;
        }
        .social-icons a {
            color: #fff;
            font-size: 1.3rem;
            margin: 0 10px;
            transition: 0.3s;
        }
        .social-icons a:hover {
            color: #ffdf40;
        }
        .map-container {
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
            margin-top: 20px;
        }
        @media (max-width: 768px) {
            .info-box {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>

<%@ include file="header.jsp" %>

<div class="container">
    <div class="row align-items-center justify-content-center">

        <!-- Info Box -->
        <div class="col-lg-5 col-md-6 col-sm-12">
            <div class="info-box text-center">
                <i class="bi bi-envelope-paper-heart"></i>
                <h4>Get in Touch</h4>
                <p>We’d love to hear from you! Whether you have a question about jobs, employers, or features — our team is ready to answer all your queries.</p>
                <hr style="border-color: rgba(255,255,255,0.4);">
                <p><i class="bi bi-geo-alt-fill"></i> Our Location:</p>

                <!-- Map Embed -->
                <div class="map-container">
                  
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d224346.5400483485!2d77.04417366224577!3d28.527252739054862!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfd5b347eb62d%3A0x52c2b7494e204dce!2sNew%20Delhi%2C%20Delhi!5e0!3m2!1sen!2sin!4v1762863050274!5m2!1sen!2sin" width="400" height="300" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>

                <p class="mt-3"><i class="bi bi-telephone-fill"></i> ‪+91 98765 43210‬</p>
                <p><i class="bi bi-envelope-fill"></i> support@dreamjob.in</p>
                <div class="social-icons mt-3">
                    <a href="https://www.facebook.com/profile.php?id=61583433993061" target="_blank"><i class="bi bi-facebook"></i></a>
                    <a href="https://www.instagram.com/dreamnaukricareer/?hl=en" target="_blank"><i class="bi bi-instagram"></i></a>
                    <a href="https://www.linkedin.com/in/dreamnaukri-career-2ba264398/?skipRedirect=true" target="_blank"><i class="bi bi-linkedin"></i></a>
                    <a href="https://x.com/dreamnaukri" target="_blank"><i class="bi bi-twitter"></i></a>
                </div>
            </div>
        </div>

        <!-- Contact Form -->
        <div class="col-lg-6 col-md-6 col-sm-12">
            <div class="contact-container">
                <h2 class="contact-title mb-4 text-center">📬 Contact Us</h2>
                <form action="ContactServlet" method="post">
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Your Name</label>
                        <input type="text" name="name" class="form-control" placeholder="Enter your name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Email Address</label>
                        <input type="email" name="email" class="form-control" placeholder="Enter your email" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Subject</label>
                        <input type="text" name="subject" class="form-control" placeholder="Enter subject" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label fw-semibold">Message</label>
                        <textarea name="message" rows="4" class="form-control" placeholder="Write your message..." required></textarea>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-custom">Send Message</button>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>