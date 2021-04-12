package org.petdians.admin.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages= {"org.petdians.admin.service"})
@MapperScan(basePackages= {"org.petdians.admin.mapper"})
public class AdminConfig {
}
