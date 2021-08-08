package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Doctor_Repo;
import com.example.demo.model.Doctor;

@Service
public class Password {
	@Autowired
	private Doctor_Repo doctor_repo;
	
	public void updateResetPasswordToken(String token, String email) throws DoctorNotFoundException {
		Doctor doctor = doctor_repo.findByEmail(email);
		
		if (doctor != null) {
			doctor.setResetPasswordToken(token);
			doctor_repo.save(doctor);
		} else {
			throw new DoctorNotFoundException("The is no doctor with this email " + email);
		}
	}
	public Doctor get(String resetPasswordToken) {
		return doctor_repo.findResetPasswordToken(resetPasswordToken);
	}
	public void updatePassword(Doctor doctor, String newPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(newPassword);
		doctor.setPassword(encodedPassword);
		doctor.setResetPasswordToken(null);
		doctor_repo.save(doctor);
	}
}
