package com.example.demo.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.sun.istack.NotNull;

@Entity 
public class Insurance_Company {
	
	@Id
	private int reg_number;
	@NotNull private String company_name;
	@NotNull private String admin_name;
	@NotNull
	@Column(unique = true) private String email;
	@NotNull 
	@Column(unique = true) private String phone;
	private String address;
	private String city;
	@NotNull private String country;
	private String zip_code;
	private String password;
	private String terms;
	@NotNull private int active;
	@NotNull private String roles = "INSURANCE";
	@NotNull private String permissions = "INSURANCE";
	
    @OneToMany(mappedBy = "insurance")
    private List<Car> cars;
    
    public Insurance_Company() {
	}
	public Insurance_Company(int reg_number, String company_name, String admin_name, String email, String phone,
			String address, String city, String country, String zip_code, String password, String terms, int active,
			String roles, String permissions) {
		super();
		this.reg_number = reg_number;
		this.company_name = company_name;
		this.admin_name = admin_name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.city = city;
		this.country = country;
		this.zip_code = zip_code;
		this.password = password;
		this.terms = terms;
		this.active = active;
		this.roles = roles;
		this.permissions = permissions;
	}
    
// Getters and Setters
    public List<Car> getCars() {
		return cars;
	}
	public void setCars(List<Car> cars) {
		this.cars = cars;
	} 
	public int getReg_number() {
		return reg_number;
	}
	public void setReg_number(int reg_number) {
		this.reg_number = reg_number;
	}
	public String getCompany_name() {
		return company_name;
	}
	public void setCompany_name(String company_name) {
		this.company_name = company_name;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
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
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getZip_code() {
		return zip_code;
	}
	public void setZip_code(String zip_code) {
		this.zip_code = zip_code;
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
		return "Insurance_Company [reg_number=" + reg_number + ", company_name=" + company_name + ", admin_name="
				+ admin_name + ", email=" + email + ", phone=" + phone + ", address=" + address + ", city=" + city
				+ ", country=" + country + ", zip_code=" + zip_code + ", password=" + password + ", terms=" + terms
				+ ", active=" + active + ", roles=" + roles + ", permissions=" + permissions + "]";
	}
	
	public Insurance_Company orElse(Insurance_Company insurance_Company) {
		return null;
	}
}
