package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Services; 

public interface Service_Repo extends JpaRepository<Services, Integer>{
	Services findByServiceType(String service_type); 
}
