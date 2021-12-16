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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.util.UrlPathHelper;

import com.sist.b.user.UserVO;

import lombok.AllArgsConstructor;

@Configuration
@EnableWebSecurity
@AllArgsConstructor
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	public void configure(WebSecurity web) throws Exception {
		// 정적 자원 요청 URL은 Security 거치지 않고 통과
		web.ignoring()
					.antMatchers("/css/**")
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
								.antMatchers("/account/login/**").permitAll()
								.antMatchers("/account/idCheck").permitAll()
								.antMatchers("/account/password/reset").permitAll()
								.antMatchers("/account/challenge").permitAll()
								.antMatchers("/account/recovery").permitAll()
								.antMatchers("/account/mail").permitAll()
								.antMatchers("/account/clause").permitAll()
								.antMatchers("/post/**").hasRole("USER")
								.antMatchers("/search/tag/**").hasRole("USER")
								.antMatchers("/explore/**").hasRole("USER")
								.antMatchers("/account/**").hasRole("USER")
								.antMatchers("/admin/**").hasRole("ADMIN")
								.antMatchers("/friendships/**").hasRole("USER")
								.antMatchers("/*").hasRole("USER")
								.antMatchers("/chat/**").hasRole("USER")
								.antMatchers("/").authenticated()
								//.antMatchers("/account/signup").permitAll()
								//.antMatchers("/account/signup").not().hasRole("USER")
								//.anyRequest().authenticated()
								.and()
			.formLogin()
						.loginPage("/account/login")
						.successHandler(new AuthenticationSuccessHandler() {
							
							@Override
							public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
									Authentication authentication) throws IOException, ServletException {
								UserVO userVO = (UserVO)authentication.getPrincipal();
								System.out.println(userVO.getUsername() + " - LOGIN SUCCESS");
								
								response.sendRedirect("/gram");
								
							}
						})
						.permitAll()
						.failureHandler(new AuthenticationFailureHandler() {
							
							@Override
							//로그인 실패 시
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
