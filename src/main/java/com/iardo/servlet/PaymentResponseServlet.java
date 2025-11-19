package com.iardo.servlet;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Scanner;

@WebServlet("/PaymentResponseServlet")
public class PaymentResponseServlet extends HttpServlet {

    private static final String MERCHANT_ID = "YOUR_MERCHANT_ID";
    private static final String MERCHANT_KEY = "YOUR_SECRET_KEY";
    private static final String BASE_URL = "https://sandbox.phonepe.com/v3/pg";

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {

        String orderId = request.getParameter("orderId");
        if (orderId == null) {
            response.getWriter().println("Order ID missing");
            return;
        }

        try {
            URL url = new URL(BASE_URL + "/status/" + orderId);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");

            int status = conn.getResponseCode();
            InputStream is = (status >= 200 && status < 300) ? conn.getInputStream() : conn.getErrorStream();

            Scanner scanner = new Scanner(is);
            StringBuilder sb = new StringBuilder();
            while (scanner.hasNext()) sb.append(scanner.nextLine());
            scanner.close();

            response.setContentType("text/html");
            response.getWriter().println("<h3>Payment Verification (Sandbox)</h3>");
            response.getWriter().println("<pre>" + sb.toString() + "</pre>");
            response.getWriter().println("<br><a href='JobPlans.jsp'>Back to Plans</a>");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }
}