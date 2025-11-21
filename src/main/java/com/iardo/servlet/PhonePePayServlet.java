package com.iardo.servlet;


import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.UUID;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/phonepePay")
public class PhonePePayServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // LIVE CREDENTIALS
    private static final String MERCHANT_ID = "M224SQ5JEUXY3";
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e";
    private static final String SALT_INDEX = "1";

    // CORRECT LIVE API URL
    private static final String API_URL = "https://api.phonepe.com/apis/hermes/pg/v1/pay";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // Generate unique transaction ID
            String merchantTransactionId = "TXN" + System.currentTimeMillis();

            // Get amount from form
            String amount = request.getParameter("amount");
            if (amount == null || amount.trim().isEmpty()) {
                response.getWriter().write("Amount is required");
                return;
            }
            
            int finalAmount = Integer.parseInt(amount) * 100; // Convert to paise

            // IMPORTANT: Use your actual domain
            String baseUrl = "https://www.dreamnaukricareer.com";
            String redirectUrl = baseUrl + "/paymentStatus?transactionId=" + merchantTransactionId;
            String callbackUrl = baseUrl + "/PhonePeCallbackServlet";

            // Create request payload
            String jsonBody = "{"
                    + "\"merchantId\":\"" + MERCHANT_ID + "\","
                    + "\"merchantTransactionId\":\"" + merchantTransactionId + "\","
                    + "\"merchantUserId\":\"MUID" + System.currentTimeMillis() + "\","
                    + "\"amount\":" + finalAmount + ","
                    + "\"redirectUrl\":\"" + redirectUrl + "\","
                    + "\"redirectMode\":\"REDIRECT\","
                    + "\"callbackUrl\":\"" + callbackUrl + "\","
                    + "\"paymentInstrument\":{"
                    + "\"type\":\"PAY_PAGE\""
                    + "}"
                    + "}";

            System.out.println("Request Payload: " + jsonBody);

            // Base64 encode
            String base64Body = Base64.getEncoder().encodeToString(jsonBody.getBytes());

            // Calculate checksum - CORRECTED
            String stringToHash = base64Body + "/pg/v1/pay" + SALT_KEY;
            String checksum = sha256(stringToHash) + "###" + SALT_INDEX;

            System.out.println("Checksum: " + checksum);

            // Make API call
            URL url = new URL(API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("X-VERIFY", checksum);
            conn.setDoOutput(true);

            // Send request
            String finalPayload = "{\"request\":\"" + base64Body + "\"}";
            
            try (OutputStream os = conn.getOutputStream()) {
                os.write(finalPayload.getBytes());
                os.flush();
            }

            // Read response
            int responseCode = conn.getResponseCode();
            System.out.println("Response Code: " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(
                responseCode >= 400 ? conn.getErrorStream() : conn.getInputStream()
            ));

            StringBuilder output = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                output.append(line);
            }
            br.close();

            String apiResponse = output.toString();
            System.out.println("PhonePe API Response: " + apiResponse);

            // Parse response
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(apiResponse);

            // Check if request was successful
            if (root.has("success") && root.get("success").asBoolean()) {
                String redirectPaymentUrl = root.get("data")
                    .get("instrumentResponse")
                    .get("redirectInfo")
                    .get("url").asText();

                System.out.println("Redirecting to: " + redirectPaymentUrl);
                response.sendRedirect(redirectPaymentUrl);
            } else {
                String errorMsg = root.has("message") ? root.get("message").asText() : "Payment initiation failed";
                response.setContentType("text/html");
                response.getWriter().println("<h3>Error: " + errorMsg + "</h3>");
                response.getWriter().println("<pre>" + apiResponse + "</pre>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            response.getWriter().println("<h3>Error occurred</h3>");
            response.getWriter().println("<p>" + e.getMessage() + "</p>");
        }
    }

    private static String sha256(String input) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hash = digest.digest(input.getBytes("UTF-8"));
        StringBuilder hexString = new StringBuilder();
        for (byte b : hash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) hexString.append('0');
            hexString.append(hex);
        }
        return hexString.toString();
    }
}