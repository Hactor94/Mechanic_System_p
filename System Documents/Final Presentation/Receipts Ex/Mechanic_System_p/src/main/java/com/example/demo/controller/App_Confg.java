package com.example.demo.controller;

import java.io.UnsupportedEncodingException;
import java.security.Principal;
import java.util.List;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.dao.Appointment_Repo;
import com.example.demo.dao.Clerk_Repo;
import com.example.demo.dao.Doctor_Repo;
import com.example.demo.dao.Patient_Repo;
import com.example.demo.dao.Payment_Repo;
import com.example.demo.dao.Service_Repo;
import com.example.demo.model.Appointment;
import com.example.demo.model.Clerk;
import com.example.demo.model.Doctor;
import com.example.demo.model.Patient;
import com.example.demo.model.Payment;
import com.example.demo.model.Services;
import com.sun.org.apache.bcel.internal.classfile.Utility;
import net.bytebuddy.utility.RandomString;

@Controller 
public class App_Confg { 
	@Autowired private PasswordEncoder passwordEncoder; @Autowired private Service_Repo service_repo;
	@Autowired private Doctor_Repo doctor_repo; @Autowired private Clerk_Repo clerk_repo; 
	@Autowired private Appointment_Repo appointment_repo; @Autowired private Patient_Repo patient_repo;
	@Autowired private Payment_Repo payment_repo; @Autowired private JavaMailSender mailSender;
	
	@RequestMapping("/") 
	public String home() {
		return "view";
	}
	@RequestMapping("/book_appointment_page")
	public ModelAndView appointment_page() {
		List<Doctor> doctors = doctor_repo.findAll();
		ModelAndView mv_doctors = new ModelAndView("book_appointment");
		mv_doctors.addObject("doctors", doctors);
		return mv_doctors;
	}
	@RequestMapping("/doctor_reg_page")
	public ModelAndView doctor_reg_page() {
		List<Services> services = service_repo.findAll();
		ModelAndView mv_doctor_page = new ModelAndView("doctor_registration");
		mv_doctor_page.addObject("services", services);
		return mv_doctor_page;
	}
	@RequestMapping("/login") 
	public String Login_Page() {  
		return "Login";
	}
	// Profile page  
	@RequestMapping("/user_profile") 
	public ModelAndView profile(Principal principal) {
			Doctor doctor_user; Clerk clerk_user;
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			ModelAndView mv_clerk_profile = new ModelAndView("clerk_profile");
			ModelAndView mv_doctor_profile = new ModelAndView("doctor_profile");
			ModelAndView mv_relog = new ModelAndView("redirect:/login");
			if (doctor_user == null && clerk_user == null) {
				return mv_relog;
			}
			if (doctor_user == null) {
				List<Clerk> clerk_list;
				clerk_list = clerk_repo.findAll();
				mv_clerk_profile.addObject("clerk_user", clerk_user);
				mv_clerk_profile.addObject("clerk_list", clerk_list);
				return mv_clerk_profile;
			}
			
			List<Doctor> doctor_list;
			doctor_list = doctor_repo.findAll();
			mv_doctor_profile.addObject("doctor_user", doctor_user);
			mv_doctor_profile.addObject("doctor_list", doctor_list);
			return mv_doctor_profile;
	}
	
	@RequestMapping("/edit_doctor_profile") 
	public ModelAndView edit_doctor_profile(Doctor doctor, Principal principal, Model model) {
		Doctor doctor_user = doctor_repo.findByEmail(principal.getName());
		ModelAndView doctor_profile_error = new ModelAndView("doctor_profile");
		ModelAndView doctor_profile = new ModelAndView("redirect:/user_profile");
		try {
			doctor_repo.save(doctor);
			return doctor_profile;
		} catch (Exception e) {
			List<Doctor> doctor_list;
			doctor_list = doctor_repo.findAll();
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			doctor_profile_error.addObject("doctor_list", doctor_list);
			doctor_profile_error.addObject("doctor_user", doctor_user);
			return doctor_profile_error;
		}
	}
	
	@RequestMapping("/edit_clerk_profile") 
	public ModelAndView edit_clerk_profile(Clerk clerk, Principal principal, Model model) {
		Clerk clerk_user = clerk_repo.findByEmail(principal.getName());
		ModelAndView clerk_profile_error = new ModelAndView("clerk_profile");
		ModelAndView clerk_profile = new ModelAndView("redirect:/user_profile");
		try {
			clerk_repo.save(clerk);
			return clerk_profile;
		} catch (Exception e) {
			List<Clerk> clerk_list;
			clerk_list = clerk_repo.findAll();
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			clerk_profile_error.addObject("clerk_list", clerk_list);
			clerk_profile_error.addObject("clerk_user", clerk_user);
			return clerk_profile_error;
		}
	}

