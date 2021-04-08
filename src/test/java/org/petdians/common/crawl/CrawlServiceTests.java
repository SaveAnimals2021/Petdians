package org.petdians.common.crawl;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.crawling.config.CrawlConfig;
import org.petdians.common.crawling.dto.CrawlResultDTO;
import org.petdians.common.crawling.service.CrawlService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class CrawlServiceTests {

    @Autowired
    CrawlService service;

    @Test
    public void testService(){
        CrawlResultDTO dto = new CrawlResultDTO();

        try{
            service.register(dto);
            List<CrawlResultDTO> list = service.getListByDay(1);
            list.forEach(c->log.info(c));
        } catch(Exception e){
            e.printStackTrace();
        }

    }

    @Test
    public void testList(){
        try{
            List<CrawlResultDTO> list = service.getListByDay(1);
            list.forEach(c->log.info(c));
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
