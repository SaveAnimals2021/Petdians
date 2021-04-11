package org.petdians.petbot.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"org.petdians.petbot.service"})
@MapperScan(basePackages= {"org.petdians.petbot.mapper"})
public class PetbotConfig {
}
