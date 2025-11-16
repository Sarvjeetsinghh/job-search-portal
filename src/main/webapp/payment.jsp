<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PhonePe Home </title>
</head>
<body>

<form action="PhonePePayServlet" method="post">
    <input type="number" name="amount" placeholder="Enter Amount" required>
    <button type="submit">Pay Using PhonePe</button>
</form>


</body>
</html>



