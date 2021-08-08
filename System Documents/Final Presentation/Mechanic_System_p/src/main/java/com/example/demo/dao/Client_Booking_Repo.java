package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.example.demo.model.Client_Booking;

public interface Client_Booking_Repo extends JpaRepository<Client_Booking, Integer>{
	Client_Booking findByEmail(String email);
	void deleteByEmail(String email);
	
	@Query(value = "SELECT * FROM client_booking b, car c WHERE b.booking_id = c.booking_booking_id AND c.car_status = :car_status", nativeQuery = true)
	List<Client_Booking> findByCarStatus(@Param("car_status") String car_status);
	@Query(value = "SELECT * \r\n" + 
			"FROM client_booking b LEFT JOIN car c \r\n" + 
			"ON b.booking_id = c.booking_booking_id\r\n" + 
			"WHERE c.booking_booking_id IS NULL", nativeQuery = true)
	List<Client_Booking> findByMechanic();
	List<Client_Booking> findByInsurance(int reg_number);
} 
