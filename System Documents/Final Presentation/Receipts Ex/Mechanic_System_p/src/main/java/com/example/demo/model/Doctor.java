package com.example.demo.model;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import com.sun.istack.NotNull;

@Entity
public class Doctor {
	@Id
	@Column(name = "Staff_Number") private int StaffNumber;
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
	@NotNull 
	@Column(name = "gender") private String gender;
	@NotNull 
	@Column(name = "password") private String password;
	@Column(name = "reset_password_token", length = 45) private String resetPasswordToken;
	@NotNull 
	@Column(name = "terms") private String terms;
	@NotNull private int active = 1;
	@NotNull private String roles = "DOCTOR";
	@NotNull private String permissions = "DOCTOR";
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "fk_service")
    private Services services;
	
	public Doctor() {
	}
	public Doctor(int StaffNumber, String fname, String lname, Date dob, String phone, String email, String gender, 
			String password, String terms, int active, String roles, String permissions) {
		super();
		this.StaffNumber = StaffNumber;
		this.fname = fname;
		this.lname = lname;
		this.dob = dob;
		this.phone = phone;
		this.email = email;
		this.gender = gender;
		this.password = password; 
		this.terms = terms;
		this.active = active;
		this.roles = roles;
		this.permissions = permissions;
	}
	
	public int getStaffNumber() {
		return StaffNumber;
	}
	public void setStaffNumber(int staffNumber) {
		StaffNumber = staffNumber;
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
	public String getResetPasswordToken() {
		return resetPasswordToken;
	}
	public void setResetPasswordToken(String resetPasswordToken) {
		this.resetPasswordToken = resetPasswordToken;
	}
	public Services getServices() {
		return services;
	}
	public void setServices(Services services) {
		this.services = services;
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
	
	@Override
	public String toString() {
		return "Doctor [StaffNumber=" + StaffNumber + ", fname=" + fname + ", lname=" + lname + ", dob=" + dob
				+ ", email=" + email + ", phone=" + phone + ", gender=" + gender + ", password=" + password
				+ ", resetPasswordToken=" + resetPasswordToken + ", terms=" + terms + ", active=" + active + ", roles="
				+ roles + ", permissions=" + permissions + "]";
	}
}
