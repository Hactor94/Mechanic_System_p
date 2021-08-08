package com.example.demo.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name = "service")
public class Services {
	
	@Id
	private int ID;
	@NotNull private String serviceType;
	@NotNull private double price;
	
	@OneToMany(mappedBy = "services")
    private List<Doctor> doctors;
	
	public Services() {
	}
	public Services(int id, double price, String serviceType) {
		this.ID = id;
		this.price = price;
		this.serviceType = serviceType;
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
	public List<Doctor> getDoctors() {
		return doctors;
	}
	public void setDoctors(List<Doctor> doctors) {
		this.doctors = doctors;
	}
	@Override
	public String toString() {
		return "Services [ID=" + ID + ", serviceType=" + serviceType + ", price=" + price + "]";
	}
}
