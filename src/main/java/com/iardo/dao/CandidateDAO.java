package com.iardo.dao;

import com.iardo.model.Candidate;
import com.iardo.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;

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
}
