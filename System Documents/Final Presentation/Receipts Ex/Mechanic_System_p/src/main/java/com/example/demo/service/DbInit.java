package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Doctor_Repo;
import com.example.demo.model.Doctor;

@Service
public class DbInit implements CommandLineRunner {
	private Doctor_Repo doctor_repo;
    private PasswordEncoder passwordEncoder;

    public DbInit(Doctor_Repo doctor_repo, PasswordEncoder passwordEncoder) {
        this.doctor_repo = doctor_repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        //Delete all
        this.doctor_repo.deleteAll();
        
        //Create users
        Doctor doctor = new Doctor(215667308,"Tholinhlanhla" ,"Hlophe", null, "0728108800", "mkhonkosi28@gmail.com", "Male", passwordEncoder.encode("Nhlanhla.94"), "true", 1, "ADMIN, DOCTOR", "ADMIN, DOCTOR");
        // Save to database
        this.doctor_repo.save(doctor); 
    }
}