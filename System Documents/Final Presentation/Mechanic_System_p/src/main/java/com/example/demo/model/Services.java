package com.example.demo.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name = "service")
public class Services {
	
	@Id
	private int ID;
	@NotNull private String serviceType;
	@NotNull private double price;
	
	@ManyToMany
	private List<Mechanic> mechanic; 
	
	public Services() {
	}
	public Services(int id, double price, String serviceType) {
		this.ID = id;
		this.price = price;
		this.serviceType = serviceType;
	}
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
	public String getServiceType() {
		return serviceType;
	}
	public void setServiceType(String serviceType) {
		this.serviceType = serviceType;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	
	@Override
	public String toString() {
		return "Service [ID=" + ID + ", serviceType=" + serviceType + ", price=" + price + "]";
	} 
}
