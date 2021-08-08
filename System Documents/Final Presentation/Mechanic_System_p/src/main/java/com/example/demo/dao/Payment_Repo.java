package com.example.demo.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.model.Payment;

public interface Payment_Repo extends JpaRepository<Payment, Integer>{

}
