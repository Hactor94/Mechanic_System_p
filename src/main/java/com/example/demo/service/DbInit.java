package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.demo.model.Mechanic;
import com.example.demo.dao.Mechanic_Repo;

@Service
public class DbInit implements CommandLineRunner {
	private Mechanic_Repo Mechanic_Repo;
    private PasswordEncoder passwordEncoder;

    public DbInit(Mechanic_Repo Mechanic_Repo, PasswordEncoder passwordEncoder) {
        this.Mechanic_Repo = Mechanic_Repo;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void run(String... args) {
        //Delete all
        this.Mechanic_Repo.deleteAll();

        //Create users
        Mechanic mechanic = new Mechanic(215667308,"Tholinhlanhla", "Hlophe", null, 728108800, "mkhonkosi28@gmail.com", "male", passwordEncoder.encode("nhlanhla"), "yes", 1, "ADMIN, MECHANIC", "ADMIN, MECHANIC");
        
        // Save to database
        this.Mechanic_Repo.save(mechanic); 
    }
}