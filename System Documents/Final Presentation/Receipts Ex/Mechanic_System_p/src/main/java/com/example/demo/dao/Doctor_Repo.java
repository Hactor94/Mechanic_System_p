package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Doctor;

public interface Doctor_Repo extends JpaRepository<Doctor, Integer>{

	Doctor findByEmail(String email);
	
	@Query(value = "SELECT * FROM doctor WHERE SUBSTRING(first_name, 1, 1) | ' ' | last_name = :doctor",  nativeQuery = true)
	Doctor findByDoctor(String doctor);
	
	@Query(value = "SELECT * FROM doctor d WHERE d.password is null", nativeQuery = true)
	List<Doctor> new_doctors();
	
	@Query(value = "SELECT * FROM doctor d, service s WHERE d.fk_service = s.id AND d.fk_service = :service_id", nativeQuery = true)
	List<Doctor> findByService(int service_id);
	
	@Query(value = "SELECT * FROM doctor d WHERE d.reset_password_token = :token", nativeQuery = true)
	Doctor findResetPasswordToken(String token);
}
