package com.iardo.servlet;


import com.iardo.dao.EmployerDAO;
import com.iardo.model.Employer;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/employerRegister")
public class EmployerRegisterServlet extends HttpServlet {

    private EmployerDAO employerDAO = new EmployerDAO();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String companyName = request.getParameter("companyName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        String industry = request.getParameter("industry");
        String website = request.getParameter("website");
        String address = request.getParameter("address");
        String description = request.getParameter("description");

        Employer employer = new Employer();
        employer.setCompanyName(companyName);
        employer.setEmail(email);
        employer.setPassword(password);
        employer.setPhone(phone);
        employer.setIndustry(industry);
        employer.setWebsite(website);
        employer.setAddress(address);
        employer.setDescription(description);

        boolean success = employerDAO.registerEmployer(employer);

        if (success) {
            response.sendRedirect("login.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
    
    
}
    
    
   

