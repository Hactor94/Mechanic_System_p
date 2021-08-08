package com.example.demo.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToMany;

@Entity 
public class Mechanic {
	
	@Id
	private int stuff_number;
	private String fname;
	private String lname;
	private Date date_of_birth;
	private int phone;
	private String email;
	private String gender; 
	//private String about_me;
	private String password;
	private String terms;
	private int active = 1;
	private String roles = "MECHANIC";
    private String permissions = "MECHANIC";
	
	@ManyToMany(mappedBy = "mechanic") 
	private List<Service> service; 
	
	public Mechanic() {
	}
	public Mechanic(int stuff_number, String fname, String lname, Date date_of_birth, int phone, String email,
			String gender,/* String about_me, */ String password, String terms, int active,
			String roles, String permissions) {
		super();
		this.stuff_number = stuff_number;
		this.fname = fname;
		this.lname = lname;
		this.date_of_birth = date_of_birth;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		//this.about_me = about_me;
		this.password = password; 
		this.terms = terms;
		this.active = active;
		this.roles = roles;
		this.permissions = permissions;
	}
	
	// Getters and Setters
	/*
	 * public String getAbout_me() { return about_me; } public void
	 * setAbout_me(String about_me) { this.about_me = about_me; }
	 */
    public int getStuff_number() {
		return stuff_number;
	}
	public void setStuff_number(int stuff_number) {
		this.stuff_number = stuff_number;
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
	public Date getDate_of_birth() {
		return date_of_birth;
	}
	public void setDate_of_birth(Date date_of_birth) {
		this.date_of_birth = date_of_birth;
	}
	public int getPhone() {
		return phone;
	}
	public void setPhone(int phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getTerms() {
		return terms;
	}
	public void setTerms(String terms) {
		this.terms = terms;
	}
	public int getActive() {
		return active;
	}
	public void setActive(int active) {
		this.active = active;
	}
	public String getRoles() {
		return roles;
	}
	public void setRoles(String roles) {
		this.roles = roles;
	}
	public String getPermissions() {
		return permissions;
	}
	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}
	public List<Service> getService() {
		return service;
	}
	public void setService(List<Service> service) {
		this.service = service;
	}
	
	public List<String> getRoleList(){
		if(this.roles.length() > 0){
			return Arrays.asList(this.roles.split(","));
       }
        return new ArrayList<>();
    }
	public List<String> getPermissionList(){
        if(this.permissions.length() > 0){
            return Arrays.asList(this.permissions.split(","));
        }
        return new ArrayList<>();
    }
	
	// toString method 
	@Override
	public String toString() {
		return "Mechanic [stuff_number=" + stuff_number + ", fname=" + fname + ", lname=" + lname + ", date_of_birth="
				+ date_of_birth + ", phone=" + phone + ", email=" + email + ", gender=" + gender + ", password=" 
				+ password + ", terms=" + terms + ", active=" + active + ", roles=" + roles
				+ ", permissions=" + permissions + ", service=" + service + "]";
	}	
	
	// or Else return new mechanic method 
	public Mechanic orElse(Mechanic mechanic) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
