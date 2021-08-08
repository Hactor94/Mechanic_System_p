package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Service; 

public interface Service_Repo extends JpaRepository<Service, Integer>{ 

}
