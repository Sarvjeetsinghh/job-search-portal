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

    // ***** YOUR LIVE CREDENTIALS *****
    private static final String MERCHANT_ID = "M224SQ5JEUXY3";
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e";
    private static final String SALT_INDEX = "1";

    // ***** LIVE API URL (IMPORTANT) *****
    private static final String API_URL = "https://api.phonepe.com/apis/hermes/pg/v1/pay";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {

            // Unique transaction ID
            String merchantTransactionId = UUID.randomUUID().toString().replace("-", "").substring(0, 20);

            // Amount from JSP
            String amount = request.getParameter("amount");
            int finalAmount = Integer.parseInt(amount) * 100;  // convert to paise

            // ********* IMPORTANT *********
            // LIVE CALLBACK: MUST BE PUBLIC DOMAIN, NOT LOCALHOST
            String redirectUrl = "https://www.iardo.in/paymentStatus"; 
            String callbackUrl  = "https://www.iardo.in/paymentStatus";

            // Request Body
            String jsonBody = "{"
                    + "\"merchantId\":\"" + MERCHANT_ID + "\","
                    + "\"merchantTransactionId\":\"" + merchantTransactionId + "\","
                    + "\"merchantUserId\":\"USER123\","
                    + "\"amount\":" + finalAmount + ","
                    + "\"redirectUrl\":\"" + redirectUrl + "\","
                    + "\"callbackUrl\":\"" + callbackUrl + "\","
                    + "\"paymentInstrument\":{"
                    + "\"type\":\"PAY_PAGE\"}"
                    + "}";

            // Base64 Encode
            String base64Body = Base64.getEncoder().encodeToString(jsonBody.getBytes());

            // Hashing
            String toSign = base64Body + "/pg/v1/pay" + SALT_KEY;
            String checksum = sha256(toSign) + "###" + SALT_INDEX;

            // Make HTTP Request
            URL url = new URL(API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/json");
            conn.setRequestProperty("X-VERIFY", checksum);
            conn.setDoOutput(true);

            // Final Payload
            String finalPayload = "{ \"request\": \"" + base64Body + "\" }";

            OutputStream os = conn.getOutputStream();
            os.write(finalPayload.getBytes());
            os.flush();
            os.close();

            // Get Response
            BufferedReader br = new BufferedReader(new InputStreamReader(
                    conn.getResponseCode() >= 400 ? conn.getErrorStream() : conn.getInputStream()
            ));

            StringBuilder output = new StringBuilder();
            String line;

            while ((line = br.readLine()) != null) {
                output.append(line);
            }
            br.close();

            System.out.println("PhonePe Response: " + output);

            // Parse JSON Response
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(output.toString());

            // Extract redirect URL
            String redirectPaymentUrl =
                    root.get("data").get("instrumentResponse").get("redirectInfo").get("url").asText();

            // Redirect user to PhonePe hosted page
            response.sendRedirect(redirectPaymentUrl);

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());
        }
    }

    private static String sha256(String str) throws Exception {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedhash = digest.digest(str.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : encodedhash) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}


