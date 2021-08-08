package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.Mechanic_Repo;
import com.example.demo.model.Mechanic;

@RestController 
public class Mechanic_Controller {
	@Autowired 
	Mechanic_Repo mechanic_repo; 
	
	@RequestMapping(value="mechanics")
	public List<Mechanic> mechanics(){
		return mechanic_repo.findAll(); 
	}
}
