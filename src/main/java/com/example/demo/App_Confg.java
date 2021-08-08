package com.example.demo;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.CacheControl;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.S3Object;
import com.amazonaws.services.s3.model.S3ObjectInputStream;
import com.example.demo.dao.Car_Repo;
import com.example.demo.dao.Client_Booking_Repo;
import com.example.demo.dao.Insurance_Company_Repo;
import com.example.demo.dao.Mechanic_Repo;
import com.example.demo.model.Car;
import com.example.demo.model.Client_Booking;
import com.example.demo.model.Insurance_Company;
import com.example.demo.model.Mechanic;

@Controller 
public class App_Confg { 
	
	@Autowired Client_Booking_Repo brepo; @Autowired Mechanic_Repo mrepo; @Autowired Insurance_Company_Repo crepo;
	@Autowired Car_Repo car_repo; 
	@Autowired private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/") 
	public String home() {
		return "view";
	}
	@RequestMapping("/appointment") 
	public String book_appointment() {
		return "book_appointment";
	}
	@RequestMapping("/about") 
	public String about() {  
		return "about";
	}
	@RequestMapping("/service") 
	public String services() {  
		return "services";  
	}
	@RequestMapping("/contact")
	public String contact() {
		return "contact";
	}
	@RequestMapping("/login") 
	public String Login_Page() {  
		return "Login";
	}
	
	// Profile page  
	@RequestMapping("/user_profile") 
	public ModelAndView profile(Principal principal) {
			Mechanic mechanic_user; Insurance_Company insurance_user;
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			
			if (mechanic_user == null) {
				List<Insurance_Company> insurance_list;
				insurance_list = crepo.findAll();
				ModelAndView mv_user_profile = new ModelAndView("insurance_profile");
				mv_user_profile.addObject("insurance_user", insurance_user);
				mv_user_profile.addObject("insurance_list", insurance_list);
				return mv_user_profile;
			}
			
			List<Mechanic> mechanic_list;
			mechanic_list = mrepo.findAll();
			ModelAndView mv_user_profile = new ModelAndView("mechanic_profile");
			mv_user_profile.addObject("mechanic_user", mechanic_user);
			mv_user_profile.addObject("mechanic_list", mechanic_list);
			return mv_user_profile;
	}
	@RequestMapping("/edit_mechanic_profile") 
	public String edit_mechanic_profile(Mechanic mechanic) {
			mrepo.save(mechanic);
			return "redirect:/user_profile";
	}
	@RequestMapping("/edit_insurance_profile") 
	public String edit_insurance_profile(Insurance_Company insurance) {
			crepo.save(insurance);
			return "redirect:/user_profile";
	}

	@RequestMapping("/direct_to_dashboard") 
	public String direct(Principal principal) {
		Mechanic m_user;
		m_user = mrepo.findByEmail(principal.getName());
		if (m_user == null) {
			return "redirect:/insurance_company";
		}
		if (m_user.getRoleList().size() >= 2) {
			return "redirect:/admin";
		}else {
			return "redirect:/admin";
		}
	}
	// Insurance Company dashboard pages
	@RequestMapping("/insurance_company") 
	public ModelAndView insurance_company(Principal principal, Model m_insurance) {
		Insurance_Company user;
		List<Car> car; List<Car> new_cars; List<Car> under_con; List<Car> pending_payment; List<Car> ready_for_collect;
		
		user = crepo.findByEmail(principal.getName());
		car = car_repo.findAll();
		new_cars = car_repo.insurance_cars("New Car", user.getReg_number());
		under_con = car_repo.insurance_cars("Under Consideration", user.getReg_number());
		pending_payment = car_repo.insurance_cars("Pending Payment", user.getReg_number()); 
		ready_for_collect = car_repo.insurance_cars("Ready For Collection", user.getReg_number());
		
		m_insurance.addAttribute("total_new_cars", new_cars.size());
		m_insurance.addAttribute("total_under_con", under_con.size());
		m_insurance.addAttribute("total_pending_payment", pending_payment.size());
		m_insurance.addAttribute("total_ready_cars", ready_for_collect.size());
		
		ModelAndView mv_insurance = new ModelAndView("insurance_console");
		
		mv_insurance.addObject("car", car);
		mv_insurance.addObject("user", user);
		mv_insurance.addObject("new_cars", new_cars);
		mv_insurance.addObject("under_con", under_con); 
		mv_insurance.addObject("pending_payment", pending_payment);
		mv_insurance.addObject("ready_for_collect", ready_for_collect);
		
		return mv_insurance;
	}
	
