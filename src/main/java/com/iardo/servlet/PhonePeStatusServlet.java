package com.iardo.servlet;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/PhonePeStatusServlet")
public class PhonePeStatusServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    // ***** LIVE MERCHANT DETAILS (IMPORTANT) *****
    private static final String MERCHANT_ID = "M224SQ5JEUXY3";  
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e"; 
    private static final String SALT_INDEX = "1";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String txnId = request.getParameter("transactionId");

        if (txnId == null || txnId.trim().isEmpty()) {
            response.getWriter().write("{\"error\":\"transactionId is missing\"}");
            return;
        }

        // ***** LIVE API PATH *****
        String apiPath = "/pg/v1/status/" + MERCHANT_ID + "/" + txnId;

        // ***** Compute X-VERIFY *****
        String toSign = apiPath + SALT_KEY;
        String checksum = sha256(toSign) + "###" + SALT_INDEX;

        // ***** LIVE URL *****
        String urlStr = "https://api.phonepe.com/apis/hermes" + apiPath;

        URL url = new URL(urlStr);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
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

        response.setContentType("application/json");
        response.getWriter().write(result.toString());
    }

    private String sha256(String str) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] encodedhash = digest.digest(str.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            for (byte b : encodedhash) {
                hexString.append(String.format("%02x", b));
            }
            return hexString.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
