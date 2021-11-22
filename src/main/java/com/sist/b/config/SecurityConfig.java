package com.sist.b.config;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.web.util.UrlPathHelper;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
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
								.antMatchers("/account/signup").not().hasRole("USER")
								.antMatchers("/account/edit/**").hasRole("USER")
								
								.antMatchers("/").authenticated()
								//.antMatchers("/account/signup").permitAll()
								//.antMatchers("/account/signup").not().hasRole("USER")
								//.anyRequest().authenticated()
								.and()
			.formLogin()
						.loginPage("/account/login")
						.defaultSuccessUrl("/")
						.permitAll()
						.failureHandler(new AuthenticationFailureHandler() {
							
							@Override
							public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
									AuthenticationException exception) throws IOException, ServletException {
								// TODO Auto-generated method stub
								System.out.println("A user has failed to login. ERROR : "+exception.getMessage());
							//	UrlPathHelper helper = new UrlPathHelper();
								
								response.sendRedirect("/gram/account/login?error=true");
							}
						})
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

	@Bean
	@Override
	public AuthenticationManager authenticationManagerBean() throws Exception {
		// TODO Auto-generated method stub
		return super.authenticationManagerBean();
	}
	

}