	// Admin dashboard pages
	@RequestMapping("/admin")
	public ModelAndView admin(Principal principal, Model m_admin) {
		Mechanic user;
		
		//All table lists
		List<Mechanic> mechanic;
		
		List<Car> car; List<Car> new_cars; List<Car> car_consideration; List<Car> car_pending_payment; List<Car> car_ready_for_collect;
		//End table lists
		
		new_cars = car_repo.findByCarStatus("New Car");
		mechanic = mrepo.findAll();
		car = car_repo.findAll();
		car_consideration = car_repo.findByCarStatus("Under Consideration");
		car_pending_payment = car_repo.findByCarStatus("Pending Payment");
		car_ready_for_collect = car_repo.findByCarStatus("Ready For Collection");
		
		user = mrepo.findByEmail(principal.getName());
		
		m_admin.addAttribute("total_new_cars", new_cars.size());
		m_admin.addAttribute("total_cars", car.size());
		m_admin.addAttribute("total_under_con", car_consideration.size());
		m_admin.addAttribute("total_pending_payment", car_pending_payment.size());
		m_admin.addAttribute("total_ready_cars", car_ready_for_collect.size());
		
		ModelAndView mv_admin = new ModelAndView("admin_console");
		mv_admin.addObject("user", user);
		mv_admin.addObject("mechanic", mechanic);
		mv_admin.addObject("car", car);
		mv_admin.addObject("new_cars", new_cars);
		mv_admin.addObject("car_consideration", car_consideration);
		mv_admin.addObject("car_pending_payment", car_pending_payment);
		mv_admin.addObject("car_ready_for_collect", car_ready_for_collect);
		return mv_admin;
	}
	
	@RequestMapping("/assign_mechanic")
	public String assign_mechanic (Principal principal ,@RequestParam("carId") int carId) { 
		Mechanic user; Car car;
		String username;
		
		username = principal.getName();
		user = mrepo.findByEmail(username);
		car = car_repo.findById(carId).orElse(null);
		
		car.setCarStatus("Under Consideration");
		car.setMechanic(user);
		car_repo.save(car);
		return "redirect:/admin";
	}
	
	@RequestMapping("/remove_car")
	public String delete_car(@RequestParam(required = false) int carId) { 
		Car car = car_repo.findById(carId).orElse(null);
		car.setMechanic(null);
		car.setCarStatus("New Car");
		car_repo.save(car);
		return "redirect:/admin";
	}
	
	// All bookings Page
	@RequestMapping("/client_bookings")
	public ModelAndView client_bookings(Principal principal) {
		List<Client_Booking> bookings;
		Mechanic user;
		
		user = mrepo.findByEmail(principal.getName());
		bookings = brepo.findAll(); 
		
		ModelAndView client_bookings = new ModelAndView("all_client_bookings");
		client_bookings.addObject("user", user);
		client_bookings.addObject("bookings", bookings);
		return client_bookings;
	}
	
	@RequestMapping("/add_car")
	public String add_car(Car car, @RequestParam("booking_id") int booking_id) {
		
		Client_Booking booking = brepo.findById(booking_id).orElse(null);
		if (car.getCarStatus() != null) {
			car.setBooking(booking);
			car_repo.save(car);
		}
		return "redirect:/client_bookings";
	}
	
	@RequestMapping("/insurance_bookings")
	public ModelAndView insurance_bookings(Principal principal) {
		List<Car> bookings;
		Insurance_Company user; 
		
		user = crepo.findByEmail(principal.getName());
		bookings = car_repo.findByInsurance(user.getReg_number());
		
		ModelAndView insurance_bookings = new ModelAndView("insurance_bookings");
		insurance_bookings.addObject("user", user);
		insurance_bookings.addObject("bookings", bookings);
		return insurance_bookings;
	}
	
	@RequestMapping("/edit_appointment")
	public ModelAndView edit_appointment(@RequestParam("booking_id") int booking_id) {
		Client_Booking client;
		
		client = brepo.findById(booking_id).orElse(null); 
				
		ModelAndView client_bookings = new ModelAndView("edit_appointment");
		client_bookings.addObject("client", client);
		return client_bookings;
	}
	
