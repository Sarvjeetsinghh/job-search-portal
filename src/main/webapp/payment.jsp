<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhonePe Payment</title>
</head>
<body>

<h2>Pay Using PhonePe</h2>

<form action="${pageContext.request.contextPath}/phonepePay" method="post">
    <input type="number" name="amount" placeholder="Enter Amount" required>
    <button type="submit">Pay Now</button>
</form>

</body>
</html>