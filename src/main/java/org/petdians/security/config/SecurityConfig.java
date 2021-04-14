package org.petdians.security.config;


import lombok.extern.log4j.Log4j;
import org.mybatis.spring.annotation.MapperScan;
import org.petdians.security.service.CustomAccessDeniedHandler;
import org.petdians.security.service.CustomLoginSuccessHandler;
import org.petdians.security.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.RememberMeAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import javax.sql.DataSource;

@Log4j
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

        http.exceptionHandling().accessDeniedHandler(customAccessDeniedHandler());

        // some more method calls
        http.formLogin().loginPage("/petdiansAdmin/adminLogin").loginProcessingUrl("/login")
                .successHandler(customSuccessLoginHandler());

        http.logout()
                .invalidateHttpSession(true);
                //.deleteCookies("remember-me", "JSESSION_ID");

        http.authenticationProvider(rememberMeAuthenticationProvider())
                .rememberMe()
                .key("PETDIANS")
                .tokenRepository(persistentTokenRepository())
                .tokenValiditySeconds(604800);
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public UserDetailsService customUserService() {
        return new CustomUserDetailsService();
    }

    @Bean
    public AccessDeniedHandler customAccessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }

    @Bean
    public AuthenticationSuccessHandler customSuccessLoginHandler(){
        return new CustomLoginSuccessHandler();
    }

    @Bean
    public PersistentTokenRepository persistentTokenRepository() {

        JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
        repo.setDataSource(dataSource);
        log.info("dataSource : " + dataSource);
        return repo;
    }

    @Bean
    public AuthenticationProvider rememberMeAuthenticationProvider() {
        return new RememberMeAuthenticationProvider("PETDIANS");
    }
}
