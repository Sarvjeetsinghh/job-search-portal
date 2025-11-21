<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhonePe Payment</title>

<style>
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }
    
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    
    .container {
        max-width: 450px;
        width: 100%;
        background: white;
        padding: 40px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.3);
    }
    
    h2 {
        text-align: center;
        color: #333;
        margin-bottom: 30px;
        font-size: 28px;
    }
    
    .phonepe-logo {
        text-align: center;
        margin-bottom: 20px;
    }
    
    .phonepe-logo img {
        height: 50px;
    }
    
    label {
        display: block;
        color: #555;
        font-weight: 600;
        margin-bottom: 8px;
        font-size: 14px;
    }
    
    input {
        width: 100%;
        padding: 15px;
        border: 2px solid #e0e0e0;
        border-radius: 10px;
        font-size: 16px;
        transition: all 0.3s;
        margin-bottom: 20px;
    }
    
    input:focus {
        outline: none;
        border-color: #5a30f0;
        box-shadow: 0 0 0 3px rgba(90, 48, 240, 0.1);
    }
    
    button {
        width: 100%;
        padding: 15px;
        background: linear-gradient(135deg, #5a30f0 0%, #4823c7 100%);
        color: white;
        border: none;
        border-radius: 10px;
        font-size: 18px;
        font-weight: 600;
        cursor: pointer;
        transition: transform 0.2s, box-shadow 0.2s;
    }
    
    button:hover {
        transform: translateY(-2px);
        box-shadow: 0 10px 25px rgba(90, 48, 240, 0.4);
    }
    
    button:active {
        transform: translateY(0);
    }
    
    .info {
        text-align: center;
        color: #777;
        font-size: 12px;
        margin-top: 20px;
    }
    
    .error {
        background: #fee;
        color: #c33;
        padding: 10px;
        border-radius: 5px;
        margin-bottom: 15px;
        display: none;
    }
</style>

</head>
<body>

<div class="container">
    <div class="phonepe-logo">
        <svg height="50" viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
            <path d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z" fill="#5f259f"/>
            <path d="M256 48c114.9 0 208 93.1 208 208s-93.1 208-208 208S48 370.9 48 256 141.1 48 256 48z" fill="#fff"/>
            <path d="M256 88c-92.8 0-168 75.2-168 168s75.2 168 168 168 168-75.2 168-168S348.8 88 256 88z" fill="#5f259f"/>
        </svg>
    </div>
    
    <h2>Pay Using PhonePe</h2>
    
    <div class="error" id="errorMsg"></div>
    
    <form action="phonepePay" method="post" onsubmit="return validateForm()">
        <label>Enter Amount (₹)</label>
        <input type="number" 
               name="amount" 
               id="amount"
               min="1" 
               max="100000"
               placeholder="Enter amount in rupees" 
               required>
        
        <button type="submit">Pay Now</button>
    </form>
    
    <div class="info">
        Secure payment powered by PhonePe
    </div>
</div>

<script>
function validateForm() {
    var amount = document.getElementById('amount').value;
    var errorMsg = document.getElementById('errorMsg');
    
    if (amount < 1) {
        errorMsg.textContent = 'Amount must be at least ₹1';
        errorMsg.style.display = 'block';
        return false;
    }
    
    if (amount > 100000) {
        errorMsg.textContent = 'Amount cannot exceed ₹1,00,000';
        errorMsg.style.display = 'block';
        return false;
    }
    
    errorMsg.style.display = 'none';
    return true;
}
</script>

</body>
</html>