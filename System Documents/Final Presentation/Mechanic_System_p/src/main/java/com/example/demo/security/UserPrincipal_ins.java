package com.example.demo.security;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import com.example.demo.model.Insurance_Company;
import java.util.Collection;
import java.util.ArrayList;
import java.util.List;

public class UserPrincipal_ins implements UserDetails {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Insurance_Company insurance;
	
	public UserPrincipal_ins(Insurance_Company insurance){
        this.insurance = insurance;
    }
	
	@Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        List<GrantedAuthority> authorities = new ArrayList<>();

        // Extract list of permissions (name)
        this.insurance.getPermissionList().forEach(p -> {
            GrantedAuthority authority = new SimpleGrantedAuthority(p);
            authorities.add(authority);
        });

        // Extract list of roles (ROLE_name)
        this.insurance.getRoleList().forEach(r -> {
            GrantedAuthority authority = new SimpleGrantedAuthority("ROLE_" + r);
            authorities.add(authority);
        });

        return authorities;
    }

    @Override
    public String getPassword() {
        return this.insurance.getPassword(); 
    }

    @Override
    public String getUsername() {
        return this.insurance.getEmail();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }
    @Override
    public boolean isEnabled() {
        return this.insurance.getActive() == 1;
    }
}