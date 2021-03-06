package org.petdians.crawl;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.crawling.config.CrawlConfig;
import org.petdians.crawling.dto.CrawlResultDTO;
import org.petdians.crawling.service.CrawlService;
import org.petdians.common.util.DateFormatter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class CrawlServiceTests {

    @Autowired
    CrawlService service;

    @Test
    public void testDate(){
        log.info(DateFormatter.fromDateToString(new Date()));
    }


    @Test
    public void testService(){
        CrawlResultDTO dto = new CrawlResultDTO();
        dto.setCrawlDate(DateFormatter.fromDateToString(new Date()));

        try{
            service.register(dto);
            List<CrawlResultDTO> list = service.getListByDay(7);
            list.forEach(c->log.info(c));
        } catch(Exception e){
            e.printStackTrace();
        }

    }

    @Test
    public void testList(){
        try{
            List<CrawlResultDTO> list = service.getListByDay(7);
            list.forEach(c->log.info(c));
        } catch(Exception e){
            e.printStackTrace();
        }
    }

}
