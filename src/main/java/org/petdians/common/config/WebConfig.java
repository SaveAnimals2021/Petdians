package org.petdians.common.config;

import org.petdians.admin.config.AdminConfig;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.aop.config.AopConfig;
import org.petdians.batch.config.AnimalJobConfig;
import org.petdians.common.crawling.config.CrawlConfig;
import org.petdians.pet.config.PetConfig;
import org.petdians.petbot.config.PetbotConfig;
import org.petdians.user.config.UserConfig;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebConfig extends AbstractAnnotationConfigDispatcherServletInitializer {

    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[]{
                CommonConfig.class, AnimalConfig.class, AnimalJobConfig.class, CrawlConfig.class, AopConfig.class
                , PetbotConfig.class, UserConfig.class, PetConfig.class, SecurityConfig.class, AdminConfig.class
        };
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[]{ServletConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        return new String[]{"/"};
    }
}
