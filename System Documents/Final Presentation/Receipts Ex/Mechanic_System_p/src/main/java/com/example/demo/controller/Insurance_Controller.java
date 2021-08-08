//package com.example.demo.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.example.demo.dao.Insurance_Company_Repo;
//import com.example.demo.model.Insurance_Company;
//
//@RestController 
//public class Insurance_Controller {
//	@Autowired
//	Insurance_Company_Repo insurance_repo; 
//	
//	@RequestMapping(value="/insurance_companies")
//	public List<Insurance_Company> insurance(){
//		return insurance_repo.findAll(); 
//	}
//	
//	@RequestMapping(method=RequestMethod.POST, value="/insurance_companies")
//	public Insurance_Company Add_Company(Insurance_Company insurance) {	
//		return insurance_repo.save(insurance); 
//	}
//
//}