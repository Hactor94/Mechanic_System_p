package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Clerk;

public interface Clerk_Repo extends JpaRepository<Clerk, Integer>{
	Clerk findByEmail(String email);
	
	@Query(value = "SELECT * FROM clerk c WHERE c.password is null", nativeQuery = true)
	List<Clerk> new_clerks();
}
