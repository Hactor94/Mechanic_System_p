package com.example.demo.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import com.sun.istack.NotNull;

@Entity
public class Appointment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int appointmentId;
	@NotNull private double total_cost;
	@NotNull private String appointmentStatus;
	private String report;
	private String proof;
	
	@ManyToOne
	@JoinColumn(name = "fk_patient")
	private Patient patient;
	@ManyToOne
	@JoinColumn(name = "fk_clerk")
	private Clerk clerk;
	@ManyToOne
	@JoinColumn(name = "fk_doctor")
	private Doctor doctor;
	
	public int getAppointmentId() {
		return appointmentId;
	}
	public void setAppointmentId(int appointmentId) {
		this.appointmentId = appointmentId;
	}
	public double getTotal_cost() {
		return total_cost;
	}
	public void setTotal_cost(double total_cost) {
		this.total_cost = total_cost;
	}
	public String getAppointmentStatus() {
		return appointmentStatus;
	}
	public void setAppointmentStatus(String appointmentStatus) {
		this.appointmentStatus = appointmentStatus;
	}
	public String getReport() {
		return report;
	}
	public void setReport(String report) {
		this.report = report;
	}
	public String getProof() {
		return proof;
	}
	public void setProof(String proof) {
		this.proof = proof;
	}
	public Patient getPatient() {
		return patient;
	}
	public void setPatient(Patient patient) {
		this.patient = patient;
	}
	public Clerk getClerk() {
		return clerk;
	}
	public void setClerk(Clerk clerk) {
		this.clerk = clerk;
	}
	public Doctor getDoctor() {
		return doctor;
	}
	public void setDoctor(Doctor doctor) {
		this.doctor = doctor;
	}
	
	@Override
	public String toString() {
		return "Appointment [appointmentId=" + appointmentId + ", total_cost=" + total_cost + ", appointmentStatus="
				+ appointmentStatus + ", report=" + report + ", proof=" + proof + ", patient=" + patient + ", clerk="
				+ clerk + ", doctor=" + doctor + "]";
	}
}