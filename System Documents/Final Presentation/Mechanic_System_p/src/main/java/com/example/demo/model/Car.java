package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

@Entity
public class Car {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int carId;
	@NotNull private double total_cost;
	@NotNull private String carStatus;
	private String report;
	private String proof;
	
	@ManyToOne
	private Client_Booking booking;
	@ManyToOne
	private Insurance_Company insurance;
	@ManyToOne
	private Mechanic mechanic;
	
	public String getProof() {
		return proof;
	}
	public void setProof(String proof) {
		this.proof = proof;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
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
		return "Car [carId=" + carId + ", total_cost=" + total_cost + ", carStatus=" + carStatus + ", report=" + report
				+ ", proof=" + proof + ", booking=" + booking + ", insurance=" + insurance + ", mechanic=" + mechanic
				+ "]";
	}
}