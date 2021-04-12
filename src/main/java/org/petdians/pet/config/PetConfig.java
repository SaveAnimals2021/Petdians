package org.petdians.pet.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages= {"org.petdians.pet.service"})
@MapperScan(basePackages= {"org.petdians.pet.mapper"})
public class PetConfig {
}
