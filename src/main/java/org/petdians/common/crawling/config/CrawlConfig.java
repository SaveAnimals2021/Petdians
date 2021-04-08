package org.petdians.common.crawling.config;


import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"org.petdians.common.crawling.service"})
@MapperScan(basePackages= {"org.petdians.common.crawling.mapper"})
public class CrawlConfig {
}
