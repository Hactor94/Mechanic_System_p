package com.example.demo.model;

import java.sql.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity 
public class Payment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int car_id; 
	private double total_amount; 
	private Date payment_date;
	
	@OneToOne
	@JoinColumn(name = "car_id", referencedColumnName = "car_id")
	private Car car; 
	
	public Car getCar() {
		return car;
	}
	public void setCar(Car car) {
		this.car = car;
	}
	public int getCar_id() {
		return car_id;
	}
	public void setCar_id(int car_id) {
		this.car_id = car_id;
	}
	public double getTotal_amount() {
		return total_amount;
	}
	public void setTotal_amount(double total_amount) {
		this.total_amount = total_amount;
	}
	public Date getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(Date payment_date) {
		this.payment_date = payment_date;
	}
	
	@Override
	public String toString() {
		return "Payment [car_id=" + car_id + ", total_amount=" + total_amount + ", payment_date=" + payment_date + "]";
	} 	
}
