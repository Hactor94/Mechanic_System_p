package com.example.demo.dao;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import com.example.demo.model.Car;

public interface Car_Repo extends JpaRepository<Car, Integer>{ 
	List<Car> findByCarStatus(String car_status);
	
	@Query(value = "SELECT * FROM car WHERE insurance_reg_number = :reg_number",  nativeQuery = true)
	List<Car> findByInsurance(int reg_number);
	
	@Modifying
	@Transactional
	@Query(value = "UPDATE car SET mechanic_stuff_number = :stuff_number WHERE carId = :car_id",  nativeQuery = true)
	void assignMechanic(int stuff_number, int car_id);

	@Query(value = "SELECT * FROM car WHERE car_status = :car_status AND insurance_reg_number = :reg_number",  nativeQuery = true)
	List<Car> insurance_cars(String car_status, int reg_number);
	
	@Query(value = "SELECT * \r\n" + 
			"FROM client_booking b LEFT JOIN car c \r\n" + 
			"ON b.booking_id = c.booking_booking_id\r\n" + 
			"WHERE c.car_id = :carId", nativeQuery = true)
	List<Car> findAllByCarId(int carId);
}