	@RequestMapping("/book_appointment")
	public String book_appointment(Principal principal, Client_Booking client) {
		brepo.save(client);
		Mechanic mechanic = null; Insurance_Company insurance = null;
		if (principal != null) {
		mechanic = mrepo.findByEmail(principal.getName());
		insurance = crepo.findByEmail(principal.getName());
		}
		if (mechanic != null) {
			return "redirect:/client_bookings";
		}else if (insurance != null) {
			return "redirect:/insurance_bookings";
		}else {
			return "redirect:/";
		}
	}
	
	@RequestMapping("/save_new")
	public String edit_appointment(Principal principal, Client_Booking client) {
		brepo.save(client);
		Mechanic user;
		user = mrepo.findByEmail(principal.getName());
		if (user == null) {
			return "redirect:/insurance_bookings";
		}
		return "redirect:/client_bookings";
	}
	
	@RequestMapping("/delete")
	public String delete (@RequestParam(required = false) int booking_id) { 
		brepo.deleteById(booking_id);
		return "redirect:/client_bookings";
	}
	
	// Mechanic registration
	@RequestMapping("/add_new_mechanic")
	public ModelAndView add_mechanic(Mechanic mechanic, Principal principal) {
		List<Mechanic> mechanic_list; Mechanic user;
		ModelAndView mv_mechanic = new ModelAndView("add_new_mechanic");
		user = mrepo.findByEmail(principal.getName());
		if (mechanic.getStuff_number() != 0) {
			mrepo.save(mechanic);
		}
		mechanic_list = mrepo.new_mechanics();
		if (mechanic_list.size() >= 1) {
			mv_mechanic.addObject("mechanic_list", mechanic_list);
		}
		mv_mechanic.addObject("user", user);
		return mv_mechanic;
	}
	
	@RequestMapping("/mechanic_registration")
	public ModelAndView mechanic_registration(Mechanic mechanic) {
		
		Mechanic old_details = mrepo.findById(mechanic.getStuff_number()).orElse(null);
		if (old_details != null) {
			ModelAndView mv_mechanic = new ModelAndView("Login");
			mechanic.setPassword(passwordEncoder.encode(mechanic.getPassword()));
			mrepo.save(mechanic);
			return mv_mechanic;
		}
		ModelAndView mv_mechanic = new ModelAndView("mechanic_registration");
		return mv_mechanic;
	}
	
	// Insurance registration
		@RequestMapping("/add_new_insurance")
		public ModelAndView add_insurance(Insurance_Company insurance, Principal principal) {
			List<Insurance_Company> insurance_list; Mechanic user;
			ModelAndView mv_insurance = new ModelAndView("add_new_insurance");
			user = mrepo.findByEmail(principal.getName());
			if (insurance.getReg_number() != 0) {
				insurance.setActive(1);
				crepo.save(insurance);	
			}
			insurance_list = crepo.new_insurances();
			if (insurance_list.size() >= 1) {
				mv_insurance.addObject("insurance_list", insurance_list);
			}
			mv_insurance.addObject("user", user);
			return mv_insurance;
		}
		
		@RequestMapping("/insurance_registration")
		public ModelAndView insurance_registration(Insurance_Company insurance) {
			
			Insurance_Company old_details = crepo.findById(insurance.getReg_number()).orElse(null);
			if (old_details != null) {
				ModelAndView mv_insurance = new ModelAndView("Login");
				insurance.setPassword(passwordEncoder.encode(insurance.getPassword()));
				crepo.save(insurance);
				return mv_insurance;
			}
			ModelAndView mv_insurance = new ModelAndView("insurance_registration");
			return mv_insurance;
		}
		
