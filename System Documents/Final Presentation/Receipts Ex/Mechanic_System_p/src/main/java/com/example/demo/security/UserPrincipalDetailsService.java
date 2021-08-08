package com.example.demo.security; 

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Clerk_Repo;
import com.example.demo.dao.Doctor_Repo;
import com.example.demo.model.Clerk;
import com.example.demo.model.Doctor;

@Service
public class UserPrincipalDetailsService implements UserDetailsService {
    private Doctor_Repo doctor_repo;
    private Clerk_Repo clerk_repo;

    public UserPrincipalDetailsService(Doctor_Repo doctor_repo, Clerk_Repo clerk_repo) {
        this.doctor_repo = doctor_repo;
        this.clerk_repo = clerk_repo;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    	Clerk clerk = this.clerk_repo.findByEmail(email);
    	UserPrincipal_ins userPrincipal = new UserPrincipal_ins(clerk);
    	if (clerk == null) {
    		Doctor doctor = this.doctor_repo.findByEmail(email);
        	UserPrincipal UserPrincipal = new UserPrincipal(doctor);
        	return UserPrincipal;
		}
		return userPrincipal;
    }
}