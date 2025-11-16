package com.iardo.dao;


import com.iardo.model.Employer;
import com.iardo.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class EmployerDAO {

	public Employer getEmployerByEmail(String email) {
	    Employer employer = null;

	    String sql = "SELECT id, companyName, email, password, phone, industry, website, address, description "
	               + "FROM employers WHERE email = ?";

	    try (Connection conn = DBConnection.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql)) {

	        ps.setString(1, email);

	        try (ResultSet rs = ps.executeQuery()) {
	            if (rs.next()) {
	                employer = new Employer();
	                
	                // 🔥 ID properly set ho raha hai ya nahi check karein
	                int id = rs.getInt("id");
	                System.out.println("🔍 Retrieved ID from DB: " + id);
	                
	                employer.setId(id);
	                employer.setCompanyName(rs.getString("companyName"));
	                employer.setEmail(rs.getString("email"));
	                employer.setPassword(rs.getString("password"));
	                employer.setPhone(rs.getString("phone"));
	                employer.setIndustry(rs.getString("industry"));
	                employer.setWebsite(rs.getString("website"));
	                employer.setAddress(rs.getString("address"));
	                employer.setDescription(rs.getString("description"));

	                System.out.println("✅ Employer object created:");
	                System.out.println("  ID: " + employer.getId());
	                System.out.println("  Name: " + employer.getCompanyName());
	            } else {
	                System.out.println("❌ No employer found with email: " + email);
	            }
	        }

	    } catch (Exception e) {
	        System.err.println("❌ Exception in getEmployerByEmail:");
	        e.printStackTrace();
	    }

	    return employer;
	}

    public boolean registerEmployer(Employer employer) {
        // 👉 USE CORRECT COLUMN NAMES
        String sql = "INSERT INTO employers (companyName, email, password, phone, industry, website, address, description) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, employer.getCompanyName());
            ps.setString(2, employer.getEmail());
            ps.setString(3, employer.getPassword());
            ps.setString(4, employer.getPhone());
            ps.setString(5, employer.getIndustry());
            ps.setString(6, employer.getWebsite());
            ps.setString(7, employer.getAddress());
            ps.setString(8, employer.getDescription());

            return ps.executeUpdate() > 0;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return false;
    }
}
