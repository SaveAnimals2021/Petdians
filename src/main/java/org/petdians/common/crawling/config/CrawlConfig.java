package org.petdians.common.crawling.config;




import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

@Configuration
@ComponentScan(basePackages = {"org.petdians.common.crawling.service"})
public class CrawlConfig {
}
