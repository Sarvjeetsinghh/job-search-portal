package com.iardo.servlet;


import com.iardo.dao.JobDAO;
import com.iardo.model.Job;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.WebServlet;

import java.io.IOException;
import java.util.List;

@WebServlet("/employerJobs")
public class EmployerJobsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || !"employer".equals(session.getAttribute("userType"))) {
            response.sendRedirect("employer_login.jsp?error=Please+login+first");
            return;
        }

        Integer employerId = (Integer) session.getAttribute("employerId");
        if (employerId == null) {
            response.sendRedirect("employer_login.jsp?error=Session+expired");
            return;
        }

        // ✅ Fetch employer jobs
        JobDAO jobDAO = new JobDAO();
        List<Job> jobs = jobDAO.getJobsByEmployer(employerId);

        // Add jobs to request
        request.setAttribute("jobs", jobs);

        RequestDispatcher rd = request.getRequestDispatcher("employerDashboard.jsp");
        rd.forward(request, response);
    }
}
