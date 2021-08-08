package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.model.Insurance_Company;
import com.example.demo.dao.Insurance_Company_Repo;

@Service
public class Insurance_Init implements CommandLineRunner {
	private Insurance_Company_Repo insurance_repo;
    private PasswordEncoder passwordEncoder;

    public Insurance_Init(Insurance_Company_Repo insurance_repo, PasswordEncoder passwordEncoder) {
        this.insurance_repo = insurance_repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        //Delete all
        this.insurance_repo.deleteAll();

        //Create users
        Insurance_Company insurance = new Insurance_Company(215667308, "Trio Touch", "Trio123", "hactor94@gmail.com", 825528094,
    			"155 Troye Str", "Pritoria", "South Africa", 1002, passwordEncoder.encode("nhlanhla"), "yes", 1, "INSURANCE", "INSURANCE");
        
        // Save to database
        this.insurance_repo.save(insurance); 
    }
}