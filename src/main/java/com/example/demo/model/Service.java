package com.example.demo.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity 
public class Service {
	
	@Id
	private int ID;
	private String service_type;
	private double price;
	
	@ManyToMany
	private List<Mechanic> mechanic; 
	
	public List<Mechanic> getMechanic() {
		return mechanic;
	}
	public void setMechanic(List<Mechanic> mechanic) {
		this.mechanic = mechanic;
	}
	public int getID() {
		return ID;
	}
	public void setID(int iD) {
		ID = iD;
	}
	public String getService_type() {
		return service_type;
	}
	public void setService_type(String service_type) {
		this.service_type = service_type;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Service [ID=" + ID + ", service_type=" + service_type + ", price=" + price + "]";
	} 
}
