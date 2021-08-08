package com.example.demo;

import java.security.Principal;
import java.util.List;

import javax.persistence.EntityExistsException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.ConstraintViolationException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Car_Repo;
import com.example.demo.dao.Client_Booking_Repo;
import com.example.demo.dao.Insurance_Company_Repo;
import com.example.demo.dao.Mechanic_Repo;
import com.example.demo.dao.Payment_Repo;
import com.example.demo.dao.Service_Repo;
import com.example.demo.model.Car;
import com.example.demo.model.Client_Booking;
import com.example.demo.model.Insurance_Company;
import com.example.demo.model.Mechanic;
import com.example.demo.model.Payment;
import com.example.demo.model.Services;
import com.example.demo.service.MechanicNotFoundException;
import com.example.demo.service.Password;
import com.example.demo.service.Service_S;
import com.sun.org.apache.bcel.internal.classfile.Utility;

import net.bytebuddy.utility.RandomString;

@Controller 
public class App_Confg { 
	
	@Autowired Client_Booking_Repo brepo; @Autowired Mechanic_Repo mrepo; @Autowired Insurance_Company_Repo crepo;
	@Autowired Car_Repo car_repo; @Autowired Payment_Repo pay_repo; private @Autowired Service_Repo service;
	@Autowired private PasswordEncoder passwordEncoder;
	
