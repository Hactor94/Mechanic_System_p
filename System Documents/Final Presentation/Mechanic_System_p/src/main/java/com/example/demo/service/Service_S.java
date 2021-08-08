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
        Services service1 = new Services(2020, 5535.61, "Engine Maintenance");
        Services service2 = new Services(2021, 500.00, "Wheel Alignment");
        Services service3 = new Services(2022, 15505.92, "Air Condition Services");
        Services service4 = new Services(2023, 4651.78, "Transmission Repair And Replacement");
        
        // Save to database
        this.service_repo.save(service1); 
        this.service_repo.save(service2);
        this.service_repo.save(service3);
        this.service_repo.save(service4);
    }
}
