package com.example.demo.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.example.demo.dao.Client_Booking_Repo;
import com.example.demo.model.Client_Booking;

@RestController 
public class Booking_Controller {
	@Autowired
	Client_Booking_Repo booking_repo; 
	
	@RequestMapping(value="/bookings")
	public List<Client_Booking> Bookings() {	
		return booking_repo.findAll(); 
	}
	
	@RequestMapping(value="/bookings/{id}")
	public Optional<Client_Booking> Booking(@PathVariable("id") int id) {	
		return booking_repo.findById(id);
	}
	
	@RequestMapping(method=RequestMethod.POST, value="/bookings")
	public Client_Booking Add_Booking(Client_Booking bookings) {	
		return booking_repo.save(bookings); 
	}
	
	@RequestMapping(method=RequestMethod.PUT, value="/bookings/{id}")
	public void Update_Booking(@PathVariable("id") int id, Client_Booking booking) {
		booking_repo.save(booking);
	}
	
	@RequestMapping(method=RequestMethod.DELETE, value="/bookings/{id}")
	public void Delete_Booking(@PathVariable("id") int id) {	
		booking_repo.deleteById(id);
	}
}
