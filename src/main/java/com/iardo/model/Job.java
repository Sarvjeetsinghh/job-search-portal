package com.iardo.model;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class Job {
    private int id;
    private int employerId;
    private String title;
    private String description;
    private String location;
    private String category;
    private String salary;
    private Timestamp postedDate;
	
}