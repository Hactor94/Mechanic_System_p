package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Appointment;
import java.util.List;

import javax.transaction.Transactional;

public interface Appointment_Repo extends JpaRepository<Appointment, Integer>{
		List<Appointment> findByAppointmentStatus(String status);
		
		@Query(value = "SELECT * FROM appointment WHERE appointment_status = :appointment_status AND fk_clerk = :staff_number",  nativeQuery = true)
		List<Appointment> clerk_appointments(String appointment_status, int staff_number);
		
		@Query(value = "SELECT * \r\n" + 
				"FROM patient p LEFT JOIN appointment a \r\n" + 
				"ON p.patient_id = a.fk_patient \r\n" + 
				"WHERE a.appointment_id = :appointmentId", nativeQuery = true)
		List<Appointment> findAllByAppointmentId(int appointmentId);
}
