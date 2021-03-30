package org.petdians.common.mapper;


import lombok.extern.log4j.Log4j;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.petdians.animal.config.AnimalConfig;
import org.petdians.animal.mapper.AnimalInfoMapper;
import org.petdians.common.config.CommonConfig;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


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


}
