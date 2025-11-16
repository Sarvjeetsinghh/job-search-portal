package com.iardo.servlet;



import com.iardo.dao.EmployerDAO;
import com.iardo.model.Employer;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/employerLogin")
public class EmployerLoginServlet extends HttpServlet {

    private EmployerDAO employerDAO = new EmployerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("\n=== LOGIN ATTEMPT ===");
        System.out.println("Email: " + email);
        System.out.println("Password Length: " + (password != null ? password.length() : 0));

        Employer employer = employerDAO.getEmployerByEmail(email);

        if (employer == null) {
            System.out.println("❌ No employer found with email: " + email);
            response.sendRedirect(request.getContextPath() + "/employer_login.jsp?error=Invalid+email+or+password");
            return;
        }

        System.out.println("✅ Employer found:");
        System.out.println("  ID: " + employer.getId());
        System.out.println("  Company: " + employer.getCompanyName());
        System.out.println("  DB Password: " + employer.getPassword());
        System.out.println("  Input Password: " + password);

        if (employer.getPassword() != null && employer.getPassword().equals(password)) {
            
            HttpSession session = request.getSession(true);
            session.setAttribute("userType", "employer");
            session.setAttribute("employerId", employer.getId());
            session.setAttribute("employerName", employer.getCompanyName());
            session.setAttribute("employerEmail", employer.getEmail());

            System.out.println("\n=== LOGIN SUCCESS ===");
            System.out.println("Session ID: " + session.getId());
            System.out.println("employerId: " + session.getAttribute("employerId"));
            System.out.println("employerName: " + session.getAttribute("employerName"));
            System.out.println("userType: " + session.getAttribute("userType"));
            System.out.println("====================\n");

            response.sendRedirect(request.getContextPath() + "/employerDashboard");
        } else {
            System.out.println("❌ Password mismatch!");
            response.sendRedirect(request.getContextPath() + "/employer_login.jsp?error=Invalid+email+or+password");
        }
    }
}