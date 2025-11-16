package com.iardo.servlet;


import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.MessageDigest;
import java.util.Base64;

@WebServlet("/paymentStatus")
public class PaymentStatusServlet extends HttpServlet {

    private static final String MERCHANT_ID = "M224SQ5JEUXY3";
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e";  
    private static final String SALT_INDEX = "1";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String transactionId = request.getParameter("transactionId");

        if (transactionId == null) {
            response.getWriter().write("Invalid Transaction");
            return;
        }

        String urlPath = "/pg/v1/status/" + MERCHANT_ID + "/" + transactionId;
        String verifyString = urlPath + SALT_KEY;

        String checksum = sha256(verifyString) + "###" + SALT_INDEX;

        URL url = new URL("https://api-preprod.phonepe.com/apis/hermes" + urlPath);
        HttpURLConnection con = (HttpURLConnection) url.openConnection();
        con.setRequestProperty("accept", "application/json");
        con.setRequestProperty("X-VERIFY", checksum);
        con.setRequestProperty("X-MERCHANT-ID", MERCHANT_ID);

        BufferedReader br = new BufferedReader(new InputStreamReader(con.getInputStream()));
        StringBuilder output = new StringBuilder();
        String line;

        while ((line = br.readLine()) != null) {
            output.append(line);
        }

        response.setContentType("application/json");
        response.getWriter().write(output.toString());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // CALLBACK receives JSON body
        BufferedReader reader = req.getReader();
        StringBuilder json = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            json.append(line);
        }

        System.out.println("PhonePe CALLBACK RECEIVED: " + json);

        resp.setStatus(200);
    }

    private String sha256(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hash = md.digest(str.getBytes());
            StringBuilder hex = new StringBuilder();
            for (byte b : hash)
                hex.append(String.format("%02x", b));
            return hex.toString();
        } catch (Exception e) {
            return null;
        }
    }
}
