package com.iardo.servlet;


import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;



@WebServlet("/PhonePePayServlet")
public class PhonePePayServlet extends HttpServlet {

    // ********** YOUR CREDENTIALS **********
    private static final String MERCHANT_ID = "UATM224SQ5JEUXY3"; 
    private static final String SALT_KEY = "b26a13c1-4e1e-4849-9a3c-a1373613278c";
    private static final String SALT_INDEX = "1";

    // ********** ALWAYS SANDBOX FOR UATM **********
    private static final String BASE_URL = "https://api-preprod.phonepe.com/apis/pg-sandbox";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        try {
            String amountStr = request.getParameter("amount");
            if (amountStr == null || amountStr.isEmpty()) {
                out.println("Amount missing!");
                return;
            }

            int amount = Integer.parseInt(amountStr) * 100; // in paise

            // safe 38-char merchant transaction id
            String merchantTxnId = ("TXN" + UUID.randomUUID().toString().replace("-", "")).substring(0, 25);

            // Request Body
            Map<String, Object> payRequest = new HashMap<>();
            payRequest.put("merchantId", MERCHANT_ID);
            payRequest.put("merchantTransactionId", merchantTxnId);
            payRequest.put("merchantUserId", "USER123");
            payRequest.put("amount", amount);
            payRequest.put("redirectUrl",
                    "http://localhost:8080/job-search-portal/paymentStatus?transactionId=" + merchantTxnId);
            payRequest.put("callbackUrl",
                    "http://localhost:8080/job-search-portal/paymentStatus");
            payRequest.put("paymentInstrument", Map.of("type", "PAY_PAGE"));

            ObjectMapper mapper = new ObjectMapper();
            String jsonPayload = mapper.writeValueAsString(payRequest);
            String base64Payload = Base64.getEncoder().encodeToString(jsonPayload.getBytes());

            String toSign = base64Payload + "/pg/v1/pay" + SALT_KEY;
            String checksum = sha256(toSign) + "###" + SALT_INDEX;

            URL url = new URL(BASE_URL + "/pg/v1/pay");

            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json");
            con.setRequestProperty("X-VERIFY", checksum);
            con.setDoOutput(true);

            String finalPayload = "{ \"request\": \"" + base64Payload + "\" }";
            con.getOutputStream().write(finalPayload.getBytes());

            BufferedReader br = new BufferedReader(new InputStreamReader(
                    con.getResponseCode() >= 400 ? con.getErrorStream() : con.getInputStream()
            ));

            StringBuilder resp = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) resp.append(line);

            br.close();

            System.out.println("HTTP CODE = " + con.getResponseCode());
            System.out.println("PHONEPE RESPONSE = " + resp);

            JsonNode root = mapper.readTree(resp.toString());

            if (!root.path("success").asBoolean()) {
                out.println("PhonePe Error: " + root.path("message").asText());
                return;
            }

            JsonNode redirectNode = root.path("data")
                    .path("instrumentResponse")
                    .path("redirectInfo");

            if (redirectNode.isMissingNode()) {
                out.println("PhonePe Error: Redirect URL missing!");
                return;
            }

            String redirectUrl = redirectNode.path("url").asText();
            response.sendRedirect(redirectUrl);

        } catch (Exception e) {
            out.println("Exception: " + e.getMessage());
            e.printStackTrace();
        }
    }

    private String sha256(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encoded = digest.digest(input.getBytes());
            StringBuilder hex = new StringBuilder();
            for (byte b : encoded) hex.append(String.format("%02x", b));
            return hex.toString();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}