	@RequestMapping("/direct_to_dashboard") 
	public String direct(Principal principal) {
		Doctor d_user;
		d_user = doctor_repo.findByEmail(principal.getName());
		if (d_user == null) {
			return "redirect:/clerk";
		}
		if (d_user.getRoleList().size() >= 2) {
			return "redirect:/doctor";
		}else {
			return "redirect:/doctor";
		}
	}
	@RequestMapping("/send_email")
	public String send_email(Appointment appointment, Principal principal, @RequestParam("patientId") int patientId) throws UnsupportedEncodingException, MessagingException {
		Patient patient = patient_repo.findById(patientId).orElse(null);
		Clerk user;
		user = clerk_repo.findByEmail(principal.getName());
		//Services services = service.findByServiceType(booking.getService_type());
		if (appointment.getAppointmentStatus() != null) {
			appointment.setPatient(patient);
			appointment.setClerk(user);
//			if (services != null) {car.setTotal_cost(services.getPrice());}
			appointment_repo.save(appointment);
			sendEmail(patient.getEmail());
		}
		return "redirect:/all_patients";
	}
	private void sendEmail(String email) throws UnsupportedEncodingException, MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("mkhonkosi28@gmail.com", "Health Center");
		helper.setTo(email);
		
		String subject = "Here's confirmation of doctor’s appointment ";
		String content = "<p> Hello, </p>"
				+ "<p> Your appointment request is confirmed, you can come to see the doctor to the date you specified when you book appointment. </p>";
		
		helper.setSubject(subject);
		helper.setText(content, true);
		
		mailSender.send(message);
	}
	// Clerk dashboard pages
	@RequestMapping("/clerk") 
	public ModelAndView clerk(Principal principal, Model clerk_model) {
		Clerk user;
		List<Appointment> appointment; List<Appointment> new_appointments; List<Appointment> under_con; List<Appointment> pending_payment; List<Appointment> ready_for_collect;
		List<Doctor> doctors = doctor_repo.findAll();
		
		user = clerk_repo.findByEmail(principal.getName());
		appointment = appointment_repo.findAll();
		new_appointments = appointment_repo.clerk_appointments("New Appointment", user.getStaffNumber());
		under_con = appointment_repo.clerk_appointments("Consideration", user.getStaffNumber());
		pending_payment = appointment_repo.clerk_appointments("Pending Payment", user.getStaffNumber()); 
		ready_for_collect = appointment_repo.clerk_appointments("Collect Medication", user.getStaffNumber());
		
		clerk_model.addAttribute("total_new_appointments", new_appointments.size());
		clerk_model.addAttribute("total_under_con", under_con.size());
		clerk_model.addAttribute("total_pending_payment", pending_payment.size());
		clerk_model.addAttribute("total_ready_cars", ready_for_collect.size());
		
		ModelAndView mv_clerk = new ModelAndView("clerk_console");
		
		mv_clerk.addObject("doctors", doctors);
		mv_clerk.addObject("appointment", appointment);
		mv_clerk.addObject("user", user);
		mv_clerk.addObject("new_appointments", new_appointments);
		mv_clerk.addObject("under_con", under_con); 
		mv_clerk.addObject("pending_payment", pending_payment);
		mv_clerk.addObject("ready_for_collect", ready_for_collect);
		
		return mv_clerk;
	}
	
	// Doctor dashboard pages
	@RequestMapping("/doctor")
	public ModelAndView doctor(Principal principal, Model doctor_model) {
		Doctor user;
		
		//All table lists
		List<Doctor> doctor;
		
		List<Appointment> appointment; List<Appointment> new_appointments; List<Appointment> consideration; List<Appointment> pending_payment; List<Appointment> ready_to_collect;
		//End table lists
		
		new_appointments = appointment_repo.findByAppointmentStatus("New Appointment");
		doctor = doctor_repo.findAll();
		appointment = appointment_repo.findAll();
		consideration = appointment_repo.findByAppointmentStatus("Consideration");
		pending_payment = appointment_repo.findByAppointmentStatus("Pending Payment");
		ready_to_collect = appointment_repo.findByAppointmentStatus("Collect Medication");
		
		user = doctor_repo.findByEmail(principal.getName());
		
		doctor_model.addAttribute("total_new_appointments", new_appointments.size());
		doctor_model.addAttribute("total_appointments", appointment.size());
		doctor_model.addAttribute("total_consideration", consideration.size());
		doctor_model.addAttribute("total_pending_payment", pending_payment.size());
		doctor_model.addAttribute("total_collections", ready_to_collect.size());
		
		ModelAndView mv_doctor = new ModelAndView("doctor_console");
		mv_doctor.addObject("user", user);
		mv_doctor.addObject("doctor", doctor);
		mv_doctor.addObject("appointment", appointment);
		mv_doctor.addObject("new_appointments", new_appointments);
		mv_doctor.addObject("consideration", consideration);
		mv_doctor.addObject("pending_payment", pending_payment);
		mv_doctor.addObject("ready_to_collect", ready_to_collect);
		return mv_doctor;
	}

	@RequestMapping("/patient_arrived")
	public String patient_arrived (Principal principal, @RequestParam("appointmentId") int appointmentId) { 
		Doctor user = doctor_repo.findByEmail(principal.getName());
		Appointment appointment = appointment_repo.findById(appointmentId).orElse(null);
		appointment.setAppointmentStatus("Consideration");
		appointment.setDoctor(user);
		appointment_repo.save(appointment);
		return "redirect:/doctor";
	}
	
	@RequestMapping("/remove_patient")
	public String remove_patient(@RequestParam(required = false) int appointmentId) { 
		Appointment appointment = appointment_repo.findById(appointmentId).orElse(null);
		appointment.setAppointmentStatus("New Appointment");
		appointment_repo.save(appointment);
		return "redirect:/doctor";
	}
	
	// All bookings Page
	@RequestMapping("/all_patients")
	public ModelAndView all_patients(Principal principal) {
		List<Patient> patients;
		Clerk user;
		
		user = clerk_repo.findByEmail(principal.getName());
		patients = patient_repo.findAll(); 
		
		ModelAndView mv_patients = new ModelAndView("all_patients");
		mv_patients.addObject("user", user);
		mv_patients.addObject("patients", patients);
		return mv_patients;
	}
	
