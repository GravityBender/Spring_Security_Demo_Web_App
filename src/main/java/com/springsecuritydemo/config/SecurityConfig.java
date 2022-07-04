package com.springsecuritydemo.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.provisioning.JdbcUserDetailsManager;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class SecurityConfig {


    @Autowired
    private DataSource securityDataSource;

    @Bean
    public UserDetailsManager users(){
        return new JdbcUserDetailsManager(securityDataSource);
    }

//    @Bean
//    public InMemoryUserDetailsManager userDetailsService(){
//        User.UserBuilder users = User.withDefaultPasswordEncoder();
//
//        UserDetails user1 = users
//                .username("John")
//                .password("password1")
//                .roles("EMPLOYEE")
//                .build();
//
//        UserDetails user2 = users
//                .username("Mary")
//                .password("password2")
//                .roles("EMPLOYEE", "MANAGER")
//                .build();
//
//        UserDetails user3 = users
//                .username("Susan")
//                .password("password3")
//                .roles("EMPLOYEE", "ADMIN")
//                .build();
//
//        return new InMemoryUserDetailsManager(user1, user2, user3);
//    }
//
    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception{
//        http.authorizeRequests()
//                .anyRequest().authenticated()
//                .and()
//                .formLogin()
//                    .loginPage("/showMyLoginPage")
//                    .loginProcessingUrl("/authenticateTheUser")
//                    .permitAll()
//                .and()
//                .logout().permitAll();

        http.authorizeRequests()
                .antMatchers("/").hasRole("EMPLOYEE")
                .antMatchers("/leaders/**").hasRole("MANAGER")
                .antMatchers("/systems/**").hasRole("ADMIN")
                .and()
                .formLogin()
                    .loginPage("/showMyLoginPage")
                    .loginProcessingUrl("/authenticateTheUser")
                    .permitAll()
                .and()
                .logout().permitAll()
                .and()
                .exceptionHandling().accessDeniedPage("/access-denied");


        // Another method of doing the same
//        http.authorizeHttpRequests()
//                .anyRequest().authenticated()
//                .and()
//                .formLogin()
//                    .loginPage("/showMyLoginPage")
//                    .loginProcessingUrl("/authenticateTheUser")
//                    .permitAll();

        return http.build();
    }

}
