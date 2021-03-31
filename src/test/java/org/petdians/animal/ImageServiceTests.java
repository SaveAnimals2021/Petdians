package org.petdians.animal;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.service.ImageService;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.crawling.config.CrawlConfig;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.beans.factory.annotation.Autowired;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class ImageServiceTests {

    @Autowired
    ImageService service;

    @Test
    public void testDownloadAll(){
        try {
            service.downloadAll();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

}
