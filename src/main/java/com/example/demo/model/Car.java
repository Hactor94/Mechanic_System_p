package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Car {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int carId;
	private double total_cost;
	private String carStatus;
	private String report_url;
	
	@ManyToOne
	private Client_Booking booking;
	@ManyToOne
	private Insurance_Company insurance;
	@ManyToOne
	private Mechanic mechanic; 
	
	
	public String getReport_url() {
		return report_url;
	}
	public void setReport_url(String report_url) {
		this.report_url = report_url;
	}
	public Mechanic getMechanic() {
		return mechanic;
	}
	public void setMechanic(Mechanic mechanic) {
		this.mechanic = mechanic;
	}
	public Insurance_Company getInsurance() {
		return insurance;
	}
	public void setInsurance(Insurance_Company insurance) {
		this.insurance = insurance;
	}
	public Client_Booking getBooking() {
		return booking;
	}
	public void setBooking(Client_Booking booking) {
		this.booking = booking;
	}
	public int getCarId() {
		return carId;
	}
	public void setCarId(int carId) {
		this.carId = carId;
	}
	public double getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(double total_cost) {
		this.total_cost = total_cost;
	}
	public String getCarStatus() {
		return carStatus;
	}
	public void setCarStatus(String car_status) {
		this.carStatus = car_status;
	}
	@Override
	public String toString() {
		return "Car [carId=" + carId + ", total_cost=" + total_cost + ", carStatus=" + carStatus + ", report_url="
				+ report_url + ", booking=" + booking + ", insurance=" + insurance + ", mechanic=" + mechanic + "]";
	}
}