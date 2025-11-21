<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhonePe Payment</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f4f4;
        padding: 40px;
    }
    .container {
        max-width: 400px;
        margin: auto;
        background: #fff;
        padding: 25px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0,0,0,0.2);
    }
    input, button {
        width: 100%;
        padding: 12px;
        margin-top: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
    }
    button {
        background: #5a30f0;
        color: white;
        border: none;
        cursor: pointer;
        font-size: 16px;
    }
    button:hover {
        background: #4823c7;
    }
</style>

</head>
<body>

<div class="container">
    <h2 style="text-align:center;">Pay Using PhonePe</h2>

    <form action="${pageContext.request.contextPath}/phonepePay" method="post">

        <label>Enter Amount</label>
        <input type="number" name="amount" min="1" placeholder="Amount (₹)" required>

        <button type="submit">Pay Now</button>
    </form>
    
</div>

</body>
</html>
