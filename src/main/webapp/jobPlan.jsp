<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Job Plans</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #f7faff;
            margin: 0;
            padding: 0;
        }

        .plans-section {
            text-align: center;
            padding: 60px 20px;
        }

        .plans-section h2 {
            font-size: 32px;
            color: #0b2545;
            margin-bottom: 10px;
        }

        .plans-section p {
            color: #555;
            margin-bottom: 40px;
        }

        .plan-container {
            display: flex;
            justify-content: center;
            gap: 25px;
            flex-wrap: wrap;
        }

        .plan-card {
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.08);
            width: 330px;
            padding: 25px;
            text-align: center;
            transition: all 0.3s ease;
        }

        .plan-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.12);
        }

        .plan-card h3 {
            font-size: 20px;
            color: #0b2545;
            margin-bottom: 10px;
        }

        .plan-card p {
            color: #555;
            margin-bottom: 20px;
        }

        .price {
            font-size: 26px;
            font-weight: 600;
            color: #000;
            margin-bottom: 10px;
        }

        .discount {
            color: green;
            font-weight: bold;
            font-size: 14px;
        }

        .old-price {
            text-decoration: line-through;
            color: #999;
            font-size: 14px;
            margin-left: 8px;
        }

        .buy-btn {
            display: inline-block;
            padding: 10px 25px;
            border: 2px solid #007bff;
            color: #007bff;
            border-radius: 8px;
            text-decoration: none;
            font-weight: 500;
            transition: 0.3s;
        }

        .buy-btn:hover {
            background-color: #007bff;
            color: #fff;
        }

       /* --- Responsive Plan Card Images --- */
.plan-card img {
    width: 100%;               /* Image fills the parent container */
    height: auto;              /* Keeps correct aspect ratio */
    max-width: 380px;          /* Optional max limit for large screens */
    display: block;
    margin: 0 auto 15px;       /* Center image and give bottom space */
    object-fit: cover;         /* Keeps proportions nicely cropped */
    border-radius: 10px;       /* Smooth edges */
    transition: transform 0.3s ease;
}

/* Add a subtle hover effect */
.plan-card img:hover {
    transform: scale(1.03);
}

/* Responsive adjustments */
@media (max-width: 992px) {
    .plan-card img {
        max-width: 90%;
    }
}

@media (max-width: 576px) {
    .plan-card img {
        max-width: 100%;
    }
}
       
    </style>
</head>
<body>
    <section class="plans-section">
        <h2>Job Plans</h2>
        <p>Choose the best plan for your hiring and job posting needs</p>

        <div class="plan-container">

            <!-- Job Posting Plan -->
            <div class="plan-card">
                <h3>Job Posting Plan</h3>
                <p>Choose number of job postings</p>
                <p><strong>1 Job Posting</strong> – ₹1,000 <span class="old-price">₹1,110</span> <span class="discount">10% OFF</span></p>
                <p>2 Job Postings – ₹1,800</p>
                <p>3 Job Postings – ₹2,400</p>
                <p>4 Job Postings – ₹2,800</p>
                <p>5 Job Postings – ₹3,000</p>
                <p>10 Job Postings – ₹5,000</p>
                <p class="price">₹1,000 / 1 month</p>
                <a href="JobPostingForm.jsp" class="buy-btn">Buy Now</a>
                
            </div>

            <!-- Comprehensive Plan -->
            <div class="plan-card">
                <h3>Comprehensive Plan</h3>
                <p>Candidate database access + Job postings + Outreach</p>
                <ul style="list-style:none; padding:0; margin-bottom:20px; color:#333;">
                    <li>✔ 1000 Profile Credits</li>
                    <li>✔ 5000 Outreach Credits</li>
                    <li>✔ 3 Job Postings</li>
                    <li>✔ 1 Login</li>
                </ul>
                <p class="price">₹8,000 / 15 days</p>
                <span class="discount">20% OFF</span><span class="old-price">₹10,000</span><br><br>
               <a href="JobPostingForm.jsp?plan=comprehensive" class="buy-btn">Buy Now</a>
               
                
            </div>

            <!-- Custom Plan -->
            <div class="plan-card custom-card">
                <img src = "Screenshot 2025-11-13 112002.png" alt="Custom Plan Image" >
                <h3>Custom Plan</h3>
                <p>Tailor your hiring needs with a flexible plan that works for you.</p>
                <a href="customPlan.jsp" class="buy-btn">Customize Your Plan</a>
            </div>

        </div>
    </section>
</body>
</html>