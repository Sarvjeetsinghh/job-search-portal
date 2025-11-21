package com.iardo.servlet;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

@WebServlet("/paymentStatus")
public class PaymentStatusServlet extends HttpServlet {

    private static final String MERCHANT_ID = "M224SQ5JEUXY3";
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e";
    private static final String SALT_INDEX = "1";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String transactionId = request.getParameter("transactionId");

        if (transactionId == null || transactionId.trim().isEmpty()) {
            response.setContentType("text/html");
            response.getWriter().println("<h3>Transaction ID missing</h3>");
            return;
        }

        String apiPath = "/pg/v1/status/" + MERCHANT_ID + "/" + transactionId;
        String stringToHash = apiPath + SALT_KEY;
        String checksum = sha256(stringToHash) + "###" + SALT_INDEX;

        String urlStr = "https://api.phonepe.com/apis/hermes" + apiPath;

        try {
            URL url = new URL(urlStr);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("X-VERIFY", checksum);
            conn.setRequestProperty("X-MERCHANT-ID", MERCHANT_ID);

            BufferedReader br = new BufferedReader(new InputStreamReader(
                conn.getResponseCode() >= 400 ? conn.getErrorStream() : conn.getInputStream()
            ));

            StringBuilder result = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                result.append(line);
            }
            br.close();

            response.setContentType("text/html");
            response.getWriter().println("<h2>Payment Status</h2>");
            response.getWriter().println("<pre>" + result.toString() + "</pre>");

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private String sha256(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(input.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString();
        } catch (Exception e) {
            return null;
        }
    }
}