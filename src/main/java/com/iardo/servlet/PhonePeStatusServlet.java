package com.iardo.servlet;


import java.io.*;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.security.MessageDigest;
import java.util.Base64;

public class PhonePeStatusServlet extends HttpServlet {

    private static final String MERCHANT_ID = "M224SQ5JEUXY3";
    private static final String SALT_KEY = "d85d7c38-69bf-41cc-9f61-e2d832b23c3e";
    private static final String SALT_INDEX = "1";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        String txnId = request.getParameter("transactionId");

        String apiPath = "/pg/v1/status/" + MERCHANT_ID + "/" + txnId;
        String checksum = sha256(apiPath + SALT_KEY) + "###" + SALT_INDEX;

        HttpGet get = new HttpGet("https://api.phonepe.com/apis/hermes" + apiPath);
        get.setHeader("X-VERIFY", checksum);

        CloseableHttpClient client = HttpClients.createDefault();
        var res = client.execute(get);

        String result = new BufferedReader(
            new InputStreamReader(res.getEntity().getContent())
        ).readLine();

        response.setContentType("application/json");
        response.getWriter().write(result);
    }

    private String sha256(String data) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            return Base64.getEncoder().encodeToString(md.digest(data.getBytes()));
        } catch (Exception e) { return null; }
    }
}
