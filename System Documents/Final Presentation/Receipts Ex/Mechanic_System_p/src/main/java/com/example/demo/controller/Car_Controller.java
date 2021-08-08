//package com.example.demo.controller;
//
//import java.util.List;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestMethod;
//import org.springframework.web.bind.annotation.RestController;
//
//import com.example.demo.dao.Car_Repo;
//import com.example.demo.model.Car;
//
//@RestController 
//public class Car_Controller {
//	@Autowired  
//	Car_Repo car_repo; 
//	
//	@RequestMapping(value="/cars")
//	public List<Car> cars(){	
//		return car_repo.findAll(); 
//	}
//	
//	@RequestMapping(method=RequestMethod.POST, value="/cars")
//	public Car Add_Car(Car car) {	
//		return car_repo.save(car); 
//	}
//
//}
