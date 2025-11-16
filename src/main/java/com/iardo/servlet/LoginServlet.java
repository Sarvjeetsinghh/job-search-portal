package com.iardo.servlet;



import java.io.IOException;
import java.sql.*;

import com.iardo.util.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userType = request.getParameter("userType");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("\n=== LOGIN ATTEMPT ===");
        System.out.println("User Type: " + userType);
        System.out.println("Email: " + email);

        try (Connection conn = DBConnection.getConnection()) {

            String sql = "";
            String tableName = "";
            
            if ("candidate".equals(userType)) {
                sql = "SELECT id, name, email FROM candidates WHERE email=? AND password=?";
                tableName = "candidates";
            } else if ("employer".equals(userType)) {
                sql = "SELECT id, companyName, email FROM employers WHERE email=? AND password=?";
                tableName = "employers";
            }

            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = request.getSession(true);
                
                // Common attributes
                session.setAttribute("userType", userType);
                session.setAttribute("userEmail", email);

                if ("candidate".equals(userType)) {
                    int candidateId = rs.getInt("id");
                    String candidateName = rs.getString("name");
                    
                    session.setAttribute("candidateId", candidateId);
                    session.setAttribute("candidateName", candidateName);

                    System.out.println("✅ CANDIDATE LOGIN SUCCESS");
                    System.out.println("ID: " + candidateId);
                    System.out.println("Name: " + candidateName);
                    System.out.println("Session ID: " + session.getId());

                    response.sendRedirect(request.getContextPath() + "/candidateDashboard.jsp");
                    
                } else if ("employer".equals(userType)) {
                    int employerId = rs.getInt("id");
                    String employerName = rs.getString("companyName");
                    
                    session.setAttribute("employerId", employerId);
                    session.setAttribute("employerName", employerName);

                    System.out.println("✅ EMPLOYER LOGIN SUCCESS");
                    System.out.println("ID: " + employerId);
                    System.out.println("Company: " + employerName);
                    System.out.println("Session ID: " + session.getId());
                    System.out.println("employerId in session: " + session.getAttribute("employerId"));
                    System.out.println("employerName in session: " + session.getAttribute("employerName"));

                    response.sendRedirect(request.getContextPath() + "/employerDashboard");
                }
                
            } else {
                System.out.println("❌ LOGIN FAILED - Invalid credentials");
                response.sendRedirect(request.getContextPath() + "/login.jsp?error=Invalid+email+or+password");
            }

        } catch (Exception e) {
            System.err.println("❌ Exception in LoginServlet:");
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Server+error");
        }
    }
}

