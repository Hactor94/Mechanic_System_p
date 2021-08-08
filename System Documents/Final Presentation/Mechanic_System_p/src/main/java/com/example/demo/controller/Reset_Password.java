package com.example.demo.controller;

import java.io.UnsupportedEncodingException;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.Utility;
import com.example.demo.dao.Mechanic_Repo;
import com.example.demo.model.Mechanic;
import com.example.demo.service.MechanicNotFoundException;
import com.example.demo.service.Password;
import net.bytebuddy.utility.RandomString;

@Controller
public class Reset_Password {
	@Autowired private Password password_service;
	@Autowired private Mechanic_Repo mechanic_repo;
	@Autowired private JavaMailSender mailSender;
	
	@GetMapping("/forgot_password")
	public String showForgotPasswordForm(Model model) {
		model.addAttribute("pageTitle", "Forgot Password");
		return "forgot_password_form";
	}
	@PostMapping("/forgot_password")
	public String processForgotPassword(HttpServletRequest request, Model model) {
		String email = request.getParameter("email");
		String token = RandomString.make(45);
		
		try {
			password_service.updateResetPasswordToken(token, email);
			// Generate reset password link 
			String resetPasswordLink = Utility.getSiteURL(request) + "/reset_password?token=" + token;
			// Send email
			sendEmail(email, resetPasswordLink);
			model.addAttribute("message", "We have sent a reset password link to you email.");
		} catch (MechanicNotFoundException e) {
			model.addAttribute("error", e.getMessage());
		} catch (UnsupportedEncodingException | MessagingException ex) {
			model.addAttribute("error", "Error while sending email.");
		}
		
		//System.out.println(resetPasswordLink);
		model.addAttribute("pageTitle", "Forgot Password");
		return "forgot_password_form";
	}
	private void sendEmail(String email, String resetPasswordLink) throws UnsupportedEncodingException, MessagingException {
		MimeMessage message = mailSender.createMimeMessage();
		MimeMessageHelper helper = new MimeMessageHelper(message);
		helper.setFrom("mkhonkosi28@gmail.com", "Mechanic Shop");
		helper.setTo(email);
		
		String subject = "Here's the link to reset your password";
		String content = "<p> Hello, </p>"
				+ "<p>You heve requested to reset your password.</p>"
				+ "<p>Click the link below to change your password: </p>"
				+ "<p><b><a href=\""+ resetPasswordLink + "\">Change my password</a></b></p>"
				+ "<p>Ignore this email if you do remember your password, or you have not made the request to change password.</p>";
		
		helper.setSubject(subject);
		helper.setText(content, true);
		
		mailSender.send(message);
	}
	@GetMapping("/reset_password")
	public String showResetPasswordForm(@Param(value= "token") String token, Model model) {
		Mechanic mechanic = mechanic_repo.findResetPasswordToken(token);
		if (mechanic == null) {
			model.addAttribute("title", "Reset password");
			model.addAttribute("message", "Invalid Token");
			return "message";
		}
		model.addAttribute("token", token);
		model.addAttribute("pageTitle", "Reset your Password");
		return "reset_password_form";
	}
	@PostMapping("/reset_password")
	public String processResetPassword(HttpServletRequest request, Model model) {
		String token = request.getParameter("token");
		String password = request.getParameter("new_password");
		Mechanic mechanic = mechanic_repo.findResetPasswordToken(token);
		if (mechanic == null) {
			model.addAttribute("title", "Reset password");
			model.addAttribute("message", "Invalid Token");
		} else {
			password_service.updatePassword(mechanic, password);
			model.addAttribute("message", "You have successfully changed your password.");
		}
		return "message";
	}
}
