package com.iardo.dao;

import com.iardo.model.Candidate;
import com.iardo.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class CandidateDAO {

    public boolean registerCandidate(Candidate candidate) {
        boolean result = false;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "INSERT INTO Candidates(name, email, password, phone, gender, category) VALUES (?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, candidate.getName());
            ps.setString(2, candidate.getEmail());
            ps.setString(3, candidate.getPassword());
            ps.setString(4, candidate.getPhone());
            ps.setString(5, candidate.getGender());
            ps.setString(6, candidate.getCategory());

            int rows = ps.executeUpdate();
            if (rows > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
    
    
    
    public Candidate getCandidateByEmail(String email) {
        Candidate candidate = null;
        try {
            Connection conn = DBConnection.getConnection();
            String sql = "SELECT * FROM candidates WHERE email = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                candidate = new Candidate();
                candidate.setId(rs.getInt("id"));
                candidate.setName(rs.getString("name"));
                candidate.setEmail(rs.getString("email"));
                candidate.setPassword(rs.getString("password"));
                candidate.setPhone(rs.getString("phone"));
                candidate.setGender(rs.getString("gender"));
                candidate.setCategory(rs.getString("category"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return candidate;
    }
    
    
    

}
