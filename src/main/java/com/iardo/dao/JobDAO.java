package com.iardo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.iardo.model.Job;
import com.iardo.util.DBConnection;


public class JobDAO {

    public boolean addJob(int employerId, String title, String description,
                          String location, String category, String salary) {

        String sql = "INSERT INTO jobs (employer_id, job_title, job_description, location, category, salary, posted_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, employerId);
            ps.setString(2, title);
            ps.setString(3, description);
            ps.setString(4, location);
            ps.setString(5, category);
            ps.setString(6, salary);

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            System.err.println("❌ Error in JobDAO.addJob()");
            e.printStackTrace();
        }
        return false;
    }

    public List<Job> getJobsByEmployer(int employerId) {
        List<Job> jobs = new ArrayList<>();
        String sql = "SELECT id, employer_id, job_title, job_description, location, category, salary, posted_date "
                   + "FROM jobs WHERE employer_id = ? ORDER BY posted_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, employerId);
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Job job = new Job();
                    job.setId(rs.getInt("id"));
                    job.setEmployerId(rs.getInt("employer_id"));
                    // 🔥 FIX: Database column names ke saath match karein
                    job.setTitle(rs.getString("job_title"));           // ❌ "title" ki jagah
                    job.setDescription(rs.getString("job_description")); // ❌ "description" ki jagah
                    job.setLocation(rs.getString("location"));
                    job.setCategory(rs.getString("category"));
                    job.setSalary(rs.getString("salary"));  // 🔥 ADD THIS
                    job.setPostedDate(rs.getTimestamp("posted_date"));
                    jobs.add(job);
                }
            }

        } catch (Exception e) {
            System.err.println("❌ Error in JobDAO.getJobsByEmployer()");
            e.printStackTrace();
        }

        return jobs;
    }
}

