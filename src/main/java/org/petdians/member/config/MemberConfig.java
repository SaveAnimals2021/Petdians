package org.petdians.member.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages= {"org.petdians.member.service"})
@MapperScan(basePackages= {"org.petdians.member.mapper"})
public class MemberConfig {
}
