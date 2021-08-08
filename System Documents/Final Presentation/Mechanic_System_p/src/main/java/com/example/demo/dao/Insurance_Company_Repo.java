package com.example.demo.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.example.demo.model.Insurance_Company;

public interface Insurance_Company_Repo extends JpaRepository<Insurance_Company, Integer>{

	Insurance_Company findByEmail(String email);
	
	@Query(value = "SELECT * FROM insurance_company c WHERE c.password is null", nativeQuery = true)
	List<Insurance_Company> new_insurances();

}