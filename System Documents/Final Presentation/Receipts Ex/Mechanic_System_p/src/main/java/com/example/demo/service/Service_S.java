package com.example.demo.service;

import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Service_Repo;
import com.example.demo.model.Services;

@Service
public class Service_S implements CommandLineRunner {
	private Service_Repo service_repo;
	
	public Service_S(Service_Repo service_repo) {
        this.service_repo = service_repo;
    }
	
	@Override
    public void run(String... args) {
        //Delete all
        this.service_repo.deleteAll();
        
        //Create users
        Services service1 = new Services(2020, 500.00, "General Practitioner");
        Services service2 = new Services(2021, 250.00, "Dentist");
        Services service3 = new Services(2022, 600.00, "Nephrologist");
        Services service4 = new Services(2023, 950.00, "Neurologist");
        
        // Save to database
        this.service_repo.save(service1); 
        this.service_repo.save(service2);
        this.service_repo.save(service3);
        this.service_repo.save(service4);
    }
}
