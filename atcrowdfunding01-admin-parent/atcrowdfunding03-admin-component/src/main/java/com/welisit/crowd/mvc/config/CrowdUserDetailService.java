package com.welisit.crowd.mvc.config;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import com.welisit.crowd.entity.Admin;
import com.welisit.crowd.entity.Role;
import com.welisit.crowd.service.api.AdminService;
import com.welisit.crowd.service.api.AuthService;
import com.welisit.crowd.service.api.RoleService;

/**
 * 用于springSecurity用户验证时获取用户信息
 * @author Administrator
 *
 */
@Component
public class CrowdUserDetailService implements UserDetailsService{

	@Autowired
	private AdminService adminService;
	
	@Autowired
	private RoleService roleService;
	
	@Autowired
	private AuthService authService;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Admin admin = adminService.getAdminByLoginAcct(username);
		Integer adminId = admin.getId();
		// 获取角色权限
		List<Role> roleList = roleService.getAssignedRole(adminId);
		List<String> authNameList = authService.getAuthNameByAdminId(adminId);
		List<GrantedAuthority> authorities = new ArrayList<>();
		for (Role role : roleList) {
			String roleName = role.getName();
			authorities.add(new SimpleGrantedAuthority("ROLE_" + roleName));
		}
		for (String authName : authNameList) {
			authorities.add(new SimpleGrantedAuthority(authName));
		}
		return new SecurityAdmin(admin, authorities);
	}

}
