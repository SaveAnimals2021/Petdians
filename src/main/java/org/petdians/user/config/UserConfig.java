package org.petdians.user.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages= {"org.petdians.user.service"})
@MapperScan(basePackages= {"org.petdians.user.mapper"})
public class UserConfig {
}