//	@RequestMapping("/edit_appointment")
//	public ModelAndView edit_appointment(@RequestParam("booking_id") int booking_id) {
//		Client_Booking client;
//		List<Insurance_Company> insurance = crepo.findAll();
//		client = brepo.findById(booking_id).orElse(null); 
//				
//		ModelAndView client_bookings = new ModelAndView("edit_appointment");
//		client_bookings.addObject("client", client);
//		client_bookings.addObject("insurance", insurance);
//		return client_bookings;
//	}
	
	@RequestMapping("/book_appointment")
	public String book_appointment(Principal principal, Patient patient, Model model) {
		try {
			patient_repo.save(patient);
			Doctor doctor = null; Clerk clerk = null;
			if (principal != null) {
				doctor = doctor_repo.findByEmail(principal.getName());
				clerk = clerk_repo.findByEmail(principal.getName());
				}
				if (doctor != null) {
					return "redirect:/direct_to_dashboard";
				}else if (clerk != null) {
					return "redirect:/all_patients";
				}else {
					return "redirect:/";
				}
		} catch (Exception e) {
				String message = "The email address or phone number you are trying to book with is already booked the appointment.";
				model.addAttribute("booking_message", message);
				return "error_page";
			}
	}
	
//	@RequestMapping("/save_new")
//	public String edit_appointment(Principal principal, Client_Booking client) {
//		brepo.save(client);
//		Mechanic user;
//		user = mrepo.findByEmail(principal.getName());
//		if (user == null) {
//			return "redirect:/insurance_bookings";
//		}
//		return "redirect:/client_bookings";
//	}
//	
//	@RequestMapping("/delete")
//	public String delete (@RequestParam(required = false) int booking_id) { 
//		brepo.deleteById(booking_id);
//		return "redirect:/client_bookings";
//	}
	
	// Add New Doctor
	@RequestMapping("/add_new_doctor")
	public ModelAndView add_doctor(Doctor doctor, Principal principal, Model model) {
		List<Doctor> doctor_list; Doctor user;
		ModelAndView mv_doctor = new ModelAndView("add_new_doctor");
		user = doctor_repo.findByEmail(principal.getName());
		Doctor old_details = doctor_repo.findById(doctor.getStaffNumber()).orElse(new Doctor());
		if (old_details.getPassword() != null) {
				String message = "Doctor is already registered.";
				model.addAttribute("message", message);
				doctor_list = doctor_repo.new_doctors();
				if (doctor_list.size() >= 1) {
					mv_doctor.addObject("doctor_list", doctor_list);
				}
				mv_doctor.addObject("user", user);
				return mv_doctor;
			}
		if (old_details.getStaffNumber() == 0) { doctor_repo.delete(old_details); }
		try {
			if (doctor.getStaffNumber() != 0) {
				doctor.setActive(1);
				doctor_repo.save(doctor);
			}
			doctor_list = doctor_repo.new_doctors();
			if (doctor_list.size() >= 1) {
				mv_doctor.addObject("doctor_list", doctor_list);
			}
			mv_doctor.addObject("user", user);
			return mv_doctor;
		} catch (Exception e) {
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			doctor_list = doctor_repo.new_doctors();
			if (doctor_list.size() >= 1) {
				mv_doctor.addObject("doctor_list", doctor_list);
			}
			mv_doctor.addObject("user", user);
			return mv_doctor;
		}
	}
	
	// Doctor registration
	@RequestMapping("/doctor_registration")
	public ModelAndView doctor_registration(Doctor doctor, Model model) {
		ModelAndView mv_doctor_error = new ModelAndView("error_page");
		ModelAndView mv_doctor = new ModelAndView("redirect:/direct_to_dashboard");
		try {
 		Doctor old_details = doctor_repo.findById(doctor.getStaffNumber()).orElse(new Doctor());
 		
 			int active = old_details.getActive();
 			if (old_details.getStaffNumber() != 0 && active == 1 && old_details.getPassword() == null) {
 				doctor.setPassword(passwordEncoder.encode(doctor.getPassword()));
 				doctor.setActive(1);
 				doctor_repo.save(doctor);
 				return mv_doctor;
 				
 			}
 			if (old_details.getPassword() != null) {
 				String message = "You already registered to the system, please try to login or contact any admin doctor to help you";
 				model.addAttribute("message", message);
 				return mv_doctor_error;
 			}
 			if (old_details.getStaffNumber() == 0) {
 				String message = "Your staff number is not registered to use the system please contact any admin doctor to help you with your registration.";
 				model.addAttribute("message", message);
 				doctor_repo.delete(old_details);
 				return mv_doctor_error;
 			}
		} catch (Exception e) {
			String message = "The email address or phone number you are trying to register with is already registered to someone, Please try a different email address or phone number.";
			model.addAttribute("message", message);
			return mv_doctor_error;
		}
		String message = "Something went wrong while you tried to register please contact any admin doctor to help you with your registration.";
		model.addAttribute("message", message);
		return mv_doctor_error;
	}
	
	// Add New Clerk
	@RequestMapping("/add_new_clerk")
	public ModelAndView add_clerk(Clerk clerk, Principal principal, Model model) {
		List<Clerk> clerk_list; Doctor user;
		ModelAndView mv_clerk = new ModelAndView("add_new_clerk");
		user = doctor_repo.findByEmail(principal.getName());
		Clerk old_details = clerk_repo.findById(clerk.getStaffNumber()).orElse(new Clerk());
		if (old_details.getPassword() != null) {
				String message = "Clerk is already registered.";
				model.addAttribute("message", message);
				clerk_list = clerk_repo.new_clerks();
				if (clerk_list.size() >= 1) {
					mv_clerk.addObject("clerk_list", clerk_list);
				}
				mv_clerk.addObject("user", user);
				return mv_clerk;
			}
		if (old_details.getStaffNumber() == 0) { clerk_repo.delete(old_details); }
		try {
			if (clerk.getStaffNumber() != 0) {
				clerk.setActive(1);
				clerk_repo.save(clerk);
			}
			clerk_list = clerk_repo.new_clerks();
			if (clerk_list.size() >= 1) {
				mv_clerk.addObject("clerk_list", clerk_list);
			}
			mv_clerk.addObject("user", user);
			return mv_clerk;
		} catch (Exception e) {
			String message = "The email address or phone number is already registered to someone.";
			model.addAttribute("message", message);
			clerk_list = clerk_repo.new_clerks();
			if (clerk_list.size() >= 1) {
				mv_clerk.addObject("clerk_list", clerk_list);
			}
			mv_clerk.addObject("user", user);
			return mv_clerk;
		}
	}
	
	// Clerk registration
	@RequestMapping("/clerk_registration")
	public ModelAndView clerk_registration(Clerk clerk, Model model) {
		ModelAndView mv_clerk_error = new ModelAndView("error_page");
		ModelAndView mv_clerk = new ModelAndView("redirect:/direct_to_dashboard");
		try {
 		Clerk old_details = clerk_repo.findById(clerk.getStaffNumber()).orElse(new Clerk());
 		
 			int active = old_details.getActive();
 			if (old_details.getStaffNumber() != 0 && active == 1 && old_details.getPassword() == null) {
 				clerk.setPassword(passwordEncoder.encode(clerk.getPassword()));
 				clerk.setActive(1);
 				clerk_repo.save(clerk);
 				return mv_clerk;
 				
 			}
 			if (old_details.getPassword() != null) {
 				String message = "You already registered to the system, please try to login or contact any admin doctor to help you";
 				model.addAttribute("message", message);
 				return mv_clerk_error;
 			}
 			if (old_details.getStaffNumber() == 0) {
 				String message = "Your staff number is not registered to use the system please contact any admin doctor to help you with your registration.";
 				model.addAttribute("message", message);
 				clerk_repo.delete(old_details);
 				return mv_clerk_error;
 			}
		} catch (Exception e) {
			String message = "The email address or phone number you are trying to register with is already registered to someone, Please try a different email address or phone number.";
			model.addAttribute("message", message);
			return mv_clerk_error;
		}
		String message = "Something went wrong while you tried to register please contact any admin doctor to help you with your registration.";
		model.addAttribute("message", message);
		return mv_clerk_error;
	}

		// view doctors page
		@RequestMapping("/view_doctors")
		public ModelAndView all_doctors(Principal principal) {
			List<Doctor> doctor_list;
			Doctor doctor_user; Clerk clerk_user;
			
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			doctor_list = doctor_repo.findAll(); 
					
			ModelAndView mv_doctors = new ModelAndView("view_doctors");
			mv_doctors.addObject("doctor_user", doctor_user);
			mv_doctors.addObject("clerk_user", clerk_user);
			mv_doctors.addObject("doctor_list", doctor_list);
			return mv_doctors;
		}
		@RequestMapping("/general_practitioner")
		public ModelAndView general_practitioner(Principal principal) {
			List<Doctor> doctor_list;
			Doctor doctor_user; Clerk clerk_user;
			
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			doctor_list = doctor_repo.findByService(2020); 
					
			ModelAndView mv_doctors = new ModelAndView("view_doctors");
			mv_doctors.addObject("doctor_user", doctor_user);
			mv_doctors.addObject("clerk_user", clerk_user);
			mv_doctors.addObject("doctor_list", doctor_list);
			return mv_doctors;
		}
		@RequestMapping("/dentist")
		public ModelAndView dentist(Principal principal) {
			List<Doctor> doctor_list;
			Doctor doctor_user; Clerk clerk_user;
			
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			doctor_list = doctor_repo.findByService(2021);
					
			ModelAndView mv_doctors = new ModelAndView("view_doctors");
			mv_doctors.addObject("doctor_user", doctor_user);
			mv_doctors.addObject("clerk_user", clerk_user);
			mv_doctors.addObject("doctor_list", doctor_list);
			return mv_doctors;
		}
		@RequestMapping("/nephrologist")
		public ModelAndView nephrologist(Principal principal) {
			List<Doctor> doctor_list;
			Doctor doctor_user; Clerk clerk_user;
			
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			doctor_list = doctor_repo.findByService(2022); 
					
			ModelAndView mv_doctors = new ModelAndView("view_doctors");
			mv_doctors.addObject("doctor_user", doctor_user);
			mv_doctors.addObject("clerk_user", clerk_user);
			mv_doctors.addObject("doctor_list", doctor_list);
			return mv_doctors;
		}
		@RequestMapping("/neurologist")
		public ModelAndView neurologist(Principal principal) {
			List<Doctor> doctor_list;
			Doctor doctor_user; Clerk clerk_user;
			
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			doctor_list = doctor_repo.findByService(2023);
					
			ModelAndView mv_doctors = new ModelAndView("view_doctors");
			mv_doctors.addObject("doctor_user", doctor_user);
			mv_doctors.addObject("clerk_user", clerk_user);
			mv_doctors.addObject("doctor_list", doctor_list);
			return mv_doctors;
		}
		
		// view clerks page
		@RequestMapping("/view_clerks")
		public ModelAndView all_clerks(Principal principal) {
			List<Clerk> clerk_list;
			Doctor doctor_user; Clerk clerk_user;
			
			doctor_user = doctor_repo.findByEmail(principal.getName());
			clerk_user = clerk_repo.findByEmail(principal.getName());
			clerk_list = clerk_repo.findAll(); 
					
			ModelAndView mv_clerks = new ModelAndView("view_clerks");
			mv_clerks.addObject("doctor_user", doctor_user);
			mv_clerks.addObject("clerk_user", clerk_user);
			mv_clerks.addObject("clerk_list", clerk_list);
			return mv_clerks;
		}
		
		// Send report to insurance company
		@RequestMapping("/send_report")
		public ModelAndView send_report(Principal principal, @RequestParam("appointmentId") int appointmentId) {
			Doctor user = doctor_repo.findByEmail(principal.getName());
			Appointment appointment = appointment_repo.findById(appointmentId).orElse(null);
			List<Services> services = service_repo.findAll();
			ModelAndView mv_report_page = new ModelAndView("send_report");
			for (int i = 0; i < services.size(); i++) {
				if (services.get(i).getID() == appointment.getDoctor().getServices().getID()) {
					mv_report_page.addObject("services", services.get(i));
				}
			}
			mv_report_page.addObject("appointment", appointment);
			mv_report_page.addObject("user", user);
			return mv_report_page;
		}
		
		@RequestMapping("/confirm_payment")
		public String confirm_payment(@RequestParam("appointmentId") int appointmentId, Appointment appointment) {
			appointment = appointment_repo.findById(appointmentId).orElse(null);
			appointment.setAppointmentStatus("Collect Medication");
			appointment_repo.save(appointment);
			
			Payment payment = new Payment();
			payment.setAppointment(appointment);
			payment.setPayment_date(java.time.LocalDate.now());
			payment_repo.save(payment);
			
			return "redirect:/direct_to_dashboard";
		}
		
		@RequestMapping("/medication_collected")
		public String medication_collected(@RequestParam("appointmentId") int appointmentId, Appointment appointment) {
			appointment = appointment_repo.findById(appointmentId).orElse(null);
			appointment.setAppointmentStatus("Done");
			appointment_repo.save(appointment);
			return "redirect:/direct_to_dashboard";
		}
		
		@RequestMapping("/payments")
		public ModelAndView payment(Principal principal) {
			Clerk user = clerk_repo.findByEmail(principal.getName());
			List<Payment> payments = payment_repo.findAll();
			
			ModelAndView mv_payments = new ModelAndView("payments");
			mv_payments.addObject("user", user);
			mv_payments.addObject("payments", payments);
			return mv_payments;
		}
		
		@RequestMapping("/doctor_payments")
		public ModelAndView doctor_payments(Principal principal) {
			Doctor user = doctor_repo.findByEmail(principal.getName());
			List<Payment> payments = payment_repo.findbyDoctor(user.getStaffNumber());
			
			ModelAndView mv_payments = new ModelAndView("payments");
			mv_payments.addObject("user", user);
			mv_payments.addObject("payments", payments);
			return mv_payments;
		}
		@RequestMapping("/delete_doctor")
		public String delete_doctor(@RequestParam("staffNumber") int staffNumber) {
			Doctor doctor = doctor_repo.findById(staffNumber).orElse(null);
			doctor_repo.delete(doctor);
			return "redirect:/view_doctors";
		}
		@RequestMapping("/delete_clerk")
		public String delete_insurance(@RequestParam("staffNumber") int staffNumber) {
			Clerk clerk = clerk_repo.findById(staffNumber).orElse(null);
			clerk_repo.delete(clerk);
			return "redirect:/view_clerks";
		}
		@RequestMapping("/mute_doctor")
		public String mute_doctors(@RequestParam("staffNumber") int staffNumber) {
			Doctor doctor = doctor_repo.findById(staffNumber).orElse(null);
			if (doctor.getActive() == 1) {
				doctor.setActive(0);
			}else {
				doctor.setActive(1);
			}
			doctor_repo.save(doctor);
			return "redirect:/view_doctors";
		}
		@RequestMapping("/mute_clerk")
		public String mute_insurance(@RequestParam("staffNumber") int staffNumber) {
			Clerk clerk = clerk_repo.findById(staffNumber).orElse(null);
			if (clerk.getActive() == 1) {
				clerk.setActive(0);
			}else {
				clerk.setActive(1);
			}
			clerk_repo.save(clerk);
			return "redirect:/view_clerks";
		}
}
