package org.petdians.common.mapper;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.mapper.AnimalInfoMapper;
import org.petdians.common.config.CommonConfig;
import org.petdians.common.dto.PageDTO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Arrays;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={CommonConfig.class, AnimalConfig.class})
public class AnimalInfoMapperTests {

    @Autowired
    AnimalInfoMapper mapper;

    @Test
    public void testMapper(){
//        log.info("mapper : " + mapper);
//
//        Date date = new Date();
//
//        AnimalInfoVO vo = AnimalInfoVO.builder()
//                .animalCode("testCode").serviceName("testService").type("testType").name("testName").species("testSpecies")
//                .sex("testSex").age("testAge").weight("testWeight").special("testSpecial").color("testColor")
//                .date(date).build();
//
//        mapper.register(vo);
    }

    @Test
    public void testAllList(){
        log.info("mapper : " + mapper);
        mapper.getAllList().forEach(a->log.info(a));
        log.info("============ mapper done ============");
    }

    @Test
    public void testPagedList(){
        PageDTO pageDTO = new PageDTO();
        pageDTO.setType("t");
        pageDTO.setKeyword("개");
        pageDTO.setDay("1");

        log.info("mapper : " + mapper);
        mapper.getPagedList(pageDTO.getSkip(), pageDTO.getPage(), pageDTO.getArr(), pageDTO.getKeyword(), pageDTO.getDay()).forEach(a->log.info(a));
        log.info("============ mapper done ============");
    }

    @Test
    public void testGetTotalCount(){
        PageDTO pageDTO = new PageDTO();
        pageDTO.setType("t");
        pageDTO.setKeyword("개");
        log.info(pageDTO.getArr());
        log.info(pageDTO.getKeyword());
        log.info("mapper : " + mapper);
        log.info(mapper.getTotalCount(pageDTO.getArr(), pageDTO.getKeyword(), pageDTO.getDay()));
        log.info("============ mapper done ============");
    }

}