		// view mechanics page
		@RequestMapping("/view_mechanics")
		public ModelAndView all_mechanics(Principal principal) {
			List<Mechanic> mechanic_list;
			Mechanic mechanic_user; Insurance_Company insurance_user;
			
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			mechanic_list = mrepo.findAll(); 
					
			ModelAndView mv_mechanics = new ModelAndView("view_mechanics");
			mv_mechanics.addObject("mechanic_user", mechanic_user);
			mv_mechanics.addObject("insurance_user", insurance_user);
			mv_mechanics.addObject("mechanic_list", mechanic_list);
			return mv_mechanics;
		}
		@RequestMapping("/engine_mechanics")
		public ModelAndView Engine_mechanics(Principal principal) {
			List<Mechanic> mechanic_list;
			Mechanic mechanic_user; Insurance_Company insurance_user;
			
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			mechanic_list = mrepo.findByService("Engine Maintenance"); 
					
			ModelAndView mv_mechanics = new ModelAndView("view_mechanics");
			mv_mechanics.addObject("mechanic_user", mechanic_user);
			mv_mechanics.addObject("insurance_user", insurance_user);
			mv_mechanics.addObject("mechanic_list", mechanic_list);
			return mv_mechanics;
		}
		@RequestMapping("/wheel_alignment")
		public ModelAndView wheel_mechanics(Principal principal) {
			List<Mechanic> mechanic_list;
			Mechanic mechanic_user; Insurance_Company insurance_user;
			
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			mechanic_list = mrepo.findByService("Wheel Alignment"); 
					
			ModelAndView mv_mechanics = new ModelAndView("view_mechanics");
			mv_mechanics.addObject("mechanic_user", mechanic_user);
			mv_mechanics.addObject("insurance_user", insurance_user);
			mv_mechanics.addObject("mechanic_list", mechanic_list);
			return mv_mechanics;
		}
		@RequestMapping("/air_condition_services")
		public ModelAndView air_mechanics(Principal principal) {
			List<Mechanic> mechanic_list;
			Mechanic mechanic_user; Insurance_Company insurance_user;
			
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			mechanic_list = mrepo.findByService("Air Condition Services"); 
					
			ModelAndView mv_mechanics = new ModelAndView("view_mechanics");
			mv_mechanics.addObject("mechanic_user", mechanic_user);
			mv_mechanics.addObject("insurance_user", insurance_user);
			mv_mechanics.addObject("mechanic_list", mechanic_list);
			return mv_mechanics;
		}
		@RequestMapping("/repair_and_replacement")
		public ModelAndView Repair_Replacement(Principal principal) {
			List<Mechanic> mechanic_list;
			Mechanic mechanic_user; Insurance_Company insurance_user;
			
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			mechanic_list = mrepo.findByService("Transmission Repair And Replacement"); 
					
			ModelAndView mv_mechanics = new ModelAndView("view_mechanics");
			mv_mechanics.addObject("mechanic_user", mechanic_user);
			mv_mechanics.addObject("insurance_user", insurance_user);
			mv_mechanics.addObject("mechanic_list", mechanic_list);
			return mv_mechanics;
		}
		// view insurance companies page
		@RequestMapping("/view_insurances")
		public ModelAndView view_insurances(Principal principal) {
			List<Insurance_Company> insurance_list;
			Mechanic mechanic_user; Insurance_Company insurance_user;
					
			mechanic_user = mrepo.findByEmail(principal.getName());
			insurance_user = crepo.findByEmail(principal.getName());
			insurance_list = crepo.findAll();
							
			ModelAndView mv_insurance = new ModelAndView("view_insurances");
			mv_insurance.addObject("mechanic_user", mechanic_user);
			mv_insurance.addObject("insurance_user", insurance_user);
			mv_insurance.addObject("insurance_list", insurance_list);
			return mv_insurance;
		}
		
		// Send report to insurance company
		@RequestMapping("/send_report")
		public ModelAndView send_report(Principal principal, @RequestParam("carId") int carId) {
			Car car = null;
			Mechanic user = mrepo.findByEmail(principal.getName());
			car = car_repo.findById(carId).orElse(null);
			
			ModelAndView mv_report_page = new ModelAndView("send_report");
			mv_report_page.addObject("car", car);
			mv_report_page.addObject("user", user);
			
			return mv_report_page;
		}
		
		@RequestMapping("/confirm_payment")
		public String confirm_payment(@RequestParam("carId") int carId, Car car) {
			car = car_repo.findById(carId).orElse(null);
			car.setCarStatus("Ready For Collection");
			car_repo.save(car);
			return "redirect:/direct_to_dashboard";
		}
		
		@RequestMapping("/car_is_collected")
		public String car_is_collected(@RequestParam("carId") int carId, Car car) {
			car = car_repo.findById(carId).orElse(null);
			car.setCarStatus("Collected");
			car_repo.save(car);
			return "redirect:/direct_to_dashboard";
		}
}
