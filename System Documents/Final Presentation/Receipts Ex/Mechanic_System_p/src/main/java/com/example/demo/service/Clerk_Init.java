package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Clerk_Repo;
import com.example.demo.dao.Doctor_Repo;
import com.example.demo.model.Clerk;
import com.example.demo.model.Doctor;

@Service
public class Clerk_Init implements CommandLineRunner {
	private Clerk_Repo clerk_repo;
    private PasswordEncoder passwordEncoder;

    public Clerk_Init(Clerk_Repo clerk_repo, PasswordEncoder passwordEncoder) {
        this.clerk_repo = clerk_repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        //Delete all
        this.clerk_repo.deleteAll();
        
        //Create users
        Clerk clerk = new Clerk(215667308,"Tholinhlanhla" ,"Hlophe", null, "0728108800", "hactor94@gmail.com", "Male", passwordEncoder.encode("Nhlanhla.94"), "true", 1, "CLERK", "CLERK");
        // Save to database
        this.clerk_repo.save(clerk); 
    }
}