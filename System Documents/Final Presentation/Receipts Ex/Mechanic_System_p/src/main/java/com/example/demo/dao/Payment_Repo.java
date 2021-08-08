package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Payment;

public interface Payment_Repo extends JpaRepository<Payment, Integer>{

	@Query(value = "SELECT * \r\n" + 
			"FROM appointment a LEFT JOIN payment p \r\n" + 
			"ON a.appointment_id = p.fk_appointment \r\n" + 
			"WHERE a.fk_doctor = :doctor", nativeQuery = true)
	List<Payment> findbyDoctor(int doctor);

}
