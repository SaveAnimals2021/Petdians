package org.petdians.animal.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;


@Configuration
@ComponentScan(basePackages= {"org.petdians.animal.service"})
@MapperScan(basePackages= {"org.petdians.animal.mapper"})
public class AnimalConfig {

    

}
