package com.iardo.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Candidate {
    private String name;
    private String email;
    private String password;
    private String phone;
    private String gender;
    private String category;

}

