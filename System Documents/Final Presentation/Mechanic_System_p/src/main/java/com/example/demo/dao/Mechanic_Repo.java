package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Mechanic;

public interface Mechanic_Repo extends JpaRepository<Mechanic, Integer>{ 
	Mechanic findByEmail(String email);
	@Query(value = "SELECT * FROM mechanic m WHERE m.reset_password_token = :token", nativeQuery = true)
	Mechanic findResetPasswordToken(String token);
	
	@Query(value = "SELECT * FROM mechanic m WHERE m.password is null", nativeQuery = true)
	List<Mechanic> new_mechanics();
	
	@Query(value = "SELECT * \r\n" + 
			"	FROM mechanic m, service s, service_mechanic ms\r\n" + 
			"	WHERE m.stuff_number = ms.mechanic_stuff_number\r\n" + 
			"	AND s.id = ms.service_id\r\n" + 
			"	AND s.service_type = :service_type", nativeQuery = true)
	List<Mechanic> findByService(String service_type);
}