package com.iardo.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/ChatServlet")
public class ChatServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        resp.setContentType("text/plain;charset=UTF-8");

        // Get message from request parameter
        String userMsg = req.getParameter("message");
        if (userMsg == null) {
            userMsg = "";
        }

        // Prepare AI-like reply
        String reply;
        userMsg = userMsg.toLowerCase();

        if (userMsg.contains("hello") || userMsg.contains("hi")) {
            reply = "Hi! 👋 Welcome to Dream Naukri. How can I help you today?";
        } else if (userMsg.contains("job")) {
            reply = "You can check the Jobs section for the latest openings.";
        } else if (userMsg.contains("apply")) {
            reply = "Login and click 'Apply Now' for your desired job.";
        } else if (userMsg.contains("contact")) {
            reply = "You can reach us via the Contact Us page or email support@dreamnaukri.com.";
        } else {
            reply = "I'm still learning 🤖. Try asking me about jobs, applying, or contact details.";
        }

        // Send reply to client
        try (PrintWriter out = resp.getWriter()) {
            out.print(reply);
        }
    }
}
