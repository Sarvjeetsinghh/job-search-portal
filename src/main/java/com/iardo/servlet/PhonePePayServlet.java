package com.iardo.servlet;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/PhonePePayServlet")
public class PhonePePayServlet extends HttpServlet {

    private static final String MERCHANT_ID = "M224SQ5JEUXY3";
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e";  
    private static final String SALT_INDEX = "1";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int amount = Integer.parseInt(request.getParameter("amount")) * 100;

        String transactionId = "TXN" + UUID.randomUUID();

        // 🔥 CORRECT JSON BODY
        Map<String, Object> payRequest = new HashMap<>();
        payRequest.put("merchantId", MERCHANT_ID);
        payRequest.put("merchantTransactionId", transactionId);
        payRequest.put("merchantUserId", "USER123");
        payRequest.put("amount", amount);

        payRequest.put("redirectUrl",
                "http://localhost:8080/job-search-portal/paymentStatus?transactionId=" + transactionId);

        payRequest.put("callbackUrl",
                "http://localhost:8080/job-search-portal/paymentStatus");

        payRequest.put("paymentInstrument", Map.of("type", "PAY_PAGE"));

        ObjectMapper mapper = new ObjectMapper();
        String json = mapper.writeValueAsString(payRequest);

        // 🔥 Base64 encode
        String base64Body = Base64.getEncoder().encodeToString(json.getBytes());

        // 🔥 Correct signature calculation
        String checksumData = base64Body + "/pg/v1/pay" + SALT_KEY;
        String checksum = sha256(checksumData) + "###" + SALT_INDEX;

        // 🔥 PhonePe PRE-PROD API
        URL url = new URL("https://api-preprod.phonepe.com/apis/hermes/pg/v1/pay");
        HttpURLConnection con = (HttpURLConnection) url.openConnection();

        con.setRequestMethod("POST");
        con.setRequestProperty("Content-Type", "application/json");
        con.setRequestProperty("X-VERIFY", checksum);
        con.setRequestProperty("X-MERCHANT-ID", MERCHANT_ID);
        con.setDoOutput(true);

        // Request body
        Map<String, String> body = Map.of("request", base64Body);
        OutputStream os = con.getOutputStream();
        os.write(mapper.writeValueAsBytes(body));

        // 🔥 Check for error first
        InputStream inputStream;
        if (con.getResponseCode() >= 400) {
            inputStream = con.getErrorStream(); // important!
        } else {
            inputStream = con.getInputStream();
        }

        BufferedReader br = new BufferedReader(new InputStreamReader(inputStream));
        StringBuilder resp = new StringBuilder();
        String line;
        while ((line = br.readLine()) != null) {
            resp.append(line);
        }

        System.out.println("PHONEPE RESPONSE = " + resp.toString());

        // 🔥 Extract redirect URL
        String redirectUrl = mapper.readTree(resp.toString())
                .get("data")
                .get("instrumentResponse")
                .get("redirectUrl")
                .asText();

        response.sendRedirect(redirectUrl);
    }

    private String sha256(String data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(data.getBytes());
            StringBuilder hex = new StringBuilder();
            for (byte b : hash) {
                hex.append(String.format("%02x", b));
            }
            return hex.toString();
        } catch (Exception e) {
            return null;
        }
    }
}

