package org.petdians.animal;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.domain.ImageVO;
import org.petdians.animal.mapper.ImageMapper;
import org.petdians.common.config.CommonConfig;
import org.petdians.crawling.config.CrawlConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {CommonConfig.class, AnimalConfig.class, CrawlConfig.class})
public class ImageMapperTests {

    @Autowired
    ImageMapper mapper;

    @Test
    public void testGetList(){
        List<ImageVO> list = mapper.getImageByAno(9605);
        list.forEach(i->log.info(i));
    }
}
