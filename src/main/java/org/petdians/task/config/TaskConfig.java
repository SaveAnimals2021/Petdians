package org.petdians.task.config;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;

@Configuration
@ComponentScan(basePackages = {"org.petdians.task.component"})
@MapperScan(basePackages= {"org.petdians.task.mapper"})
@EnableScheduling
public class TaskConfig {



}
