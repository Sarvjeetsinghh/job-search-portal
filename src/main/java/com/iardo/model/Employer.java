package com.iardo.model;

public class Employer {
    private int id;
    private String companyName;
    private String email;
    private String password;
    private String phone;
    private String industry;
    private String website;
    private String address;
    private String description;
    
    // Constructors
    public Employer() {}
    
    public Employer(int id, String companyName, String email, String password, String phone, 
                    String industry, String website, String address, String description) {
        this.id = id;
        this.companyName = companyName;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.industry = industry;
        this.website = website;
        this.address = address;
        this.description = description;
    }
    
    // Getters
    public int getId() {
        return id;
    }
    
    public String getCompanyName() {
        return companyName;
    }
    
    public String getEmail() {
        return email;
    }
    
    public String getPassword() {
        return password;
    }
    
    public String getPhone() {
        return phone;
    }
    
    public String getIndustry() {
        return industry;
    }
    
    public String getWebsite() {
        return website;
    }
    
    public String getAddress() {
        return address;
    }
    
    public String getDescription() {
        return description;
    }
    
    // Setters
    public void setId(int id) {
        this.id = id;
    }
    
    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public void setPhone(String phone) {
        this.phone = phone;
    }
    
    public void setIndustry(String industry) {
        this.industry = industry;
    }
    
    public void setWebsite(String website) {
        this.website = website;
    }
    
    public void setAddress(String address) {
        this.address = address;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    @Override
    public String toString() {
        return "Employer{" +
                "id=" + id +
                ", companyName='" + companyName + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", industry='" + industry + '\'' +
                ", website='" + website + '\'' +
                ", address='" + address + '\'' +
                '}';
    }
}