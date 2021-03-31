package org.petdians.animal;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.domain.MissingAnimalVO;
import org.petdians.animal.mapper.AnimalInfoMapper;
import org.petdians.common.config.CommonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.Date;


@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes={CommonConfig.class, AnimalConfig.class})
public class AnimalInfoMapperTests {

    @Autowired
    AnimalInfoMapper mapper;

    @Test
    public void testMapper(){
        log.info("mapper : " + mapper);

        Date date = new Date();

        MissingAnimalVO vo = MissingAnimalVO.builder()
                .animalCode("testCode").serviceName("testService").type("testType").name("testName").species("testSpecies")
                .sex("testSex").age("testAge").special("testSpecial").color("testColor")
                .regDate(date).build();
        mapper.register(vo);
        log.info("AnimalNumber : " + vo.getAnimalNumber());
    }

    @Test
    public void testAllList(){
        log.info("mapper : " + mapper);
        mapper.getAllList();
        log.info("============ mapper done ============");
    }


}
