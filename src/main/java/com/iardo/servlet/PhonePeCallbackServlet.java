package com.iardo.servlet;

import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.json.JSONObject;

@WebServlet("/PhonePeCallbackServlet")
public class PhonePeCallbackServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        BufferedReader reader = request.getReader();
        StringBuilder data = new StringBuilder();
        String line;

        while ((line = reader.readLine()) != null) {
            data.append(line);
        }

        System.out.println("PHONEPE CALLBACK: " + data.toString());

        JSONObject json = new JSONObject(data.toString());
        String code = json.getString("code");

        if (code.equals("PAYMENT_SUCCESS")) {
            System.out.println("Payment Success!");
        } else {
            System.out.println("Payment Failed!");
        }

        response.setStatus(200);
    }
}
