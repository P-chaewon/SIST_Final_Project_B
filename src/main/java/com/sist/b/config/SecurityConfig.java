package com.sist.b.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		// 정적 자원 요청 URL은 Security 거치지 않고 통과
		web.ignoring()
					.antMatchers("/gram/css/**")
					.antMatchers("/js/**")
					.antMatchers("/images/**")
					.antMatchers("/fonts/**")
					.antMatchers("/icons/**")
					.antMatchers("/vendor/**")
					.antMatchers("/favicon*/**")
					.antMatchers("/resources/**")
					.antMatchers("/front/**");	
	}
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
			.cors()
			.and()
			.csrf().disable()
			.authorizeRequests()
								//.anyRequest().permitAll()
								.antMatchers("/account/signup").permitAll()
								.antMatchers("/account/edit/*").hasRole("USER")
								
								.antMatchers("/").authenticated()
								//.antMatchers("/account/signup").permitAll()
								//.antMatchers("/account/signup").not().hasRole("USER")
								//.anyRequest().authenticated()
								.and()
			.formLogin()
						.loginPage("/account/login")
						.defaultSuccessUrl("/")
						.permitAll()
						.and()
			.logout()
						.logoutUrl("/account/logout")
						.logoutSuccessUrl("/account/login")
						.invalidateHttpSession(true)
						.deleteCookies("JSESSIONID")
						.permitAll()
						
								;
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}
}
