package org.petdians.security.config;


import org.mybatis.spring.annotation.MapperScan;
import org.petdians.security.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import javax.sql.DataSource;

@ComponentScan(basePackages = {"org.petdians.security.service"})
@MapperScan(basePackages = {"org.petdians.security.mapper"})
@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private DataSource dataSource;

    @Override
    public void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth
                .userDetailsService(customUserService())
                .passwordEncoder(passwordEncoder());


    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/petdiansAdmin/crawling/*").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/petdiansAdmin/petMap/*").access("hasRole('ROLE_ADMIN')")
                .antMatchers("/petdiansAdmin/member/*").access("hasRole('ROLE_ADMIN')");


        // some more method calls
        http.formLogin().loginPage("/petdiansAdmin/adminLogin").loginProcessingUrl("/login");
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService customUserService() {
        return new CustomUserDetailsService();
    }


}
