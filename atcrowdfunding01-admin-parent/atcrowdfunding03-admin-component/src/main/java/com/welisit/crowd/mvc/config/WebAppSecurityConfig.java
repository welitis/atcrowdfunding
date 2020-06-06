package com.welisit.crowd.mvc.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

@Configuration
@EnableWebSecurity
@EnableGlobalMethodSecurity(prePostEnabled = true)
public class WebAppSecurityConfig extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
//	@Bean
//	public BCryptPasswordEncoder getBCryptPasswordEncoder() {
//		return new BCryptPasswordEncoder();
//	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder builder) throws Exception {
//		builder.inMemoryAuthentication()
//			.withUser("admin")
//			.password("123123")
//			.roles("ADMIN");
		builder.userDetailsService(userDetailsService)
			.passwordEncoder(passwordEncoder);
	}

	@Override
	protected void configure(HttpSecurity security) throws Exception {
		security.authorizeRequests()
		.antMatchers("/admin/to/login/page.html", "/bootstrap/**", "/crowd/**", "/css/**", "/fonts/**", "/ztree/**","/img/**","/jquery/**","/layer/**","/script/**")
		.permitAll()
		.anyRequest()
		.authenticated()
		.and()
		.formLogin()
		.loginPage("/admin/to/login/page.html")
		.loginProcessingUrl("/security/do/login.html")
		.defaultSuccessUrl("/admin/to/main/page.html")
		.usernameParameter("loginAcct")
		.passwordParameter("userPswd")
		.and()
		.csrf()
		.disable()
		.logout()
		.logoutUrl("/security/do/logout.html")
		.logoutSuccessUrl("/admin/to/main/page.html")
		;
	}
	
	
	
}