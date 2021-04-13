package org.petdians.crawling.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"org.petdians.crawling.service"})
@MapperScan(basePackages= {"org.petdians.crawling.mapper"})
public class CrawlConfig {
}
