package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.example.demo.dao.Mechanic_Repo;
import com.example.demo.model.Mechanic;

@Service
public class Password {
	@Autowired
	private Mechanic_Repo mechanic_repo;
	
	public void updateResetPasswordToken(String token, String email) throws MechanicNotFoundException {
		Mechanic mechanic = mechanic_repo.findByEmail(email);
		
		if (mechanic != null) {
			mechanic.setResetPasswordToken(token);
			mechanic_repo.save(mechanic);
		} else {
			throw new MechanicNotFoundException("The is no mechanic with this email " + email);
		}
	}
	public Mechanic get(String resetPasswordToken) {
		return mechanic_repo.findResetPasswordToken(resetPasswordToken);
	}
	public void updatePassword(Mechanic mechanic, String newPassword) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(newPassword);
		mechanic.setPassword(encodedPassword);
		mechanic.setResetPasswordToken(null);
		mechanic_repo.save(mechanic);
	}
}
