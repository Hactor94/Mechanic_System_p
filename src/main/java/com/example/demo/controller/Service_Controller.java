package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.Service_Repo;
import com.example.demo.model.Service;

@RestController 
public class Service_Controller {
	@Autowired
	Service_Repo service_repo; 
	
	@RequestMapping(value="services")
	public List<Service> services(){
		return service_repo.findAll();	
	}
}
