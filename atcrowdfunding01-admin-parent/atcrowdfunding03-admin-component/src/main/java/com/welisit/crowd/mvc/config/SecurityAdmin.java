package com.welisit.crowd.mvc.config;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.welisit.crowd.entity.Admin;

public class SecurityAdmin extends User{
	
	private static final long serialVersionUID = 232L;
	
	private Admin originalAdmin;

	public SecurityAdmin(Admin originalAdmin, Collection<GrantedAuthority> authorities) {
		super(originalAdmin.getUserName(), originalAdmin.getUserPswd(), authorities);
		this.originalAdmin = originalAdmin;
		// 擦除密码
		this.originalAdmin.setUserPswd(null);
	}
	
	public Admin getOriginalAdmin() {
		return originalAdmin;
	}
	
}
