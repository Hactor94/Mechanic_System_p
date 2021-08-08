package com.example.demo.security; 

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.demo.dao.Insurance_Company_Repo;
import com.example.demo.dao.Mechanic_Repo;
import com.example.demo.model.Insurance_Company;
import com.example.demo.model.Mechanic;

@Service
public class UserPrincipalDetailsService implements UserDetailsService {
    private Mechanic_Repo Mechanic_Repo;
    private Insurance_Company_Repo insurance_repo;

    public UserPrincipalDetailsService(Mechanic_Repo Mechanic_Repo, Insurance_Company_Repo insurance_repo) {
        this.Mechanic_Repo = Mechanic_Repo;
        this.insurance_repo = insurance_repo;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
    	Insurance_Company insurance = this.insurance_repo.findByEmail(email);
    	UserPrincipal_ins userPrincipal = new UserPrincipal_ins(insurance);
    	if (insurance == null) {
    		Mechanic mechanic = this.Mechanic_Repo.findByEmail(email);
        	UserPrincipal UserPrincipal = new UserPrincipal(mechanic);
        	return UserPrincipal;
		}
		return userPrincipal;
    }
}