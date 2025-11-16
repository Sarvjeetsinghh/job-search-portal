package com.iardo.model;

import java.sql.Timestamp;

public class Job {
    private int id;
    private int employerId;
    private String title;
    private String description;
    private String location;
    private String category;
    private String salary;
    private Timestamp postedDate;
    
    // Constructors
    public Job() {}
    
    public Job(int id, int employerId, String title, String description, String location, 
               String category, String salary, Timestamp postedDate) {
        this.id = id;
        this.employerId = employerId;
        this.title = title;
        this.description = description;
        this.location = location;
        this.category = category;
        this.salary = salary;
        this.postedDate = postedDate;
    }
    
    // Getters
    public int getId() {
        return id;
    }
    
    public int getEmployerId() {
        return employerId;
    }
    
    public String getTitle() {
        return title;
    }
    
    public String getDescription() {
        return description;
    }
    
    public String getLocation() {
        return location;
    }
    
    public String getCategory() {
        return category;
    }
    
    public String getSalary() {
        return salary;
    }
    
    public Timestamp getPostedDate() {
        return postedDate;
    }
    
    // Setters
    public void setId(int id) {
        this.id = id;
    }
    
    public void setEmployerId(int employerId) {
        this.employerId = employerId;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public void setLocation(String location) {
        this.location = location;
    }
    
    public void setCategory(String category) {
        this.category = category;
    }
    
    public void setSalary(String salary) {
        this.salary = salary;
    }
    
    public void setPostedDate(Timestamp postedDate) {
        this.postedDate = postedDate;
    }
    
    @Override
    public String toString() {
        return "Job{" +
                "id=" + id +
                ", employerId=" + employerId +
                ", title='" + title + '\'' +
                ", description='" + description + '\'' +
                ", location='" + location + '\'' +
                ", category='" + category + '\'' +
                ", salary='" + salary + '\'' +
                ", postedDate=" + postedDate +
                '}';
    }
}