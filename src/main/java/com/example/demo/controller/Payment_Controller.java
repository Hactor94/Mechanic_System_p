package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.Payment_Repo;
import com.example.demo.model.Payment;

@RestController 
public class Payment_Controller {
	@Autowired
	Payment_Repo payment_repo; 
	
	@RequestMapping(value="payments")
	public List<Payment> payments(){
		return payment_repo.findAll(); 
	}
	
}
