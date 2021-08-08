package com.example.demo.model;


import java.sql.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.sun.istack.NotNull;

@Entity 
public class Patient {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "patient_id") private int patientId;
	@NotNull 
	@Column(name = "first_name") private String fname;
	@NotNull 
	@Column(name = "last_name") private String lname;
	@NotNull 
	@Column(name = "date_of_birth") private Date dob;
	@NotNull 
	@Column(unique = true, name = "email") private String email;
	@NotNull 
	@Column(unique = true, name = "phone") private String phone;
	@Column(name = "alternative_phone") private String altPhone;
	@NotNull
	@Column(name = "appointment_date") private Date appointmentDate;
	@NotNull
	@Column(name = "doctor") private String doctor;
	@NotNull
	@Column(name = "message") private String massage;
	
	@OneToMany(mappedBy = "patient")
	private List<Appointment> appointment;
	
	public List<Appointment> getAppointment() {
		return appointment;
	}
	public void setAppointment(List<Appointment> appointment) {
		this.appointment = appointment;
	}
	
	public int getPatientId() {
		return patientId;
	}
	public void setPatientId(int patientId) {
		this.patientId = patientId;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public Date getDob() {
		return dob;
	}
	public void setDob(Date dob) {
		this.dob = dob;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAltPhone() {
		return altPhone;
	}
	public void setAltPhone(String altPhone) {
		this.altPhone = altPhone;
	}
	public Date getAppointmentDate() {
		return appointmentDate;
	}
	public void setAppointmentDate(Date appointmentDate) {
		this.appointmentDate = appointmentDate;
	}
	public String getDoctor() {
		return doctor;
	}
	public void setDoctor(String doctor) {
		this.doctor = doctor;
	}
	public String getMassage() {
		return massage;
	}
	public void setMassage(String massage) {
		this.massage = massage;
	}
	
	@Override
	public String toString() {
		return "Appointment [patientId=" + patientId + ", fname=" + fname + ", lname=" + lname + ", dob=" + dob
				+ ", email=" + email + ", phone=" + phone + ", altPhone=" + altPhone + ", appointmentDate="
				+ appointmentDate + ", doctor=" + doctor + ", massage=" + massage + "]";
	}		
}
