package com.iardo.servlet;


import com.iardo.dao.JobDAO;
import com.iardo.model.Job;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/employerDashboard")
public class EmployerDashboardServlet extends HttpServlet {

    private JobDAO jobDAO = new JobDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("\n=== DASHBOARD ACCESS ATTEMPT ===");

        HttpSession session = request.getSession(false);

        // ✅ YE CODE YAHAAN HAI (Line 24-28)
        if (session == null) {
            System.out.println("❌ Session is NULL");
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+first");
            return;
        }

        System.out.println("Session ID: " + session.getId());
        System.out.println("userType: " + session.getAttribute("userType"));
        System.out.println("employerId: " + session.getAttribute("employerId"));
        System.out.println("employerName: " + session.getAttribute("employerName"));

        // ✅ YE CODE YAHAAN HAI (Line 38-42)
        if (!"employer".equals(session.getAttribute("userType"))) {
            System.out.println("❌ userType is not 'employer'");
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Please+login+as+employer");
            return;
        }

        Integer employerId = (Integer) session.getAttribute("employerId");

        // ✅ YE CODE YAHAAN HAI (Line 47-51)
        if (employerId == null) {
            System.out.println("❌ employerId is NULL in session");
            response.sendRedirect(request.getContextPath() + "/login.jsp?error=Invalid+session");
            return;
        }

        System.out.println("✅ Session valid, fetching jobs for employer ID: " + employerId);

        List<Job> jobs = jobDAO.getJobsByEmployer(employerId);

        System.out.println("Jobs fetched: " + (jobs != null ? jobs.size() : 0));
        System.out.println("======================\n");

        request.setAttribute("jobs", jobs);

        RequestDispatcher rd = request.getRequestDispatcher("employerDashboard.jsp");
        rd.forward(request, response);
    }
}