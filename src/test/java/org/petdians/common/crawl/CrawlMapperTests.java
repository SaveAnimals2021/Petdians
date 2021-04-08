package org.petdians.common.crawl;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.crawling.config.CrawlConfig;
import org.petdians.common.crawling.domain.CrawlResultVO;
import org.petdians.common.crawling.mapper.CrawlMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;
import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class CrawlMapperTests {

    @Autowired
    CrawlMapper mapper;

    @Test
    public void testRegister(){
        log.info(mapper);
        CrawlResultVO vo = new CrawlResultVO();
        mapper.register(vo);
    }

    @Test
    public void testDelete(){
        log.info(mapper);
        CrawlResultVO vo = new CrawlResultVO();
        mapper.delete(1);
    }

    @Test
    public void testGetList() {
        try {
            List<CrawlResultVO> list = mapper.getListByDay(1);
            list.forEach(c->log.info(c));

        } catch(Exception e){
            e.printStackTrace();
        }

    }

    @Test
    public void testDummy(){
        log.info(mapper);

        for(int i = 0; i < 7; ++i) {
            Date date = new Date();
            date.setTime(date.getTime() - 1000 * 60 * 60 * 24 * i + 1000 * 60 * 60 * 9);
            Integer random1 = 40 + (int) (Math.random() * 100);
            Integer random2 = 30 + (int) (Math.random() * 90);
            Integer random3 = 20 + (int) (Math.random() * 80);
            Integer random4 = 10 + (int) (Math.random() * 70);

            CrawlResultVO vo = CrawlResultVO.builder()
                    .crawlCount(1388).crawlDate(date).newDataCount(140).modDataCount(95).totalDataCount(869).takingTime("05분 59초")
                    .adoptedCount(random4).missingCount(random1).rescuedCount(random2).witnessedCount(random3)
                    .build();
            mapper.register(vo);
        }
    }

}
