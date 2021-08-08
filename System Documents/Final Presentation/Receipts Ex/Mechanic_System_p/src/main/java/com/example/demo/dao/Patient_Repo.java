package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Patient;

public interface Patient_Repo extends JpaRepository<Patient, Integer>{

}