	@RequestMapping("/") 
	public String home() {
		return "view";
	}
	@RequestMapping("/appointment") 
	public ModelAndView book_appointment() {
		List<Insurance_Company> insurance = crepo.findAll();
		ModelAndView mv_insurance = new ModelAndView("book_appointment");
		mv_insurance.addObject("insurance", insurance);
		return mv_insurance;
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
			ModelAndView mv_insurance_profile = new ModelAndView("insurance_profile");
			ModelAndView mv_mechanic_profile = new ModelAndView("mechanic_profile");
			ModelAndView mv_relog = new ModelAndView("redirect:/login");
			if (mechanic_user == null && insurance_user == null) {
				return mv_relog;
			}
			if (mechanic_user == null) {
				List<Insurance_Company> insurance_list;
				insurance_list = crepo.findAll();
				mv_insurance_profile.addObject("insurance_user", insurance_user);
				mv_insurance_profile.addObject("insurance_list", insurance_list);
				return mv_insurance_profile;
			}
			
			List<Mechanic> mechanic_list;
			mechanic_list = mrepo.findAll();
			mv_mechanic_profile.addObject("mechanic_user", mechanic_user);
			mv_mechanic_profile.addObject("mechanic_list", mechanic_list);
			return mv_mechanic_profile;
	}
	@RequestMapping("/edit_mechanic_profile") 
	public ModelAndView edit_mechanic_profile(Mechanic mechanic, Principal principal, Model model) {
		Mechanic mechanic_user = mrepo.findByEmail(principal.getName());
		ModelAndView mechanic_profile_error = new ModelAndView("mechanic_profile");
		ModelAndView mechanic_profile = new ModelAndView("redirect:/user_profile");
		try {
			mrepo.save(mechanic);
			return mechanic_profile;
		} catch (Exception e) {
			List<Mechanic> mechanic_list;
			mechanic_list = mrepo.findAll();
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			mechanic_profile_error.addObject("mechanic_list", mechanic_list);
			mechanic_profile_error.addObject("mechanic_user", mechanic_user);
			return mechanic_profile_error;
		}
	}
	@RequestMapping("/edit_insurance_profile")
	public ModelAndView edit_insurance_profile(Insurance_Company insurance, Principal principal, Model model) {
			Insurance_Company insurance_user = crepo.findByEmail(principal.getName());
			ModelAndView insurance_profile_error = new ModelAndView("insurance_profile");
			ModelAndView insurance_profile = new ModelAndView("redirect:/user_profile");
		try {
			crepo.save(insurance);
			return insurance_profile;
		} catch (Exception e) {
			List<Insurance_Company> insurance_list;
			insurance_list = crepo.findAll();
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			insurance_profile_error.addObject("insurance_list", insurance_list);
			insurance_profile_error.addObject("insurance_user", insurance_user);
			return insurance_profile_error;
		}
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
	@RequestMapping("/mechanic")
	public ModelAndView mechanic(Principal principal, Model m_admin) {
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
		
		ModelAndView mv_admin = new ModelAndView("mechanic_console");
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
	public String assign_mechanic (Principal principal , @RequestParam("carId") int carId) { 
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
		Services services = service.findByServiceType(booking.getService_type());
		if (car.getCarStatus() != null) {
			car.setBooking(booking);
			if (services != null) {car.setTotal_cost(services.getPrice());}
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
		List<Insurance_Company> insurance = crepo.findAll();
		client = brepo.findById(booking_id).orElse(null); 
				
		ModelAndView client_bookings = new ModelAndView("edit_appointment");
		client_bookings.addObject("client", client);
		client_bookings.addObject("insurance", insurance);
		return client_bookings;
	}
	
	@RequestMapping("/book_appointment")
	public String book_appointment(Principal principal, Client_Booking client, Model model) {
		try {
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
		} catch (Exception e) {
				String message = "The email address or phone number you are trying to book with is already booked the appointment.";
				model.addAttribute("booking_message", message);
				return "error_page";
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
	public ModelAndView add_mechanic(Mechanic mechanic, Principal principal, Model model) {
		List<Mechanic> mechanic_list; Mechanic user;
		ModelAndView mv_mechanic = new ModelAndView("add_new_mechanic");
		user = mrepo.findByEmail(principal.getName());
		Mechanic old_details = mrepo.findById(mechanic.getStuff_number()).orElse(new Mechanic());
		if (old_details.getPassword() != null) {
				String message = "Employee already registered.";
				model.addAttribute("message", message);
				return mv_mechanic;
			}
		if (old_details.getStuff_number() == 0) { mrepo.delete(old_details); }
		try {
			if (mechanic.getStuff_number() != 0) {
				mechanic.setActive(1);
				mrepo.save(mechanic);
			}
			mechanic_list = mrepo.new_mechanics();
			if (mechanic_list.size() >= 1) {
				mv_mechanic.addObject("mechanic_list", mechanic_list);
			}
			mv_mechanic.addObject("user", user);
			return mv_mechanic;
		} catch (Exception e) {
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			
			mechanic_list = mrepo.new_mechanics();
			if (mechanic_list.size() >= 1) {
				mv_mechanic.addObject("mechanic_list", mechanic_list);
			}
			mv_mechanic.addObject("user", user);
			return mv_mechanic;
		}
	}
	
	@RequestMapping("/mechanic_registration")
	public ModelAndView mechanic_registration(Mechanic mechanic, Model model) {
		ModelAndView mv_mechanic_error = new ModelAndView("error_page");
		ModelAndView mv_mechanic = new ModelAndView("redirect:/direct_to_dashboard");
		try {
 		Mechanic old_details = mrepo.findById(mechanic.getStuff_number()).orElse(new Mechanic());
 		
 			int active = old_details.getActive();
 			if (old_details.getStuff_number() != 0 && active == 1 && old_details.getPassword() == null) {
 				mechanic.setPassword(passwordEncoder.encode(mechanic.getPassword()));
 				mechanic.setActive(1);
 				mrepo.save(mechanic);
 				return mv_mechanic;
 				
 			}
 			if (old_details.getPassword() != null) {
 				String message = "You already registered to the system, please try to login or contact any admin mechanic to help you";
 				model.addAttribute("message", message);
 				return mv_mechanic_error;
 			}
 			if (old_details.getStuff_number() == 0) {
 				String message = "Your staff number is not registered to use the system please contact any admin mechanic to help you with your registration.";
 				model.addAttribute("message", message);
 				mrepo.delete(old_details);
 				return mv_mechanic_error;
 			}
		} catch (Exception e) {
			String message = "The email address or phone number you are trying to register with is already registered to someone , Please try a different email address or phone number.";
			model.addAttribute("message", message);
			return mv_mechanic_error;
		}
		String message = "Something went wrong while you tried to register please contact any admin mechanic to help you with your registration.";
		model.addAttribute("message", message);
		return mv_mechanic_error;
	}
	
	// Insurance registration
		@RequestMapping("/add_new_insurance")
		public ModelAndView add_insurance(Insurance_Company insurance, Principal principal, Model model) {
			List<Insurance_Company> insurance_list; Mechanic user;
			ModelAndView mv_insurance = new ModelAndView("add_new_insurance");
			user = mrepo.findByEmail(principal.getName());
			
			Insurance_Company old_details = crepo.findById(insurance.getReg_number()).orElse(new Insurance_Company());
			if (old_details.getPassword() != null) {
					String message = "Insurance company already registered.";
					model.addAttribute("message", message);
					return mv_insurance;
				}
			if (old_details.getReg_number() == 0) { crepo.delete(old_details); }
			try {
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
			} catch (Exception e) {
				String message = "The email address or phone number is already registered to other insurance company.";
				model.addAttribute("message", message);
				
				insurance_list = crepo.new_insurances();
				if (insurance_list.size() >= 1) {
					mv_insurance.addObject("insurance_list", insurance_list);
				}
				mv_insurance.addObject("user", user);
				return mv_insurance;
			}
		}
		
		@RequestMapping("/insurance_registration")
		public ModelAndView insurance_registration(Insurance_Company insurance, Model model) {
			
			ModelAndView mv_insurance_error = new ModelAndView("error_page");
			ModelAndView mv_insurance = new ModelAndView("redirect:/direct_to_dashboard");
			try {
	 		Insurance_Company old_details = crepo.findById(insurance.getReg_number()).orElse(new Insurance_Company());
	 		
	 			int active = old_details.getActive();
	 			if (old_details.getReg_number() != 0 && active == 1 && old_details.getPassword() == null) {
	 				insurance.setPassword(passwordEncoder.encode(insurance.getPassword()));
	 				insurance.setActive(1);
	 				crepo.save(insurance);
	 				return mv_insurance;
	 			}
	 			if (old_details.getPassword() != null) {
	 				String message = "You already registered to the system.";
	 				model.addAttribute("message", message);
	 				return mv_insurance_error;
	 			}
	 			if (old_details.getReg_number() == 0) {
	 				String message = "Your staff number is not registered to use the system please contact any admin mechanic to help you with your registration.";
	 				model.addAttribute("message", message);
	 				crepo.delete(old_details);
	 				return mv_insurance_error;
	 			}
			} catch (Exception e) {
				String message = "The email address or phone number you are trying to register with is already registered, Please try a different email address or phone number.";
				model.addAttribute("message", message);
				return mv_insurance_error;
			}
			String message = "Something went wrong while you tried to register please contact any admin mechanic to help you with your registration.";
			model.addAttribute("message", message);
			return mv_insurance_error;
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
		
		// Send proof of payment to mechanic company
		@RequestMapping("/send_proof")
		public ModelAndView send_proof(Principal principal, @RequestParam("carId") int carId) {
			Car car = null;
			Insurance_Company user = crepo.findByEmail(principal.getName());
			car = car_repo.findById(carId).orElse(null);
			
			ModelAndView mv_proof_page = new ModelAndView("send_proof");
			mv_proof_page.addObject("car", car);
			mv_proof_page.addObject("user", user);
			return mv_proof_page;
		}
		
		@RequestMapping("/confirm_payment")
		public String confirm_payment(@RequestParam("carId") int carId, Car car) {
			car = car_repo.findById(carId).orElse(null);
			car.setCarStatus("Ready For Collection");
			car_repo.save(car);
			
			Payment payment = new Payment();
			payment.setCar(car);
			payment.setPayment_date(java.time.LocalDate.now());
			pay_repo.save(payment);
			
			return "redirect:/direct_to_dashboard";
		}
		
		@RequestMapping("/car_is_collected")
		public String car_is_collected(@RequestParam("carId") int carId, Car car) {
			car = car_repo.findById(carId).orElse(null);
			car.setCarStatus("Collected");
			car_repo.save(car);
			return "redirect:/direct_to_dashboard";
		}
		
		@RequestMapping("/payments")
		public ModelAndView payment(Principal principal) {
			Mechanic user = mrepo.findByEmail(principal.getName());
			List<Payment> payments = pay_repo.findAll();
			
			ModelAndView mv = new ModelAndView("payments");
			mv.addObject("user", user);
			mv.addObject("payments", payments);
			return mv;
		}
		@RequestMapping("/delete_mechanic")
		public String delete_mechanic(@RequestParam("stuff_number") int stuff_number) {
			Mechanic mechanic = mrepo.findById(stuff_number).orElse(null);
			mrepo.delete(mechanic);
			return "redirect:/view_mechanics";
		}
		@RequestMapping("/delete_insurance")
		public String delete_insurance(@RequestParam("reg_number") int reg_number) {
			Insurance_Company insurance = crepo.findById(reg_number).orElse(null);
			crepo.delete(insurance);
			return "redirect:/view_insurances";
		}
		@RequestMapping("/mute_mechanic")
		public String mute_mechanic(@RequestParam("stuff_number") int stuff_number) {
			Mechanic mechanic = mrepo.findById(stuff_number).orElse(null);
			if (mechanic.getActive() == 1) {
				mechanic.setActive(0);
			}else {
				mechanic.setActive(1);
			}
			mrepo.save(mechanic);
			return "redirect:/view_mechanics";
		}
		@RequestMapping("/mute_insurance")
		public String mute_insurance(@RequestParam("reg_number") int reg_number) {
			Insurance_Company insurance = crepo.findById(reg_number).orElse(null);
			if (insurance.getActive() == 1) {
				insurance.setActive(0);
			}else {
				insurance.setActive(1);
			}
			crepo.save(insurance);
			return "redirect:/view_insurances";
		}
}
