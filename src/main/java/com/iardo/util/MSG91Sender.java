package com.iardo.util;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

public class MSG91Sender {
    private static final String AUTH_KEY = "YOUR_MSG91_API_KEY"; // 🔑 Replace this with real API key
    private static final String SENDER_ID = "MSGIND";
    private static final String ROUTE = "4";

    public static void sendOTP(String mobileNumber, String otp) {
        try {
            String message = "Your OTP is: " + otp;
            message = URLEncoder.encode(message, "UTF-8");

            String urlStr = "https://api.msg91.com/api/sendhttp.php?mobiles=" + mobileNumber
                    + "&authkey=" + AUTH_KEY
                    + "&route=" + ROUTE
                    + "&sender=" + SENDER_ID
                    + "&message=" + message
                    + "&country=91";

            URL url = new URL(urlStr);
            HttpURLConnection con = (HttpURLConnection) url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            System.out.println("SMS sent! Response Code: " + responseCode);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
